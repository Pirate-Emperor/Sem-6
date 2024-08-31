-- Initialization
SET @database_name = 'assignment';
SET @drop_procedures = 'assignmentDropProcedure';

-- Table
CREATE TABLE Deadlock_Info (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    requesting_node INT,
    holding_node INT
);

-- Deletion
DELETE FROM 'Deadlock_Info';
-- Insertion 
INSERT INTO `Deadlock_Info` (requesting_node, holding_node) VALUES (1,3);
INSERT INTO `Deadlock_Info` (requesting_node, holding_node) VALUES (2,3);
INSERT INTO `Deadlock_Info` (requesting_node, holding_node) VALUES (1,4);
INSERT INTO `Deadlock_Info` (requesting_node, holding_node) VALUES (1,2);
INSERT INTO `Deadlock_Info` (requesting_node, holding_node) VALUES (3,2);

-- Show All Procedures
SHOW PROCEDURE STATUS WHERE db=@database_name;

-- Drop Procedures
DROP PROCEDURE InsertDeadlockInfo;
DROP PROCEDURE RemoveDeadlockInfo;
DROP PROCEDURE DepthFirstSearch;
DROP PROCEDURE DetectDeadlock;


-- Insert Procedure
DELIMITER //
CREATE PROCEDURE InsertDeadlockInfo(IN requesting INT, IN holding INT)
BEGIN
    INSERT INTO deadlock_info (requesting_node, holding_node) VALUES (requesting, holding);
END //
DELIMITER ;

-- Remove Procedure
DELIMITER //
CREATE PROCEDURE RemoveDeadlockInfo(IN requesting INT, IN holding INT)
BEGIN
    DELETE FROM deadlock_info WHERE requesting_node = requesting AND holding_node = holding;
END //
DELIMITER ;

-- DFS Procedure
DELIMITER //
CREATE PROCEDURE DepthFirstSearch(IN start_node INT, IN current_node INT, OUT result INT)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE next_node INT;
    SET result = 0;

    CREATE TEMPORARY TABLE IF NOT EXISTS dfs_stack (
        node INT
    );

    INSERT INTO dfs_stack
    SELECT holding
    FROM wait_for_graph
    WHERE requesting = current_node;
    DELETE FROM wait_for_graph WHERE requesting = current_node;

    IF (SELECT COUNT(*) FROM dfs_stack) > 0 THEN
        SET done = 0;
    ELSE
        SET done = 1;
    END IF;

    dfs_loop: WHILE done = 0 DO
        SELECT node INTO current_node FROM dfs_stack ORDER BY node DESC LIMIT 1;
        DELETE FROM dfs_stack ORDER BY node DESC LIMIT 1;
        SELECT CONCAT("Current Node: ",current_node) as message;
        IF current_node = start_node THEN
            SELECT 'Deadlock detected: Cycle from ', start_node, ' to ', current_node;
            SET done = 1;
            SET result = 1;
        ELSE
            INSERT INTO dfs_stack
            SELECT holding
            FROM wait_for_graph
            WHERE requesting = current_node;
            DELETE FROM wait_for_graph WHERE requesting = current_node;
        END IF;

        IF (SELECT COUNT(*) FROM dfs_stack) > 0 THEN
            SET done = 0;
        ELSE
            SET done = 1;
        END IF;
    END WHILE;
    DROP TEMPORARY TABLE IF EXISTS dfs_stack;
END //
DELIMITER ;

-- Detect Deadlock Procedure
DELIMITER //
CREATE PROCEDURE DetectDeadlock()
BEGIN
    DECLARE result INT DEFAULT 0;
    DECLARE temp INT DEFAULT 0;
    DECLARE start_node INT;
    DECLARE current_node INT;
    DECLARE done INT DEFAULT 0;

    CREATE TEMPORARY TABLE IF NOT EXISTS wait_for_graph (
        requesting INT,
        holding INT
    );

    INSERT INTO wait_for_graph SELECT requesting_node, holding_node FROM deadlock_info;
    SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    CREATE TEMPORARY TABLE IF NOT EXISTS distinct_nodes (
        node INT
    );

    INSERT INTO distinct_nodes
    SELECT DISTINCT requesting
    FROM wait_for_graph;

    WHILE (SELECT COUNT(*) FROM distinct_nodes) > 0 DO
        SELECT node INTO start_node FROM distinct_nodes ORDER BY node LIMIT 1;
        DELETE FROM distinct_nodes WHERE node = start_node;
        
        SELECT CONCAT("Start Node: ",start_node) as message;
        CALL DepthFirstSearch(start_node, start_node, temp);
        IF temp = 1 THEN
            SET result = 1;
        END IF;
        DELETE FROM wait_for_graph;
        INSERT INTO wait_for_graph SELECT requesting_node, holding_node FROM deadlock_info;
    END WHILE;
    IF result = 0  THEN
        SELECT "No Deadlock Detected!" as message;
    ELSE 
        SELECT "Deadlock Detected!" as message;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS wait_for_graph;
    DROP TEMPORARY TABLE IF EXISTS distinct_nodes;
END //

DELIMITER ;

-- Call Detect Deadlock
CALL DetectDeadlock();
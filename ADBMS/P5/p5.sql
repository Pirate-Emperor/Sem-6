-- DEADLOCK DETECTION ALGORITHM FOR DISTRIBUTED DATABASE USING WAIT-FOR GRAPH
-- Aim: To implement Deadlock Detection Algorithm for Distributed Database using Wait-for Graph to check for Deadlock.

-- Transaction_Lock Table
CREATE TABLE Transaction_Locks (
    transaction_id INT PRIMARY KEY,
    lock_time INT,
    waits_for_transaction_time INT,
    locked_resource_id INT
);

-- WaitforGraph Table


-- Insertion 
INSERT INTO `Transaction_Locks` VALUES (1,3,5,1);
INSERT INTO `Transaction_Locks` VALUES (1,3,5,2);
INSERT INTO `Transaction_Locks` VALUES (2,3,5,3);
INSERT INTO `Transaction_Locks` VALUES (2,3,5,2);
INSERT INTO `Transaction_Locks` VALUES (3,3,5,3);
INSERT INTO `Transaction_Locks` VALUES (4,3,5,1);

-- Deadlock Detection Procedure using Wait-For Graph approach
DELIMITER $$

CREATE PROCEDURE DetectDeadlock()
BEGIN

    CREATE TEMPORARY TABLE WaitforGraph (
        transaction_id INT,
        waits_for_transaction_id INT,
        PRIMARY KEY (transaction_id, waits_for_transaction_id)
    );
    INSERT INTO WaitforGraph (transaction_id, waits_for_transaction_id)
    SELECT
        requesting_tx.transaction_id,
        holding_tx.transaction_id
    FROM
        transaction_locks AS requesting_tx
    JOIN
        transaction_locks AS holding_tx ON requesting_tx.locked_resource_id = holding_tx.locked_resource_id
    WHERE
        requesting_tx.transaction_id <> holding_tx.transaction_id;


    WITH RECURSIVE FindCycle(transaction_id, waits_for_transaction_id, path) AS (
        SELECT
            transaction_id,
            waits_for_transaction_id,
            CAST(CONCAT(transaction_id, '->', waits_for_transaction_id) AS CHAR(1000)) AS path
        FROM
            WaitforGraph
        UNION ALL
        SELECT
            wg.transaction_id,
            wg.waits_for_transaction_id,
            CONCAT(fc.path, '->', wg.waits_for_transaction_id)
        FROM
            FindCycle AS fc
        JOIN
            WaitforGraph AS wg ON fc.waits_for_transaction_id = wg.transaction_id
        WHERE
            POSITION(CONVERT(wg.transaction_id, CHAR) IN fc.path) = 0
    )
    SELECT
        'Deadlock detected: ' AS message,
        path
    FROM
        FindCycle
    WHERE
        transaction_id = (SELECT MIN(transaction_id) FROM FindCycle);


    DROP TEMPORARY TABLE WaitforGraph;
END$$

DELIMITER ;

-- Call DetectDeadlock()
Call DetectDeadlock();
-- Drop DetectDeadlock
DROP PROCEDURE DetectDeadlock;
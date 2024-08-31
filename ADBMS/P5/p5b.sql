
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    lock_id INT,
    wait_id INT,
    site_id INT
);


INSERT INTO transactions (transaction_id, lock_id, wait_id, site_id) VALUES
(1, 101, 102, 1),
(2, 102, 103, 1),
(3, 103, 101, 1),
(4, 104, 105, 2),
(5, 105, 106, 2),
(6, 106, 104, 2);

-- Drop
DROP PROCEDURE detect_deadlock;
-- Drop Temp_transactions
DROP TEMPORARY TABLE IF EXISTS temp_transactions;

-- Procedure
DELIMITER $$

CREATE PROCEDURE detect_deadlock()
BEGIN
    DECLARE done_first BOOLEAN DEFAULT FALSE;
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE current_trans INT;
    DECLARE current_wait INT;
    DECLARE current_site INT;
    DECLARE current_lock INT;
    DECLARE temp_trans INT;
    DECLARE temp_wait INT;
    DECLARE first_cursor CURSOR FOR
            SELECT transaction_id, wait_id, site_id, lock_id
            FROM transactions;
    DECLARE temp_cursor CURSOR FOR
            SELECT transaction_id, wait_id
            FROM temp_transactions;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    CREATE TEMPORARY TABLE temp_transactions AS
        SELECT transaction_id, wait_id, lock_id, site_id FROM transactions;
    
    SELECT "Enter the Procedure" AS message;
    OPEN first_cursor;
    transactions_loop: LOOP
        FETCH first_cursor INTO current_trans, current_wait, current_lock, current_site;
        IF done THEN 
            SELECT "Exit the Procedure" AS message;
            LEAVE transactions_loop;
        END IF;
        
        
        OPEN temp_cursor;
        trans_loop: LOOP
            FETCH temp_cursor INTO temp_trans, temp_wait;
            IF done THEN LEAVE trans_loop;
            END IF;
            IF (temp_trans != current_trans) THEN
                IF (temp_wait = current_lock) THEN
                    
                    SELECT CONCAT("Deadlock detected: Transaction ", current_trans, " is waiting for ",temp_wait," on site ",current_site,".") AS message;
                    SET done = TRUE;
                    SELECT "Exit the Procedure" AS message;
                    LEAVE transactions_loop;
                END IF;
            END IF;
        END LOOP;
        CLOSE temp_cursor;
        
        DELETE FROM temp_transactions t WHERE t.transaction_id = current_trans;
    END LOOP;
    CLOSE first_cursor;

    SELECT CONCAT("Transaction Completed: Transaction ", current_trans, " is waiting for ",current_wait," on site ",current_site,".") AS message;
    IF NOT done_first THEN
        SELECT 'No deadlock detected.' As message;
    END IF;
    
    
    DROP TEMPORARY TABLE IF EXISTS temp_transactions;
END$$

DELIMITER ;

-- Call
CALL detect_deadlock();


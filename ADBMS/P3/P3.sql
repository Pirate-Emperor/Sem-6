-- Teacher Table
CREATE TABLE Teacher (
    t_no INT PRIMARY KEY,
    f_name VARCHAR(50) NOT NULL,
    l_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    supervisor INT,
    joining_date DATE NOT NULL,
    birth_date DATE NOT NULL,
    title VARCHAR(50) NOT NULL
);

-- Class Table
CREATE TABLE Class (
    class_no INT PRIMARY KEY,
    t_no INT,
    room_no INT,
    FOREIGN KEY (t_no) REFERENCES Teacher(t_no),
    UNIQUE KEY unique_teacher_class (t_no, room_no)
);

-- Pay_scale Table
CREATE TABLE Pay_scale (
    Min_limit DECIMAL(10, 2) NOT NULL,
    Max_limit DECIMAL(10, 2) NOT NULL,
    grade VARCHAR(10) PRIMARY KEY
);

-- Task 1 

DELIMITER //
CREATE PROCEDURE GetTeachersBySalaryRange(
    IN minSalary DECIMAL(10, 2),
    IN maxSalary DECIMAL(10, 2)
)
BEGIN
    SELECT *
    FROM Teacher
    WHERE salary BETWEEN minSalary AND maxSalary;
END //
DELIMITER ;

-- Task 2

DELIMITER //
CREATE PROCEDURE CalculateTeacherBonus()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE t_no_var INT;
    DECLARE salary_var DECIMAL(10, 2);
    DECLARE bonus_var DECIMAL(10, 2);
    DECLARE teacher_cursor CURSOR FOR
        SELECT t_no, salary
        FROM Teacher;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN teacher_cursor;
    teacher_loop: LOOP
        FETCH teacher_cursor INTO t_no_var, salary_var;
        IF done THEN
            LEAVE teacher_loop;
        END IF;
        IF salary_var < 10000 THEN
            SET bonus_var = salary_var * 0.10;
        ELSEIF salary_var BETWEEN 10000 AND 20000 THEN
            SET bonus_var = salary_var * 0.20;
        ELSEIF salary_var BETWEEN 20000 AND 25000 THEN
            SET bonus_var = salary_var * 0.25;
        ELSE
            SET bonus_var = salary_var * 0.30;
        END IF;
        SELECT t_no_var AS Teacher_ID, salary_var AS Salary, bonus_var AS Bonus;
    END LOOP;
    CLOSE teacher_cursor;
END //
DELIMITER ;

-- Task 3

DELIMITER //
CREATE PROCEDURE ListFirst10Teachers()
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE t_no_var INT;
    DECLARE f_name_var VARCHAR(50);
    DECLARE l_name_var VARCHAR(50);
    DECLARE salary_var DECIMAL(10, 2);
    DECLARE supervisor_var INT;
    DECLARE joining_date_var DATE;
    DECLARE birth_date_var DATE;
    DECLARE title_var VARCHAR(50);
    DECLARE teacher_cursor CURSOR FOR
        SELECT t_no, f_name, l_name, salary, supervisor, joining_date, birth_date, title
        FROM Teacher;
    OPEN teacher_cursor;
    teacher_loop: LOOP
        FETCH teacher_cursor INTO t_no_var, f_name_var, l_name_var, salary_var, supervisor_var, joining_date_var, birth_date_var, title_var;
        IF counter >= 10 OR t_no_var IS NULL THEN
            LEAVE teacher_loop;
        END IF;
        SET counter = counter + 1;
        SELECT t_no_var AS Teacher_ID, f_name_var AS First_Name, l_name_var AS Last_Name, salary_var AS Salary,
               supervisor_var AS Supervisor, joining_date_var AS Joining_Date, birth_date_var AS Birth_Date, title_var AS Title;
    END LOOP;
    CLOSE teacher_cursor;
END //
DELIMITER ;

-- Task 4

DELIMITER //
CREATE PROCEDURE GetTeachersByRoomNumber(IN roomNumber INT)
BEGIN
    SELECT t.t_no, t.f_name, t.l_name, t.birth_date, t.title
    FROM Teacher t
    JOIN Class c ON t.t_no = c.t_no
    WHERE c.room_no = roomNumber;
END //
DELIMITER ;


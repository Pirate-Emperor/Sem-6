-- A) Simulating a "Person" class:
Drop TABLE Person;

CREATE TABLE Person (
  objectId VARCHAR(100) PRIMARY KEY,
  name VARCHAR(100),
  age INT,
  address VARCHAR(200)
);

-- Dropping Procedures
DROP PROCEDURE DisplayDetails;
DROP PROCEDURE UpdateAge;
DROP PROCEDURE AppendPerson;

-- B) Simulating methods to display details and update age:

DELIMITER //

CREATE PROCEDURE DisplayDetails(IN object_id VARCHAR(100))
BEGIN
  SELECT name, age, address FROM Person WHERE objectId = object_id;
END //

CREATE PROCEDURE UpdateAge(IN object_id VARCHAR(100), IN new_age INT)
BEGIN
  UPDATE Person SET age = new_age WHERE objectId = object_id;
END //

CREATE PROCEDURE AppendPerson(IN object_id VARCHAR(100), IN person_name VARCHAR(100), IN new_age INT, IN person_address VARCHAR(100))
BEGIN
  INSERT INTO Person values (object_id, person_name, new_age, person_address);
END //

DELIMITER ;

-- Calling Procedures:

CALL AppendPerson("person1", "Rahul Kumar Singh", 20, "Raigarh");
CALL DisplayDetails("person1");
CALL UpdateAge("person1", 21);
CALL DisplayDetails("person1");

-- C) Simulating a method to calculate the annual bonus based on salary:
DROP TABLE Employee;
CREATE TABLE Employee (
  objectId VARCHAR(100) PRIMARY KEY,
  name VARCHAR(100),
  age INT,
  address VARCHAR(200),
  salary DECIMAL(10,2)
);
-- Dropping Procedures
DROP PROCEDURE DisplayEmpDetails;
DROP PROCEDURE AppendEmployee;
DROP PROCEDURE CalculateAnnualBonus;

DELIMITER //

CREATE PROCEDURE DisplayEmpDetails(IN object_id VARCHAR(100))
BEGIN
  SELECT * FROM Employee WHERE objectId = object_id;
END //

CREATE PROCEDURE AppendEmployee(IN object_id VARCHAR(100), IN person_name VARCHAR(100), IN new_age INT, IN person_address VARCHAR(100), IN salary DECIMAL(10,2))
BEGIN
  INSERT INTO Employee values (object_id, person_name, new_age, person_address, salary);
END //

CREATE PROCEDURE CalculateAnnualBonus(IN object_id VARCHAR(100))
BEGIN
  SELECT salary * 0.1 FROM Employee WHERE objectId = object_id; -- 10% bonus rate.
END //

DELIMITER ;

-- Calling Procedures
CALL AppendEmployee("employee1", "Rahul Kumar Singh", 20, "Raigarh", 10000.00);
CALL DisplayEmpDetails("employee1");
CALL CalculateAnnualBonus("employee1");

-- D) Simulating an "Employee" and "Manager" subclass:
Drop TABLE Manager;

CREATE TABLE Manager AS
SELECT * FROM Employee;

ALTER TABLE Manager
ADD num_employees_managed INT;

-- Dropping Procedures
DROP PROCEDURE DisplayManDetails;
DROP PROCEDURE CalculateManagerBonus;
DROP PROCEDURE AppendManager;

DELIMITER //

CREATE PROCEDURE DisplayManDetails(IN object_id VARCHAR(100))
BEGIN
  SELECT * FROM Manager WHERE objectId = object_id;
END //

CREATE PROCEDURE AppendManager(IN object_id VARCHAR(100), IN person_name VARCHAR(100), IN new_age INT, IN person_address VARCHAR(100), IN salary DECIMAL(10,2), IN num_emp INT)
BEGIN
  INSERT INTO Manager values (object_id, person_name, new_age, person_address, salary, num_emp);
END //

CREATE PROCEDURE CalculateManagerBonus(IN object_id VARCHAR(100))
BEGIN
  SELECT salary * 0.15 + num_employees_managed * 1000 FROM Manager WHERE objectId = object_id; -- Bonus
END //

DELIMITER ;

-- Calling Procedures
CALL AppendManager("manager1", "Rahul Kumar Singh", 20, "Raigarh", 10000.00, 10);
CALL DisplayManDetails("manager1");
CALL CalculateManagerBonus("manager1");
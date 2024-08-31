
-- A) Creating a class for a "Person":

CREATE OR REPLACE TYPE Person AS OBJECT (
  name    VARCHAR(100),
  age     INT,
  address VARCHAR(200),
  MEMBER PROCEDURE display_details,
  MEMBER PROCEDURE update_age(new_age INT)
);
/


-- B) Implementing methods in the "Person" class:

CREATE OR REPLACE TYPE BODY Person AS 
  MEMBER PROCEDURE display_details IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Name: ' || self.name);
    DBMS_OUTPUT.PUT_LINE('Age: ' || self.age);
    DBMS_OUTPUT.PUT_LINE('Address: ' || self.address);
  END display_details;

  MEMBER PROCEDURE update_age(new_age INT) IS
  BEGIN
    self.age := new_age;
  END update_age;
END;
/


-- C) Method to calculate the annual bonus in the "Employee" class:

CREATE OR REPLACE TYPE Employee UNDER Person (
  salary   INT,
  MEMBER FUNCTION calc_annual_bonus RETURN INT
);

CREATE OR REPLACE TYPE BODY Employee AS 
  MEMBER FUNCTION calc_annual_bonus RETURN INT IS
  BEGIN
    RETURN salary * 0.1; -- Assuming a 10% bonus rate.
  END calc_annual_bonus;
END;
/


-- D) Creating a "Manager" subclass:

CREATE OR REPLACE TYPE Manager UNDER Employee (
  num_employees_managed INT,
  OVERRIDING MEMBER FUNCTION calc_annual_bonus RETURN INT
);

CREATE OR REPLACE TYPE BODY Manager AS 
  OVERRIDING MEMBER FUNCTION calc_annual_bonus RETURN INT IS
  BEGIN
    RETURN salary * 0.15 + num_employees_managed * 1000; -- Bonus includes extra for each employee managed.
  END calc_annual_bonus;
    -- Making into Bonus for total employees
END;
/
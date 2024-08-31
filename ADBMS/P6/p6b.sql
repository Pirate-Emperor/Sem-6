
-- A) Creating a class for a "Person":

CREATE OR REPLACE TYPE Person AS OBJECT (
  name    VARCHAR2(100),
  age     NUMBER,
  address VARCHAR2(200),
  MEMBER PROCEDURE display_details,
  MEMBER PROCEDURE update_age(new_age NUMBER)
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

  MEMBER PROCEDURE update_age(new_age NUMBER) IS
  BEGIN
    self.age := new_age;
  END update_age;
END;
/


-- C) Method to calculate the annual bonus in the "Employee" class:

CREATE OR REPLACE TYPE Employee UNDER Person (
  salary   NUMBER,
  MEMBER FUNCTION calc_annual_bonus RETURN NUMBER
);

CREATE OR REPLACE TYPE BODY Employee AS 
  MEMBER FUNCTION calc_annual_bonus RETURN NUMBER IS
  BEGIN
    RETURN salary * 0.1; -- Assuming a 10% bonus rate.
  END calc_annual_bonus;
END;
/


-- D) Creating a "Manager" subclass:

CREATE OR REPLACE TYPE Manager UNDER Employee (
  num_employees_managed NUMBER,
  OVERRIDING MEMBER FUNCTION calc_annual_bonus RETURN NUMBER
);

CREATE OR REPLACE TYPE BODY Manager AS 
  OVERRIDING MEMBER FUNCTION calc_annual_bonus RETURN NUMBER IS
  BEGIN
    RETURN salary * 0.15 + num_employees_managed * 1000; -- Bonus includes extra for each employee managed.
  END calc_annual_bonus;
    -- Making into Bonus for total employees
END;
/
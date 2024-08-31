SET SERVEROUTPUT ON;

DECLARE
   subject1 NUMBER := 85;
   subject2 NUMBER := 92;
   subject3 NUMBER := 78;
   subject4 NUMBER := 90;
   subject5 NUMBER := 88;
   subject6 NUMBER := 95;
   total NUMBER;
   average NUMBER;
   grade VARCHAR2(2);

BEGIN
   total := subject1 + subject2 + subject3 + subject4 + subject5 + subject6;
   average := total / 6;

   IF average >= 90 THEN
      grade := 'A';
   ELSIF average >= 80 THEN
      grade := 'B';
   ELSIF average >= 70 THEN
      grade := 'C';
   ELSIF average >= 60 THEN
      grade := 'D';
   ELSE
      grade := 'F';
   END IF;

   DBMS_OUTPUT.PUT_LINE('Total: ' || total);
   DBMS_OUTPUT.PUT_LINE('Average: ' || average);
   DBMS_OUTPUT.PUT_LINE('Grade: ' || grade);
END;
/

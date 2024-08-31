-- Table Creation
CREATE TABLE student_scores (
   student_id NUMBER,
   sub1 NUMBER,
   sub2 NUMBER,
   sub3 NUMBER,
   sub4 NUMBER,
   sub5 NUMBER,
   sub6 NUMBER
);


-- Insertion
INSERT INTO student_scores VALUES (1, 85, 92, 78, 90, 88, 95);
INSERT INTO student_scores VALUES (2, 95, 88, 76, 82, 90, 87);
INSERT INTO student_scores VALUES (3, 85, 98, 66, 72, 60, 67);
INSERT INTO student_scores VALUES (4, 55, 88, 56, 72, 70, 77);
INSERT INTO student_scores VALUES (5, 65, 78, 26, 82, 60, 77);
INSERT INTO student_scores VALUES (6, 45, 68, 16, 52, 60, 57);
INSERT INTO student_scores VALUES (7, 95, 38, 86, 82, 80, 87);
INSERT INTO student_scores VALUES (8, 65, 58, 96, 62, 70, 57);
INSERT INTO student_scores VALUES (9, 75, 98, 66, 42, 10, 87);
INSERT INTO student_scores VALUES (10, 95, 88, 86, 12, 60, 57);


-- PL/SQL block to calculate total, average, and display grade
DECLARE
    v_student_id student_scores.student_id%TYPE;
    v_sub1 student_scores.sub1%TYPE;
    v_sub2 student_scores.sub2%TYPE;
    v_sub3 student_scores.sub3%TYPE;
    v_sub4 student_scores.sub4%TYPE;
    v_sub5 student_scores.sub5%TYPE;
    v_sub6 student_scores.sub6%TYPE;
    v_total NUMBER;
    v_average NUMBER;
    v_grade VARCHAR2(2);
BEGIN
    SELECT student_id, sub1, sub2, sub3, sub4, sub5, sub6
    INTO v_student_id, v_sub1, v_sub2, v_sub3, v_sub4, v_sub5, v_sub6
    FROM student_scores
    WHERE student_id = 1;


    -- Calculate total and average
    v_total := v_sub1 + v_sub2 + v_sub3 + v_sub4 + v_sub5 + v_sub6;
    v_average := v_total / 6;


    -- Grade Determination
    IF v_average >= 90 THEN
        v_grade := 'A';
    ELSIF v_average >= 80 THEN
        v_grade := 'B';
    ELSIF v_average >= 70 THEN
        v_grade := 'C';
    ELSIF v_average >= 60 THEN
        v_grade := 'D';
    ELSE
        v_grade := 'F';
    END IF;


    -- Results
    DBMS_OUTPUT.PUT_LINE('Student ID: ' || v_student_id);
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Average: ' || v_average);
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
END;
/

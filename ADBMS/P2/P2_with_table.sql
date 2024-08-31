SET SERVEROUTPUT ON;

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

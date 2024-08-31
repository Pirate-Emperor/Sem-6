<?php
function calculate_grade($marks) 
{
    if ($marks >= 60) echo "Grade: First Division";
    elseif ($marks >= 45 && $marks <= 59) echo "Grade: Second Division";
    elseif ($marks >= 33 && $marks <= 44) echo "Grade: Third Division";
    else echo "Grade: Fail";
}
$student_marks = 75;
echo "Marks: $student_marks<br>";
calculate_grade($student_marks);
?>

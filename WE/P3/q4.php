<?php
function calculate_factorial($number) 
{
    if ($number <= 1) return 1;
    else return $number * calculate_factorial($number - 1);
}
$number = 5;
$result = calculate_factorial($number);
echo "Factorial of $number is: $result";
?>

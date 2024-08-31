<?php
function calculate_factorial($number) 
{
    $factorial = 1;
    for ($i = 1; $i <= $number; $i++) $factorial *= $i;
    return $factorial;
}
$number = 5;
$result = calculate_factorial($number);
echo "Factorial of $number is: $result";
?>

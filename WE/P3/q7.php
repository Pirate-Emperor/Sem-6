<?php
function is_prime($number) 
{
    if ($number < 2) return false;
    for ($i = 2; $i <= sqrt($number); $i++) if ($number % $i == 0) return false;
    return true;
}
$prime_numbers = [];
$count = 0;
$i = 2;
while ($count < 20) 
{
    if (is_prime($i)) 
    {
        $prime_numbers[] = $i;
        $count++;
    }
    $i++;
}
echo "List of the first 20 prime numbers: ";
foreach($prime_numbers as $prime_number) echo "$prime_number ";
// print_r($prime_numbers);
?>

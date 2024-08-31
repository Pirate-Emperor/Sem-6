<?php
function calculate_electricity_bill($units) 
{
    $total_bill = 0;
    if ($units <= 50) $total_bill = $units * 3.50;
    elseif ($units <= 150) $total_bill = (50 * 3.50) + (($units - 50) * 4.00);
    elseif ($units <= 250) $total_bill = (50 * 3.50) + (100 * 4.00) + (($units - 150) * 5.20);
    else $total_bill = (50 * 3.50) + (100 * 4.00) + (100 * 5.20) + (($units - 250) * 6.50);
    return $total_bill;
}
$consumed_units = 200;
$bill_amount = calculate_electricity_bill($consumed_units);
echo "Units Consumed: $consumed_units<br>";
echo "Electricity Bill: Rs. $bill_amount";
?>

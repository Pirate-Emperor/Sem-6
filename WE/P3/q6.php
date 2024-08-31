<?php
function remove_element_by_value(&$array, $value) 
{
    $key = array_search($value, $array);
    if ($key !== false) $array = array_diff($array, array($array[$key]));
}
$months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
$value_to_remove = "March";
echo "Original Array: ";
foreach($months as $month) echo "($month) ";
remove_element_by_value($months, $value_to_remove);
echo "<br>Array after removing '$value_to_remove': ";
foreach($months as $month) echo "($month) ";
?>

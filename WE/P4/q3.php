<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $mainString = $_POST["mainString"];
    $subString = $_POST["subString"];
    if (strpos($mainString, $subString) !== false) echo "The main string contains the specified substring.";
    else echo "The main string does not contain the specified substring.";
}
?>

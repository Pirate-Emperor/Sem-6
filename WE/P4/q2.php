<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $inputString = $_POST["inputString"];
    $resultString = str_replace(' ', '', $inputString);
    echo "String after removing whitespaces: $resultString";
}
?>

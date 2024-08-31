<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $inputString = $_POST["inputString"];
    if (substr($inputString, 0, 2) !== 'if') $resultString = 'if ' . $inputString;
    else $resultString = $inputString;
    echo "Result string: $resultString";
}
?>

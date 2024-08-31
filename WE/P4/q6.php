<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $inputString = $_POST["inputString"];
    $resultString = preg_replace('/\bthe\b/', 'That', $inputString, 1);
    echo "String after replacement: $resultString";
}
?>

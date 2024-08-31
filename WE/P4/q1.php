<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $inputString = $_POST["inputString"];
    if (ctype_lower($inputString)) echo "The input string consists of lowercase characters only.";
    else echo "The input string contains non-lowercase characters.";
}
?>

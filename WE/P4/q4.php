<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["email"];
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) echo "The email is valid.";
    else echo "The email is not valid.";
}
?>
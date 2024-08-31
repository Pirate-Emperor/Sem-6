<?php
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    if (isset($_GET["name"])) {
        $name = $_GET["name"];
        echo "Name submitted using GET method: $name";
    }
} elseif ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["surname"])) {
        $surname = $_POST["surname"];
        echo "Surname submitted using POST method: $surname";
    }
} else echo "Invalid request method.";
?>

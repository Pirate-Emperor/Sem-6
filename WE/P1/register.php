<?php

$users = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirmPassword'];

    
    if ($password !== $confirmPassword) {
        echo "Passwords do not match.";
        exit();
    }

    
    if (in_array($username, array_column($users, 'username'))) {
        echo "Username already exists. Choose a different one.";
        exit();
    }

    
    $users[] = ['username' => $username, 'password' => password_hash($password, PASSWORD_DEFAULT)];

    echo "Registration successful for $username!";
}
?>

<?php

$users = [
    ['username' => 'john', 'password' => password_hash('john123', PASSWORD_DEFAULT)],
    ['username' => 'jane', 'password' => password_hash('jane456', PASSWORD_DEFAULT)],
];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    
    $user = array_filter($users, function ($user) use ($username) {
        return $user['username'] === $username;
    });

    if (count($user) === 1 && password_verify($password, reset($user)['password'])) {
        echo "Login successful for $username!";
    } else {
        echo "Invalid username or password.";
    }
}
?>

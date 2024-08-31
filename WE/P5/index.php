<?php
// Task 1: Create a database
$servername = "localhost";
$username = "root";
$password = "Iiit@Sur@t4";
$dbname = "my_db";
$conn = new mysqli($servername, $username, $password);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "CREATE DATABASE IF NOT EXISTS $dbname";
$conn->query($sql);
$conn->close();
// Task 2: Create a table
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "DROP TABLE IF EXISTS person";
// $conn->query($sql);
$sql = "CREATE TABLE IF NOT EXISTS person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    surName VARCHAR(50) NOT NULL,
    age INT
)";
$conn->query($sql);
$conn->close();
// Task 3: Insert some data
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "INSERT INTO person (firstName, surName, age) VALUES
    ('Rahul Kumar', 'Singh', 20),
    ('Hell', 'Hound', 30),
    ('Roman', 'Reigns', 48)";
// $conn->query($sql);
$conn->close();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Task 4: Insert data through HTML form
    if (isset($_POST['insertData']) && isset($_POST['firstName']) && isset($_POST['surName']) && isset($_POST['age'])) {
        $firstName = $_POST["firstName"];
        $surName = $_POST["surName"];
        $age = $_POST["age"];
        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
        $sql = "INSERT INTO person (firstName, surName, age) VALUES ('$firstName', '$surName', $age)";
        $conn->query($sql);
        $conn->close();
    }
    // Task 6: Update record with SQL query
    if (isset($_POST['updateRecord']) && isset($_POST['idToUpdate']) && isset($_POST['newAge'])) {
        $newAge = $_POST["newAge"];
        $idToUpdate = $_POST["idToUpdate"];
        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
        $sql = "UPDATE person SET age = $newAge WHERE id = $idToUpdate";
        $conn->query($sql);
        $conn->close();
    }
}
// Task 5: Select data with different queries
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "SELECT * FROM person";
$result = $conn->query($sql);
$sql = "SELECT * FROM person WHERE age > 25";
$result_filtered = $conn->query($sql);
$conn->close();


// Task 7: Display all tables in the database
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "SHOW TABLES";
$result_tables = $conn->query($sql);
$conn->close();
// Task 8: Display all databases
$conn = new mysqli($servername, $username, $password);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "SHOW DATABASES";
$result_databases = $conn->query($sql);
$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP Script</title>
</head>
<body>
<!-- Task 4: HTML form to insert data -->
<form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>" name="insertForm">
    <label for="firstName">First Name:</label>
    <input type="text" name="firstName" required>
    <label for="surName">Surname:</label>
    <input type="text" name="surName" required>
    <label for="age">Age:</label>
    <input type="number" name="age" required>
    <button type="submit" name="insertData">Insert Data</button>
</form>
<!-- Task 5a: Display selected data -->
<h2>Selected Data</h2>
<!-- Display all data -->
<?php while ($row = $result->fetch_assoc()) : ?>
    <p><?php echo $row["id"] . ". " . $row["firstName"] . " " . $row["surName"] . " - " . $row["age"] . " years old"; ?></p>
<?php endwhile; ?>
<!-- Task 5b: Display filtered data -->
<h2>Filtered Data (Age > 25)</h2>
<?php while ($row = $result_filtered->fetch_assoc()) : ?>
    <p><?php echo $row["id"] . ". " . $row["firstName"] . " " . $row["surName"] . " - " . $row["age"] . " years old"; ?></p>
<?php endwhile; ?>
<!-- Task 6: HTML form to update data -->
<h2>Update Record</h2>
<form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>" name="updateForm">
    <label for="idToUpdate">ID to Update:</label>
    <input type="number" name="idToUpdate" required>
    <label for="newAge">New Age:</label>
    <input type="number" name="newAge" required>
    <button type="submit" name="updateRecord">Update Record</button>
</form>
<!-- Task 7: Display all tables -->
<h2>All Tables in Database</h2>
<?php while ($row = $result_tables->fetch_row()) : ?>
    <p><?php echo $row[0]; ?></p>
<?php endwhile; ?>
<!-- Task 8: Display all databases -->
<h2>All Databases</h2>
<?php while ($row = $result_databases->fetch_row()) : ?>
    <p><?php echo $row[0]; ?></p>
<?php endwhile; ?>
</body>
</html>

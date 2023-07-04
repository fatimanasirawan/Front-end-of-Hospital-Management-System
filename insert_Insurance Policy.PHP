<?php
$servername = "localhost"; //change this to your server name
$username = "username"; //change this to your database username
$password = "password"; //change this to your database password
$dbname = "database_name"; //change this to your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Prepare and bind parameters
    $stmt = $conn->prepare("INSERT INTO insurance_policy (policy_number, insurance_network, policy_name, description, deductible, co_pay) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssss", $policy_number, $insurance_network, $policy_name, $description, $deductible, $co_pay);

    // Set parameters and execute
    $policy_number = $_POST["policy-number"];
    $insurance_network = $_POST["Insurance Network"];
    $policy_name = $_POST["policy-name"];
    $description = $_POST["Description"];
    $deductible = $_POST["Deductible"];
    $co_pay = $_POST["C0-Pay"];
    $stmt->execute();

    // Close statement and connection
    $stmt->close();
    $conn->close();
}
?>
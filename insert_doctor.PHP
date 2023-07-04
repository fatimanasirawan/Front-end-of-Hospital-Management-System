<?php
// Establishing Connection with Server
$connection = mysqli_connect("localhost", "root", "123456pk", "HMS");
 
// Checking if the form has been submitted
if(isset($_POST['doctor_id'])) {
    
    // Assigning POST values to variables
    $doctor_id = $_POST['doctor_id'];
    $supervisor_id = $_POST['supervisor_id'];
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $address = $_POST['address'];
    $city = $_POST['city'];
    $state = $_POST['state'];
    $insurance_network = $_POST['insurance_network'];
    
    // Inserting data into table
    $query = "INSERT INTO doctors (doctor_id, supervisor_id, firstname, lastname, email, phone, address, city, state, insurance_network) 
              VALUES ('$doctor_id', '$supervisor_id', '$firstname', '$lastname', '$email', '$phone', '$address', '$city', '$state', '$insurance_network')";
              
    $result = mysqli_query($connection, $query);
    
    if($result) {
        echo "Registration successful";
    } else {
        echo "Registration failed";
    }
}
mysqli_close($connection); // Closing Connection with Server
?>

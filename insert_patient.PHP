<?php

// Get values from form
  $patient_id = $_POST['patient_id'];
  $room_id = $_POST['room_id'];
  $firstname = $_POST['firstname'];
  $lastname = $_POST['lastname'];
  $email = $_POST['email'];
  $phone = $_POST['phone'];
  $address = $_POST['address'];
  $city = $_POST['city'];
  $state = $_POST['state'];
  $zipcode = $_POST['zipcode'];
  $allergies = $_POST['allergies'];
  $chronicdiseases = $_POST['chronicdiseases'];
  $OtherHealthConcerns = $_POST['OtherHealthConcerns'];
  $policy_number = $_POST['policy_number'];
  $PharmacyId= $_POST['PharmacyId'];

//Create Connection
$conn = new mysqli('localhost', 'root' , '123456pk' , 'HMS');

// check if connection was successful
if ($conn->connect_error) {
  die('Connection failed: ' .$conn->connect_error);
}
else
{
$stmt = $conn->prepare("insert into patient(patient_id, room_id, firstname, lastname, email, phone, address, city, state, zipcode, allergies, chronicdiseases, OtherHealthConcerns, policy_number, PharmacyId) Values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
$stmt->bind_param("issssssssssssss",$patient_id, $room_id, $firstname, $lastname, $email, $phone, $address, $city, $state, $zipcode, $allergies, $chronicdiseases, $OtherHealthConcerns, $policy_number, $PharmacyId);

  $stmt->execute();

    echo "data entered.. ";
$stmt->close();
$conn->close();
}
?>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Retails</title>
  </head>
  <body>
<?php
include './header.php';
    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
// Retrieve data from form submission
$customerName = $_POST['customerName'];
$phone = $_POST['phone'];
$address = $_POST['address'];
$gender = $_POST['gender'];
$income = $_POST['income'];

$servername="localhost";
$username="root";
$password="";
$dbname="retails";//Mentioning the name of the database

// Create a connection 
$conn=mysqli_connect($servername,$username,$password,$database);
//Die if connection was not successful
    if(!$conn)
        die("Sorry we failed to connect". mysqli_connect_error());
    else
        {    
// Insert data into customer table
$sql = "INSERT INTO customer (customer_name, phone, address, gender, income) 
        VALUES ('$customerName', '$phone', '$address', '$gender', '$income')";
$result=mysqli_query($conn,$sql);
if($result)
      {
        header("Location: product.php");
        exit();
      }
else
    echo "<br>Record has not been inserted because of this error -->". mysqli_error($conn);
}
        }
?>
<div class="container mt-3">
<h1>Enter your details</h1>
    <form action="./customer.php" method="post" autocomplete="off">
    <div class="form-group">
            <label for="customerName">Name</label>
            <input type="text" class="form-control" name="customerName" placeholder="Enter your name" required>
        </div>
    <div class="form-group">
        <label for="phone">Phone Number</label>
        <input type="tel" name="phone" class="form-control" id="phone" aria-describedby="emailHelp" required>
    </div>
    <div class="form-group">
        <label for="address">Address</label>
        <textarea class="form-control" name="address" id="address" cols="7" rows="6" required></textarea>
    </div>
    <div class="form-group">
            <label for="gender">Gender:</label>
            <select class="form-control" name="gender" required>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
        </div>
        <div class="form-group">
            <label for="income">Income:</label>
            <input type="number" class="form-control" name="income" placeholder="Enter income" required>
        </div>
        <button type="submit" name="submit" class="btn btn-primary" >Submit</button>
    </form>
</div>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>


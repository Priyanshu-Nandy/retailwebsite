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
$servername="localhost";
$username="root";
$password="";
$dbname="retails";//Mentioning the name of the database

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Function to fetch all data from the vehicle table
function fetchAllData($conn) {
    $query = "SELECT v.model_id, v.brand_id, v.color_id, v.dealer_id, v.price, b.brand_name, m.model_name, c.color_name, d.dealer_name
              FROM vehicle v
              JOIN brand b ON v.brand_id = b.brand_id
              JOIN model m ON v.model_id = m.model_id
              JOIN color c ON v.color_id = c.color_id
              JOIN dealer d ON v.dealer_id = d.dealer_id";

    $result = mysqli_query($conn, $query);

    if ($result) {
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
        return $data;
    }

    return null;
}

// Fetch all data from the vehicle table
$allData = fetchAllData($conn);
?>
<div>
    <h2>Product Table</h2>

    <table border="1">
        <thead>
            <tr>
                <th>Model Name</th>
                <th>Brand Name</th>
                <th>Color Name</th>
                <th>Dealer Name</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($allData as $row): ?>
                <tr>
                    <td><?php echo $row['model_name']; ?></td>
                    <td><?php echo $row['brand_name']; ?></td>
                    <td><?php echo $row['color_name']; ?></td>
                    <td><?php echo $row['dealer_name']; ?></td>
                    <td><?php echo $row['price']; ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>

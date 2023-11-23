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
// Function to fetch data from the sales table
function fetchSalesData($conn) {
    $query = "SELECT s.vin, s.dispatch_date, s.arrival_date, v.brand_id, v.model_id, v.color_id, b.brand_name, m.model_name, c.color_name
              FROM sales s
              JOIN vehicle v ON s.vin = v.vin
              JOIN brand b ON v.brand_id = b.brand_id
              JOIN model m ON v.model_id = m.model_id
              JOIN color c ON v.color_id = c.color_id";

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
// Fetch data from the sales table
$salesData = fetchSalesData($conn);
?>
<div>
    <h2>Sales Data Table</h2>

    <table border="1">
        <thead>
            <tr>
                <th>VIN</th>
                <th>Dispatch Date</th>
                <th>Arrival Date</th>
                <th>Brand</th>
                <th>Model</th>
                <th>Color</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($salesData as $row): ?>
                <tr>
                    <td><?php echo $row['vin']; ?></td>
                    <td><?php echo $row['dispatch_date']; ?></td>
                    <td><?php echo $row['arrival_date']; ?></td>
                    <td><?php echo $row['brand_name']; ?></td>
                    <td><?php echo $row['model_name']; ?></td>
                    <td><?php echo $row['color_name']; ?></td>
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

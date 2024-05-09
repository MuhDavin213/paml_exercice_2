<?php
$conn=new mysqli("localhost", "root", "", "restaurant");
$query=mysqli_query($conn, "select * from resto");
$data=mysqli_fetch_all($query,MYSQLI_ASSOC);
echo json_encode($data);

?>
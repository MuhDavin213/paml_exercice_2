<?php

$conn=new mysqli("localhost", "root", "", "restaurant");

$rate_resto = $_POST["rate_resto"];
$data= mysqli_query($conn, "delete from resto where rate_resto='$rate_resto' ");
if ($data) {
	echo json_encode(['pesan' => 'Sukses']);
}else{
	echo json_encode(['pesan' => 'Gagal']);
}
?>
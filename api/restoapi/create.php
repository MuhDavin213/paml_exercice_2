<?php

$conn=new mysqli("localhost", "root", "", "restaurant");
$rate_resto = $_POST["rate_resto"];
$nama = $_POST["nama"];
$alamat = $_POST["alamat"];
$data= mysqli_query($conn, "insert into resto set rate_resto='$rate_resto', nama='$nama', alamat='$alamat'");
if ($data) {
	echo json_encode(['pesan' => 'Sukses']);
}else{
	echo json_encode(['pesan' => 'Gagal']);
}
?>
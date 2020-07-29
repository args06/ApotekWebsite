<?php
$host = "localhost";
$user = "root";
$pass = "";
$database = "apotek";

$koneksi = mysqli_connect($host, $user, $pass, $database);

if ($koneksi->connect_error) {
	exit();
	die('maaf koneksi gagal : ' . $koneksi->error);
}
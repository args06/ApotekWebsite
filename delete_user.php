<?php 
include 'koneksi.php';
session_start();
if (empty($_SESSION['email'])) {
	header("location:login.php?pesan=belum_login");
}
$username = $_SESSION['username'];

$id = $_GET['id'];

$query = mysqli_query($koneksi,"DELETE FROM user WHERE user_id = $id ") or die (mysqli_error($koneksi));

header("location:user.php");
?>
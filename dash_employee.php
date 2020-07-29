<?php 
include 'koneksi.php';
session_start();
if (empty($_SESSION['email'])) {
	header("location:login.php?pesan=belum_login");
}
 ?>
<!DOCTYPE html>
<html>
<head>
	<title>Dashboard Employee</title>
</head>
<body>
<?php 
	print "Hi, ".$_SESSION['username'];
 ?>
	<a href="logout.php"><button>Log Out</button></a>
</body>
</html>
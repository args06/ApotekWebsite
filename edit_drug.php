<?php 
include 'koneksi.php';
session_start();
if (empty($_SESSION['email'])) {
	header("location:login.php?pesan=belum_login");
}

$id = $_GET['id'];
$username = $_SESSION['username'];

$query = mysqli_query($koneksi,"SELECT * FROM user WHERE username = '$username'") or die (mysqli_error($koneksi));
$row = mysqli_fetch_object($query);
$query2 = mysqli_query($koneksi,"SELECT * FROM distributor b JOIN drug d ON b.distributor_id = d.distributor_id WHERE d.drug_id = '$id'") or die (mysqli_error($koneksi));
$row2 = mysqli_fetch_object($query2);

?>

<!DOCTYPE html>
<html>
<head>
	<title> Edit Drug </title>
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="style/style.css">
</head>
<body>
	<div class="px-5">
		<div class="px-5">
		<nav class="navbar navbar-expand-lg navbar-dark bg-transparent">
			<a class="navbar-brand" href="home.php">
				<h3 class="font-weight-bold" style="color: #9597B5;">
					<img class="mx-auto rounded-circle" src="img/ui/pharmacy.png" width="50px" height="50px">
					 &nbspApotek Danau Toba
				</h3>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-item nav-link active mx-4" href="catalog.php">
						<h5 class="active font-weight-bold">Catalog</h5>
					</a>
					<?php if ($row->role_id == 1) {?>
					<a class="nav-item nav-link mr-4" href="distributor.php">
						<h5 class="font-weight-bold awal">Distributor</h5>
					</a>
					<a class="nav-item nav-link mr-4" href="user.php">
						<h5 class="font-weight-bold awal">User</h5>
					</a>
					<?php } ?>
					<a class="nav-item nav-link mr-4" href="transaction.php">
						<h5 class="font-weight-bold awal">Transaction</h5>
					</a>
					<a class="nav-item nav-link" href="profile.php" style="color: #9597B5;">
						<img class="mx-auto rounded-circle" src="<?= $row->pas_foto ?>" width="40px" height="40px">
					</a>
					<a href="profile.php" class="nav-item nav-link">
						<h5 class="font-weight-bold awal">Hi, <?= $_SESSION['username'] ?></h5>		
					</a>
					<a class="nav-item nav-link" href="logout.php" style="size: 10px;">
						<h5 class="font-weight-bold awal">Log Out</h5>
					</a>
				</div>
			</div>
			</nav>
	</div>
	</div>

	<h3 class="text-bold judul">
		<a href="catalog.php">
	  		<button class="button-left" style="vertical-align:middle; padding: 5px; width: auto;">
				<span>Cancel</span>
			</button>
	  	</a>
		Edit Drug
	</h3>

	<div class="container" style="margin-right: auto;">
		<form method="POST" action="update_drug.php">
			<input type="hidden" name="id" value="<?= $row2->drug_id ?>">
		 	<div class="form-group row">
		    	<label class="col-sm-2 col-form-label">Name</label>
		    	<div class="col-sm-10">
		      		<input type="text" name="name" class="form-control" value="<?= $row2->name ?>">
		    	</div>
		  	</div>
		  	<div class="form-group row">
		    	<label class="col-sm-2 col-form-label">Description</label>
		    	<div class="col-sm-10">
		      		<input type="text" name="desc" class="form-control" value="<?= $row2->description ?>">
		    	</div>
		  	</div>
		  	<div class="form-group row">
		    	<label class="col-sm-2 col-form-label">Amount</label>
		    	<div class="col-sm-2">
		      		<input type="number" name="amount" class="form-control" value="<?= $row2->amount ?>">
		    	</div>

		    	<label class="col-sm-2 col-form-label"><center>Price</center></label>
		    	<div class="col-sm-2">
		      		<input type="number" name="price" class="form-control" value="<?= $row2->price ?>">
		    	</div>

		    	<label class="col-sm-2 col-form-label"><center>Distributor</center></label>
		    	<div class="col-sm-2">
		      		<input type="text" name="distributor" class="form-control" value="<?= $row2->dname ?>" readonly>
		    	</div>
		  	</div>
		  	<center>
			  	<button type="submit" class="button-right" style="vertical-align:middle">
					<span>Edit</span>
				</button>
		  	</center>
		</form>
	</div>
</body>
</html>
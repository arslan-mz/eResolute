<!DOCTYPE html>
<html lang="en">
<head>
	<title>eResolute</title>

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=0">

	<meta name="theme-color" content="#408000">
	
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Cinzel|Josefin+Slab|Assistant|Quicksand" rel="stylesheet">

	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

	<!-- Google Icons -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<!-- My Custom CSS -->
	<link rel="stylesheet" type="text/css" href="css/custom.css">
</head>

<body class="clr-grey">
	<div class="container-fluid fixed-top quicksand bg-black">
		<nav class="navbar navbar-expand-lg navbar-light fnt-14 pad-tb-0">
			<a class="navbar-brand" href="home"><img class="img-fluid" alt="Responsive image" src="images/eresolute-logo.png" width="160" alt="Logo"></a>
			<button class="navbar-toggler navbar-dark menu-button" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				Menu
			</button>
			<div class="collapse navbar-collapse text-center" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link home" href="<?php echo WEBPATH.'home'; ?>">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link about" href="<?php echo WEBPATH.'about'; ?>">About Us</a>
					</li>
					<li class="nav-item">
						<a class="nav-link contact" href="<?php echo WEBPATH.'contact'; ?>">Contact Us</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container-fluid cus-col-gap">
		<div class="pad-tb-10 quicksand text-right fnt-12 user-link">
			<?php
				if (isset($_SESSION["login"]) && $_SESSION["login"] == "success" || isset($_SESSION["admin"]) && $_SESSION["admin"] == "success") {
					$name = $_SESSION["name"];
					echo "<b>".$name."</b>";
			?>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<i class="fas fa-user-circle"></i>&nbsp;
			<a href='
				<?php
					if (isset($_SESSION["login"]) && $_SESSION["login"] == "success") {
						echo "profile?id=".$_SESSION["login_prof_id"];
					}
					elseif (isset($_SESSION["admin"]) && $_SESSION["admin"] == "success") {
						echo "dashboard";
					}
				?>
			'>
				<b><?php
					if (isset($_SESSION["login"]) && $_SESSION["login"] == "success") {
						echo "My Profile";
					}
					elseif (isset($_SESSION["admin"]) && $_SESSION["admin"] == "success") {
						echo "Dashboard";
					}
				?></b>
			</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<i class="fas fa-sign-out-alt"></i>
			&nbsp;
			<a href="logout"><b>Log out</b></a>
			<?php
				}
				else {
			?>
			<i class="fas fa-user-plus"></i>
			&nbsp;
			<a href="signup"><b>Register</b></a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<i class="fas fa-arrow-circle-right fnt-14"></i>
			&nbsp;
			<a href="login"><b>Login</b></a>
			<?php
				}
			?>
		</div>
	</div>
	
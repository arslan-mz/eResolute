<?php
	session_start();
	if(isset($_SESSION["login"])){
		unset($_SESSION["login"]);
		header('location:login');
	}
	if (isset($_SESSION["admin"])){
		unset($_SESSION["admin"]);
		header('location:admin');
	}
	$_SESSION["alert-msg"] = "Logged out! See ya soon!";
	$_SESSION["alert-type"] = "success";
?>
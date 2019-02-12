<?php
	if ($_SERVER['REQUEST_METHOD'] === 'POST') {

		require_once(INCLUDES.'validations.tpl');

		$validate = new Validation();

		if($validate->name($_POST['name']) && $validate->email($_POST['email']) && $validate->msg($_POST['message'])) {

			require_once(INCLUDES.'db_connect.tpl');
			$db_connect = new DatabaseConnection();

			$name = $_POST['name'];
			
			$user_email = $_POST['email'];
			
			$msg = $_POST['message'];
			
			$query = "INSERT INTO contact_submissions (name, email, message) VALUES ('$name', '$user_email', '$msg');";
			if ($db_connect->insert_query($query)) {
				$_SESSION["alert-msg"] = "Thank you for sharing some words with us!";
				$_SESSION["alert-type"] = "success";
			}
			else {
				$_SESSION["alert-msg"] = "Error! Your message couldn't reach us, please try again.";
				$_SESSION["alert-type"] = "warning";
			}
			$db_connect->close();
		}
		else {
			$_SESSION["alert-msg"] = "Invalid Input!";
			$_SESSION["alert-type"] = "danger";
		}
		header('location:contact');
	}
	else
		echo "Trying to be smart? Han?";
?>
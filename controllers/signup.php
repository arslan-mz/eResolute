<?php
	if ($_SERVER['REQUEST_METHOD'] === 'POST') {

		require_once(INCLUDES.'validations.tpl');

		$validate = new Validation();

		if ($validate->name($_POST['name']) && $validate->email($_POST['email']) && !empty($_POST['genderRadios']) && !empty($_POST['dob']) && !empty($_POST['password1']) && !empty($_POST['password2'])) {

			if ($_POST['password1'] == $_POST['password2']) {
				
				$name = ucwords($_POST['name']);
				$email = $_POST['email'];
				$gender = $_POST["genderRadios"];
				$dob = $_POST["dob"];
				$prof_id = strtolower(strtok($name, " ")).$dob;
				$pwd = $validate->encryptME($_POST['password1']);
				$token = md5(uniqid(rand(), true));
				
				require_once(INCLUDES.'db_connect.tpl');
				$db_connect = new DatabaseConnection();
				
				$query = "INSERT INTO users (user, email, password, profile_id, gender, dob) VALUES ('$name', '$email', '$pwd', '$prof_id', '$gender', '$dob');";
				
				if($db_connect->insert_query($query)) {
					$_SESSION["alert-msg"] = "Signed up successfully! :)";
					$_SESSION["alert-msg-2"] ="Please wait till the admins approve your account. You'll be able to login after your account has been approved.";
					$_SESSION["alert-type"] = "success";
				}
				else {
					$_SESSION["alert-msg"] = "Error! Perhaps the email is already in use.";
					$_SESSION["alert-type"] = "warning";
				}
				$db_connect->close();
			}
			else {
				$_SESSION["alert-msg"] = "Passwords don't match! Try again.";
				$_SESSION["alert-type"] = "danger";
			}
			
		}
		else {
			$_SESSION['alert-msg'] = "Invalid Input!";
			$_SESSION['alert-type'] = "danger";
		}
		header('location:signup');
	}
	else
		echo "Trying to be smart? Han?";
?>
<?php
	if ($_SERVER['REQUEST_METHOD'] === 'POST') {
		
		if(isset($_SESSION["admin"]) && $_SESSION["admin"] == "success" && isset($_POST['user_id'])) {

			require_once(INCLUDES.'db_connect.tpl');
			$db_connect = new DatabaseConnection();
			
			$user_id = $_POST['user_id'];

			if ($_POST['decision'] == "approve") {
				$query = "UPDATE users SET verified = '1' WHERE id = '$user_id'";
				
				$result = $db_connect->update_query($query);
				
				if ($result) {
					$_SESSION['alert-msg'] = "User approved!";
					$_SESSION['alert-type'] = "success";				
				}
				else {
					$_SESSION['alert-msg'] = "Couldn't approve! Please Try Again.";
					$_SESSION['alert-type'] = "danger";
				}
			}
			elseif ($_POST['decision'] == "delete") {
				$query = "DELETE FROM users WHERE id = '$user_id'";
			
				$result = $db_connect->delete_query($query);
				
				if ($result) {
					$_SESSION['alert-msg'] = "User deleted!";
					$_SESSION['alert-type'] = "success";				
				}
				else {
					$_SESSION['alert-msg'] = "Deletion Failed! Please Try Again.";
					$_SESSION['alert-type'] = "danger";
				}
			}
			$db_connect->close();
			header('location:viewUsers');
		}
		else
			header('location:su');
	}
	else
		echo "Trying to be smart? Han?";
?>
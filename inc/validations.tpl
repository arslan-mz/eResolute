<?php
	class Validation {
		function test_input($data) {
			$data = trim($data);
			$data = stripslashes($data);
			$data = htmlspecialchars($data);
			return $data;
		}

		function name($input) {
			$name = $this->test_input($input);
			if (preg_match("/^[a-zA-Z ]*$/",$name) && $name != '')
				return 1;
			else
				return 0;
		}

		function email($input) {
			$email = $this->test_input($input);
			if (filter_var($email, FILTER_VALIDATE_EMAIL) && $email != '')
				return 1;
			else
				return 0;
		}

		function msg($input) {
			$msg = $this->test_input($input);
			if (preg_match("/^[a-zA-Z0-9. ]*$/",$msg) && $msg != '')
				return 1;
			else
				return 0;
		}

		function phone($input) {
			if(strlen($input) == '10')
				return 1;
			else
				return 0;
		}

		function encryptME($val) {
			return base64_encode(sha1(md5(sha1(md5($val)))));	
		}
	}
?>
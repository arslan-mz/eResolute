<?php
	session_start();

	$url = $_SERVER['REQUEST_URI'];

	$url_array = explode('/',$url);
	if ($url[strlen($url)-1] == '/' && $url_array[SEG1]) {
		$url = rtrim($url,'/');
		header('location:'.$url);
	}

	$parts = parse_url($url);
	$site_path = $parts["path"];
	$array = explode('/', $site_path);
	if (isset($array[SEG2]))
		header('location:'.WEBPATH.error);
	if (isset($array[SEG1])) {
		switch($array[SEG1]) {

			case '':
			case 'home':
				require_once(PAGE.'home.tpl');
				break;

			case 'admin':
				require_once(PAGE.'adminLogin.tpl');
				break;

			case 'adminLogin.php':
				require_once(CTRL.'adminLogin.php');
				break;

			case 'contact':
				require_once(PAGE.'contact.tpl');
				break;

			case 'viewUsers':
				require_once(PAGE.'viewUsers.tpl');
				break;

			case 'contact.php':
				require_once(CTRL.'contact.php');
				break;

			case 'signup':
				require_once(PAGE.'signup.tpl');
				break;

			case 'login':
				require_once(PAGE.'login.tpl');
				break;

			case 'profile':
				$parts = parse_url($url);
				if (isset($parts['query'])) {
					parse_str($parts['query'], $arg);
					$_SESSION["prof_id"] = $arg['id'];
					if (isset($_SESSION["login"]) && $_SESSION["login"] == "success" && $_SESSION["prof_id"] == $_SESSION["login_prof_id"])
						require_once(PAGE.'profile.tpl');
					else
						require_once(PAGE.'viewProfile.tpl');
				}
				else
					header('location:'.WEBPATH.error);
				break;

			case 'signup.php':
				require_once(CTRL.'signup.php');
				break;

			case 'login.php':
				require_once(CTRL.'login.php');
				break;

			case 'update_profile.php':
				require_once(CTRL.'update_profile.php');
				break;

			case 'logout':
				require_once(CTRL.'logout.php');
				break;

			case 'decision':
				require_once(CTRL.'decision.php');
				break;

			case 'deleteUser':
				require_once(CTRL.'deleteUser.php');
				break;

			case 'dashboard':
				if (isset($_SESSION["admin"]) && $_SESSION["admin"] == "success")
					require_once(PAGE.'dashboard.tpl');
				else
					require_once(PAGE.'adminLogin.tpl');
				break;

			case 'contactSubs':
				if (isset($_SESSION["admin"]) && $_SESSION["admin"] == "success")
					require_once(PAGE.'contactSubs.tpl');
				else
					require_once(PAGE.'suLogin.tpl');
				break;

			case 'forgot':
				require_once(PAGE.'forgot.tpl');
				break;

			case 'genPwdRstTkn.php':
				require_once(CTRL.'genPwdRstTkn.php');
				break;

			case 'reset':
				$parts = parse_url($url);
				parse_str($parts['query'], $arg);
				if (isset($arg['id'])) {
					$token = $arg['id'];
					$_SESSION["token_id"] = $token;
					require_once(PAGE.'resetPwd.tpl');
				}
				else
					header('location:'.WEBPATH.error);
				break;

			case 'resetPwd':
				require_once(PAGE.'resetPwd.tpl');
				break;

			case 'resetPwd.php':
				require_once(CTRL.'resetPwd.php');
				break;

			case 'error':
				require_once(PAGE.'error.tpl');
				break;

			case 'phpinfo':
				require_once(PAGE.'phpinfo.tpl');
				break;

			default:
				header('location:'.WEBPATH.error);
		}
	}
	else
		header('location:'.WEBPATH.home);

?>

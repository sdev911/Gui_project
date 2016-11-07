<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$pc = new SiteController();
$pc->route($action);

class SiteController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			case 'home':
				$this->home();
				break;

			case 'contact':
				$this->contact();
				break;

			case 'login':
				$this->login();
				break;

			case 'processLogin':
				$username = $_POST['un'];
				$password = $_POST['pw'];
				$this->processLogin($username, $password);
				break;

			case 'processSignup':
				$username = $_POST['un'];
				$password = $_POST['pw'];
				$confPassword = $_POST['confirmpw'];
				$email = $_POST['email'];
				$first_name = $_POST['fname'];
				$last_name = $_POST['lname'];
				$this->processSignup($username, $password, $confPassword, $email, $first_name, $last_name);
				break;

			case 'signup':
				$this->signup();
				break;

			case 'logout':
				$this->logout();
				break;

		 case 'cart':
		 		$this->cart();
				break;

			// redirect to home page if all else fails
      default:
        header('Location: '.BASE_URL);
        exit();

		}

	}

  public function home() {
		$pageName = 'Home';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	public function contact() {
		$pageName = 'Contact';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/contact.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }


	public function login() {
		$pageName = 'login';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/login.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	public function logout() {
		include_once SYSTEM_PATH.'/view/logout.tpl';
  }

	public function cart(){
		$products = Cart::getAllProducts();

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/cart.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	private function getCatFact() {
		$endpoint = 'http://catfacts-api.appspot.com/api/facts';
		$contents = file_get_contents($endpoint);
		$json = json_decode($contents);
		$fact = $json->{'facts'};
		return implode($fact);
	}

	private function getCatPic() {
		$endpoint = 'http://random.cat/meow';
		$contents = file_get_contents($endpoint);
		$json = json_decode($contents);
		$pic = $json->{'file'};
		return $pic;
	}

	public function processLogin($u, $p) {
		$conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
			or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

		$q = sprintf("SELECT * FROM user");
		$result = mysql_query($q);
		while($row = mysql_fetch_assoc($result)) {
			if ($p == $row['password'] && $u ==$row['username'])
				{
					session_start();
					$_SESSION['user'] = $row['username'];
					$_SESSION['id'] = $row['id'];
					$_SESSION['msg'] = "Welcome back "+$row["first_name"]+"!";
					header('Location: http://ec2-54-191-243-249.us-west-2.compute.amazonaws.com/');
					exit();
				}
		}
		$_SESSION['msg'] = "Login failed";
		exit();
	}

	public function signup() {
		$pageName = 'Sign Up';
		$cssSheet = 'styles.css';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/signup.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function processSignup($u, $p, $c, $e, $f, $l) {
		if ($p != $c)
		{
			$_SESSION['msg'] = "Your password selections do not match";
			header('Location: http://ec2-54-191-243-249.us-west-2.compute.amazonaws.com/signup/');
			exit();
		}
		$host     = DB_HOST;
		$database = DB_DATABASE;
		$username = DB_USER;
		$password = DB_PASS;

		$conn = mysql_connect($host, $username, $password)
			or die ('Error: Could not connect to MySql database');

		mysql_select_db($database);
		$q = sprintf("SELECT * FROM user");  //WHERE username LIKE (%s)", $u);
		$result = mysql_query($q);
		while($row = mysql_fetch_assoc($result))
		{
			if ($u == $row['username'])
			{
				$_SESSION['msg'] = "The username: "+$u+" is already in use.";
				header('Location: http://ec2-54-191-243-249.us-west-2.compute.amazonaws.com/signup/');
				exit();
			}
		}
		$inserts = array('first_name' => $f,'last_name' => $l,'username' => $u,'password' => $p,'email' => $e, 'user_type' => 0);
		$values = array_map('mysql_real_escape_string', array_values($inserts));
		$keys = array_keys($inserts);
		mysql_query('INSERT INTO `user` (`'.implode('`,`', $keys).'`) VALUES (\''.implode('\',\'', $values).'\')');
		header('Location: http://ec2-54-191-243-249.us-west-2.compute.amazonaws.com/');
		exit();
	}

}

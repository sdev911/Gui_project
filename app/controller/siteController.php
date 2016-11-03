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

		$q = sprintf("SELECT * FROM user WHERE id = %d; ",
			1
			);
		$result = mysql_query($q);
		while($row = mysql_fetch_assoc($result)) {
			$adminUsername['username'] = $row['username'];
			$adminPassword['password'] = $row['password'];
		}
		if(($u == $adminUsername['username']) && ($p == $adminPassword['password'])) {
			session_start();
			$_SESSION['user'] = $u;
			header('Location: http://ec2-54-200-33-61.us-west-2.compute.amazonaws.com/');
			echo 'You have logged in successfully!';
			exit();
		// 	echo 'Hooray! Access is granted.';
		// } else {
		// 	echo 'Access denied.';
		} else {
			// send them back
			header('Location: '.BASE_URL);
			echo 'Login failed!';
			exit();
		}

	}

}

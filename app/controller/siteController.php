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

			case 'editUserRoles':
				$this->editUserRoles();
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
				$userId = $_SESSION['id'];
		 		$this->cart($userId);
				break;

			case 'changeRole':
				$userId = $_GET['userId'];
				$newRole = $_GET['newRole'];
			 	$this->changeRole($userId, $newRole);
				break;

			case 'follow':
				$userId = $_GET['userId'];
		 		$this->follow($userId);
				break;

			case 'followers':
				$userId = $_GET['userId'];
				$this->followers($userId);
				break;


			case 'removefollowers':
				$userId = $_GET['userId'];
				$this->removeFollowers($userId);
				break;

			case 'profile':
				$userId = $_GET['userId'];
				$this->profile($userId);
				break;

			case 'profileProcess':
				$userId = $_SESSION['id'];
				$firstname = $_POST['fname'];
				$lastname = $_POST['lname'];
				$biography = $_POST['bio'];
				$emailaddress = $_POST['email'];
				$gender = $_POST['optionsRadios'];

				$this->profileProcess($userId, $firstname, $lastname, $biography, $emailaddress, $gender);
				break;


			// redirect to home page if all else fails
      default:
        header('Location: '.BASE_URL.'/');
        exit();

		}

	}


  public function home() {
		$pageName = 'Home';

		include_once SYSTEM_PATH.'/view/header.tpl';
		if ($_SESSION['user'] != NULL) {
			$actions = Actions::getActionsFollowed($_SESSION['id']);
			//$actions = Actions::getAllActions();
			include_once SYSTEM_PATH.'/view/feed.tpl';
		}
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }


  public function profile($userId) {
	  $userInfo = User::loadbyId($userId);
		$actions = Actions::getUserActions($userId);
		$pageName = 'Profile';

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/profile.tpl';
		include_once SYSTEM_PATH.'/view/feed.tpl';
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
		$_SESSION['msg'] = null;
		session_destroy();
		include_once SYSTEM_PATH.'/view/logout.tpl';
  }

	public function cart($userId){
		$products = Cart::getProductsByUser($userId);

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
			if ($p == $row['password'] && $u ==$row['username'] /*&& password_verify($p, $row['password_hash'])*/)
				{
					$_SESSION['user'] = $row['username'];
					$_SESSION['id'] = $row['id'];
					$_SESSION['permissions']= $row['user_type'];
					$_SESSION['msg'] = null;
					header('Location: '.BASE_URL.'/');
					User::set('password_hash', password_hash($p, PASSWORD_DEFAULT));
					exit();
				}
		}
		$_SESSION['msg'] = "Login failed";
		header('Location: '.BASE_URL.'/login/');
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
		if (User::loadByUsername($u)!=null)
		{
			$_SESSION['msg'] = "That username is taken. Please try another";
			header('Location: '.BASE_URL.'/signup/');
			exit();
		}

		$password_hash = password_hash($p, PASSWORD_DEFAULT);

		User::addUser($u, $p, $password_hash, $f, $l, $e);
		$_SESSION['msg'] = null;
		$this->processLogin($u, $p);
		exit();
	}

	public function follow($followingID)
	{
		Follower::addFollow($_SESSION['id'],$followingID);
		$action = 'follow';
		$description = ' followed ';
		$name = User::loadById($followingID)->get('username');
		$url_mod = 'profile';
		Actions::addAction($url_mod, $followingID, $name, $action, $description, $_SESSION['id'], $_SESSION['user']);
		header('Location: '.BASE_URL.'/');
		exit();
	}


	public function followers($followingID)
	{
	$followers = Follower::loadByFollowerId($followingID);
	$following = Follower::loadByFollowingId($followingID);

	include_once SYSTEM_PATH.'/view/header.tpl';
	include_once SYSTEM_PATH.'/view/myFollowers.tpl';
	include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function removeFollowers($userId)
	{
		Follower::removeFollow($userId, $_SESSION['id']);
		header('Location: '.BASE_URL.'/profile/'.$_SESSION['id'].'/followers');
	}


	public function editUserRoles()
	{
		$users = User::getAllUsers();
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/users.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function changeRole($userId, $newRole)
	{
		$user = User::loadById($userId);
		$user->set('user_type', $newRole);
		$user->save();
		header('Location: '.BASE_URL.'/users/');
	}

	public function profileProcess($userId, $firstname, $lastname, $biography, $emailaddress, $gender){
		$user = User::loadById($userId);
		$user->set('first_name', $firstname);
		$user->set('last_name', $lastname);
		$user->set('bio', $biography);
		$user->set('email', $emailaddress);
		$user->set('gender', $gender);
		$user->save();
		header('Location: '.BASE_URL.'/profile/'.$userId);
	}


}

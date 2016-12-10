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

			case 'getColorData':
				$this->getColorData();
				break;

			case 'getFollowData':
				$this->getFollowData();
				break;

			case 'buildFollowArray':
				$this->buildFollowArray();
				break;

			case 'changeColor':
				$id = $_POST['id'];
				$color = $_POST['color'];
				$this->changeColor($id, $color);
				break;

			case 'nextCatFact':
				$this->nextCatFact();
				break;

			case 'conversation':
				$userId = $_GET['userId'];
				$this->conversation($userId);
				break;

			case 'sendMessage':
				$userId = $_GET['userId'];
				$this->sendMessage($userId);
				break;

			// redirect to home page if all else fails
      default:
        header('Location: '.BASE_URL.'/');
        exit();
		}
	}

	//displays the homepage
  public function home() {
		$pageName = 'Home';
		include_once SYSTEM_PATH.'/view/header.tpl'; //include header
	  include_once SYSTEM_PATH.'/view/home.tpl'; // include homepage
		if ($_SESSION['user'] != NULL) { // if there is a user signed in
			$actions = Actions::getActionsFollowed($_SESSION['id']); // pull their action feed items
			include_once SYSTEM_PATH.'/view/feed.tpl'; // display the feeed
		}
		include_once SYSTEM_PATH.'/view/footer.tpl'; //include footer
  }

//displays the profile page
  public function profile($userId) {
	  $userInfo = User::loadbyId($userId); // loads all profile information
		$actions = Actions::getUserActions($userId); // gets the user's profile feed actions
		$pageName = 'Profile';

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/profile.tpl';
		include_once SYSTEM_PATH.'/view/feed.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	//displays the contact page
	public function contact() {
		$pageName = 'Contact';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/contact.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

// displays the login page
	public function login() {
		$pageName = 'login';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/login.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

// logs the user out of their account
	public function logout() {
		$_SESSION['msg'] = null;
		session_destroy(); // destroys the session
		include_once SYSTEM_PATH.'/view/logout.tpl';
  }

// displays the cart
	public function cart($userId){
		$products = Cart::getProductsByUser($userId); // pulls the cart items for that user

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/cart.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

/** gets a cat fact from the cat fact api
	private function getCatFact() {
		$endpoint = 'http://catfacts-api.appspot.com/api/facts'; //sets up endpoint
		$contents = file_get_contents($endpoint); // calls endpoint
		$json = json_decode($contents); //decodes
		$fact = $json->{'facts'}; //gets fact
		return implode($fact); // returns fact
	}**/

private function nextCatFact(){
	$endpoint = 'http://catfacts-api.appspot.com/api/facts'; //sets up endpoint
		$contents = file_get_contents($endpoint); // calls endpoint
		$json = json_decode($contents); //decodes
		$fact = $json->{'facts'}; //gets fact
		echo implode($fact); // returns fact;
}


// gets a cat picture from the random cat api
	private function getCatPic() {
		$endpoint = 'http://random.cat/meow'; //sets up endpoint
		$contents = file_get_contents($endpoint); //calls endpoint
		$json = json_decode($contents); // decodes
		$pic = $json->{'file'}; // gets image
		return $pic; // returns image
	}

//processes the login
	public function processLogin($u, $p) {
		$user = User::loadByUsername($u); // loads the user from the username provided
		if ($user!= null) // if the username is in the db
		{
			if (password_verify($p, $user->get('password_hash'))) //verify the encrypted password
				{
					$_SESSION['user'] = $user->get('username'); //set the user session variable
					$_SESSION['id'] = $user->get('id'); // set the id session variable
					$_SESSION['permissions']= $user->get('user_type'); // set the permissions session variable
					$_SESSION['msg'] = null; // set the msg to null
					header('Location: '.BASE_URL.'/'); //navigate home
					exit(); //exit
				}
		} // if username is not in db, or password was not verified
		$_SESSION['msg'] = "Login failed"; // set the message
		header('Location: '.BASE_URL.'/login/'); // renavigate to login
		exit();
	}

//displays the sign-up page
	public function signup() {
		$pageName = 'Sign Up';
		$cssSheet = 'styles.css';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/signup.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	//processes a sign-up
	public function processSignup($u, $p, $c, $e, $f, $l) {
		if (User::loadByUsername($u)!=null) { // if the username is in the database
			$_SESSION['msg'] = "That username is taken. Please try another"; // inform user
			header('Location: '.BASE_URL.'/signup/'); // navigate back to signup
			exit();
		}
		$password_hash = password_hash($p, PASSWORD_DEFAULT); // set up password hash
		User::addUser($u, $password_hash, $f, $l, $e); // add the user to the database
		$_SESSION['msg'] = null; // set message to null
		$this->processLogin($u, $p); //automatically log them in
		exit(); // exit
	}

	// follow a user
	public function follow($followingID){
		Follower::addFollow($_SESSION['id'],$followingID); // add the follow relationship to the db
		$action = 'follow';
		$description = ' followed ';
		$name = User::loadById($followingID)->get('username');
		$url_mod = 'profile';
		Actions::addAction($url_mod, $followingID, $name, $action, $description, $_SESSION['id'], $_SESSION['user']);  // add action to db
		header('Location: '.BASE_URL.'/profile/'.$_SESSION['id'].'/followers'); //navigates to followers page
		exit();
	}

	// displays the "my followers" page
	public function followers($followingID){
	$pageName = 'followers';
	$followers = Follower::loadByFollowerId($followingID); // loads your followers
	$following = Follower::loadByFollowingId($followingID); // loads who you are following
	include_once SYSTEM_PATH.'/view/header.tpl';
	include_once SYSTEM_PATH.'/view/myFollowers.tpl';
	include_once SYSTEM_PATH.'/view/footer.tpl';
	}

// removes a follower
	public function removeFollowers($userId){
		Follower::removeFollow($userId, $_SESSION['id']); // removes the follow relationship from db
		header('Location: '.BASE_URL.'/profile/'.$_SESSION['id'].'/followers'); //navigates back to followers page
	}

 // displays the edit user roles page
	public function editUserRoles(){
		$users = User::getAllUsers(); // displays all users
		$userCount = 0;
		foreach($users as $user){
			$userCount++; //counts all users
		}
		$products = Product::getAllProducts();
		$productCount = 0;
		foreach($products as $product){
			$productCount++; // counts all products
		}
		$comments = Comment::getAllComments();
		$commentCount = 0;
		foreach($comments as $comment){
			$commentCount++; //counts all comments
		}
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/users.tpl'; // the tpl for editing user roles
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

 //changes the role of the user
	public function changeRole($userId, $newRole){
		$user = User::loadById($userId); // loads the user
		$user->set('user_type', $newRole); // sets their new permission
		$user->save(); // saves
		header('Location: '.BASE_URL.'/users/'); // navigates back to edit user roles page
	}

	// processes profile edits
	public function profileProcess($userId, $firstname, $lastname, $biography, $emailaddress, $gender){
		$user = User::loadById($userId); // loads the user
		$user->set('first_name', $firstname); //sets all edited fields
		$user->set('last_name', $lastname);
		$user->set('bio', $biography);
		$user->set('email', $emailaddress);
		$user->set('gender', $gender);
		$user->save(); //saves
		header('Location: '.BASE_URL.'/profile/'.$userId); //navigates back to profile
	}

	// displays the color/user json array on a page
	public function getColorData(){
		$colorArray = User::getColorArray(); // loads the array from the user class
		header('Content-Type: application/json'); // sets header type
		echo json_encode($colorArray); // writes the array to the page
	}

	// parses and displays the follower matrix on a page
	public function getFollowData(){
		$userArray = array(); // instantiate an array
		$users1 = User::getAllUsers(); //get all users
		$users2 = User::getAllUsers(); //get all users again
		foreach($users1 as $user1){ // cycle through all users
			$id1 = $user1->get("id"); // get the id
			$row_array = array(); // set up another array for each row
			foreach($users2 as $user2){ // cycle through all users again
				$id2 = $user2->get("id"); // get the id
				if ($id1 != $id2 && Follower::isFollowing($id1, $id2)){ //if the users arent the same and 1 is following 2
					array_push($row_array, 1); // put 1 into the matrix to show a following relationship
				}
				else { //otherwise
					array_push($row_array, 0); // put 0 to show no following relationship
				}
			}
			array_push($userArray,$row_array); //push the row to the matrix
		}
		header('Content-Type: application/json'); //set content type
		echo json_encode($userArray); //write to the page
	}

	// change the color of a chart arc
	public function changeColor($id, $color)
	{
		header('Content-Type: application/json'); //set the header
		if($color == '') {  		// title can't be blank
			$json = array('error' => 'Color cannot be blank.'); // display error if so
			echo json_encode($json); // write error to json for js file
			exit();
		}
		$user = User::loadById($id);		//load the user
		$user->set('color', $color); // set their new color
		$user->save(); //save it
		$json = array('success' => 'success'); //set up success json
		echo json_encode($json); //send success json to js
		exit();
	}

	// parses and displays a following array
	public function buildFollowArray(){
		$userArray = array(); // instantiate an array
		$users = User::getAllUsers(); //get all users
		$id1 = $_SESSION['id']; // get the id
		foreach($users as $user){ // cycle through all users
			$id2 = $user->get("id"); // get the id
				if ($id1 != $id2 && Follower::isFollowing($id1, $id2)){ //if the users arent the same and 1 is following 2
					$rowArray['id'] = $id2;
					$rowArray['username'] = $user->get("username");
					array_push($userArray, $rowArray); // put the following id in the array
				}
			}
		header('Content-Type: application/json'); //set content type
		echo json_encode($userArray); //write to the page
	}

	public function conversation($userId){
		$messages = Messages::getMessages($_SESSION['id'], $userId); // loads all associated messages
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/messages.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function sendMessage($userId){
	}
}

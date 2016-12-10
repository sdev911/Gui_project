<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a ProductController and route it
$pc = new ProductController();
$pc->route($action);

class ProductController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			case 'products':
				$this->outfits();
				break;

			case 'checkout':
				$this->checkout();
				break;

			case 'additemprocess':
				$this->additemprocess();
				break;

			case 'comment':
				$productID = $_GET['pid'];
				$this->comment($productID);
				break;

			case 'itemdetailview':
				$productID = $_GET['pid'];
				$this->itemdetailview($productID);
				break;

			case 'editProduct':
				$productID = $_GET['pid'];
				$this->editProduct($productID);
				break;

			case 'editProductProcess':
				$productID = $_GET['pid'];
				$this->editProductProcess($productID);
				break;

			case 'removeProduct':
				$productID = $_GET['pid'];
				$this->removeProductCheck($productID);
				break;

			case 'removeProductProcess':
				$productID = $_GET['pid'];
				$this->removeProductProcess($productID);
				break;

			case 'addtocart':
				$productID = $_GET['pid'];
				$uid = $_SESSION['id'];
				$this->addtocart($productID, $uid);
				break;

			case 'removefromcart':
				$productID = $_GET['pid'];
				$uid = $_SESSION['id'];
				$this->removefromcart($productID, $uid);
				break;

			case 'viewcatprocess':
				$this->viewcatprocess($_GET);
				break;

			case 'rateproduct':
				$productID = $_GET['pid'];
				$rating = $_GET['rating'];
				$this->rateproduct($productID, $rating);
				break;

      // redirect to home page if all else fails
      default:
        header('Location: '.BASE_URL);
        exit();
		}
	}

	// rates the product
	public function rateproduct($pid, $rating) {
		$myRatingId = Rating::ratingByUserId($_SESSION['id'], $pid); // pulls a rating from the database
		if ($myRatingId == null){ // if there is no rating
			Rating::addRating($_SESSION['id'], $pid, $rating); // adds a rating to the database
		}
		else{ // if there is a rating
			$myRating = Rating::loadById($myRatingId); // loads the rating
			$myRating->set('rating', $rating); // resets the rating
			$myRating->save(); // saves the rating
		}
		$title = Product::loadById($pid)->get('title');		// loads the product title
		$this->addAction('rating', ' gave a '.$rating.' star rating to ', $pid, $title); // adds the rating to the action table
		header('Location: '.BASE_URL.'/itemdetailview/'.$pid); // navigates back to the item you were on
	}

// this shows images of cats
public function viewcatprocess(){
	  $id = rand(1, 11); // picks a random cat image from img folder
	while (Product::loadById($id) == null){
			$id = rand(1, 11);
		}
		$cat = Product::loadById($id);
		$catpicture = $cat->get('image_url'); //gets the cat image
		$catarr = array('catimageurl' => $catpicture); // displays images in an array
		echo json_encode($catarr);		// encodes in json for ajax
	}

// displays the outfits page
  public function outfits() {
		$pageName = 'Outfits';
		$products = Product::getAllProducts(); // loads products for the tpl

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/outfits.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	// displays one detailed item
	public function itemdetailview($id) {
		$rating = 0;		// rating is default 0
		if (isset($_SESSION['id']))
		{
			$myRatingId = Rating::ratingByUserId($_SESSION['id'], $id);	//checks the users rating of the product
			if ($myRatingId != null){
				$rating = Rating::loadById($myRatingId)->get('rating');		//displays the user rating
			}
		}
		$product = Product::loadById($id);	// loads the product
		$comments = Comment::loadByProductId($id); // loads all associated comments
		$pageName = '<?= $product->get("title") ?>';		// displays the page name
		$actions = Actions::getProductActions($id);		// gets all associated actions

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/itemdetailview.tpl';
		include_once SYSTEM_PATH.'/view/feed.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	// shows the edit product page
	public function editProduct($id) {
		$pageName = 'Edit Product';
		$product = Product::loadById($id); // loads the product

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/editProduct.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	// adds an item to the cart
	public function addtocart($pid, $uid){
		$product = Product::loadById($pid); // loads the product
		Cart::addProduct($product->get('title'), $product->get('price'), $product->get('image_url'), $uid); // adds the product
		header('Location: '.BASE_URL.'/cart/'); // navigates to cart
	}

// removes an item from the cart
	public function removefromcart($pid, $uid){
		Cart::removeProduct($pid, $uid); // removes the item
		$_SESSION['msg'] = "You removed the from your cart called "; // informs the user
		header('Location: '.BASE_URL.'/cart/'); // navigates back to cart
	}

	//The process for adding an item
	public function additemprocess() {
		$args = array(
		'title' => $_POST['title'],
		'description' => $_POST['description'],
		'price' => $_POST['price'],
		'image_url' => $_POST['image_url'],
		'creator_id' => $_SESSION['id']	
		);

		if ($args['title'] != NULL)
		{
			$P = new Product($args);
			$P -> save();
			$id = $P -> getId();
			$this->addAction('add', ' added the product ', $id, $args['title']);
		}
  }

// displays a catfact from the catfacts-api
	private function getCatFact() {
		$endpoint = 'http://catfacts-api.appspot.com/api/facts'; //sets up endpoint
		$contents = file_get_contents($endpoint);		//calls the endpoint
		$json = json_decode($contents);	//decodes
		$fact = $json->{'facts'}; //gets the fact
		return implode($fact); // returns the fact
	}

	// the process for editing a product
	public function editProductProcess($id) {
		$title = $_POST['title']; //gets information posted from form
		$description = $_POST['description'];
		$sizes = $_POST['sizes'];
		$price = $_POST['price'];
		$image_url = $_POST['image_url'];

		$p = Product::loadById($id); // loads the product
		$p->set('title', $title); // edits the fields
		$p->set('description', $description);
		$p->set('sizes', $sizes);
		$p->set('price', $price);
		$p->set('image_url', $image_url);
		$p->save(); // saves the product

		$_SESSION['msg'] = "You edited the product called ".$title; // informs the user
		header('Location: '.BASE_URL.'/outfits/'); // navigates back to the outfits page

		$this->addAction('edit', ' edited the item ', $id, $title); // adds and action for editing an item
	}

// checks with user before removing a product
	public function removeProductCheck($id){
		$p = Product::loadById($id);
		$title = $p->get('title');
		include_once SYSTEM_PATH.'/view/removeProductCheck.tpl'; // checks with user to confirm
	}

// the process for removing a product
	public function removeProductProcess($id){
		$name = Product::loadById($id)->get('title');
		Product::removeProduct($id); // removes the product
		$_SESSION['msg'] = "You deleted the product called "; // informs the user they have removed the product
		header('Location: '.BASE_URL.'/outfits/'); //navigates back to outfits page

		$this->addAction('remove', ' removed ', $id, $name); // adds the action to the feed
	}

// the method for creating a comment
	public function comment($pid){
		$myComment = $_POST['commentText'];
		Comment::addComment($pid, $myComment, $_SESSION['id'], $_SESSION['user']); // adds the comment to the db
		header('Location: '.BASE_URL.'/itemdetailview/'.$pid); // navigates back to item commented on

		$name = Product::loadById($pid)->get('title');
		$this->addAction('comment', ' added the comment "'.$myComment.'" to item ', $pid, $name); // adds the action to the feed
	}


// the method for adding actions to the action db (used for the activity feed)
	public function addAction($action, $description, $id, $target_name) {
		if ($action == 'follow') {
			$url_mod = 'profile'; //specifies it should redirect to a user if clicked
		}
		else {
			$url_mod = 'itemdetailview'; // specifies it should redirect to a product if clicked
		}
		Actions::AddAction($url_mod, $id, $target_name, $action, $description, $_SESSION['id'], $_SESSION['user']); // adds the action to the db
		header('Location: '.BASE_URL.'/');
	}
}

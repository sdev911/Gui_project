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
        $productType = $_GET['ptype'];
        if($productType == 'outfits') {
				    $this->outfits();
        } elseif($productType == 'accessories') {
            $this->accessories();
        }
				break;

			case 'checkout':
				$this->checkout();
				break;

			case 'additem':
			 	$this->additem();
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
				$this->addtocart($productID);
				break;
			case 'removefromcart':
				$productID = $_GET['pid'];
				$this->removefromcart($productID);
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

	public function rateproduct($pid, $rating) {
		$myRatingId = Rating::ratingByUserId($_SESSION['id'], $pid);
		if ($myRatingId == null){
			Rating::addRating($_SESSION['id'], $pid, $rating);
		}
		else{
			$myRating = Rating::loadById($myRatingId);
			$myRating->set('rating', $rating);
			$myRating->save();
		}

		$title = Product::loadById($pid)->get('title');
		$this->addAction('rating', ' gave a '.$rating.' star rating to ', $pid, $title);
		header('Location: '.BASE_URL.'/itemdetailview/'.$pid);
	}

public function viewcatprocess(){
	  $id = rand(1, 11);
	while (Product::loadById($id) == null){
			$id = rand(1, 11);
		}
		$cat = Product::loadById($id);
		$catpicture = $cat->get('image_url');
		$catarr = array('catimageurl' => $catpicture);
		echo json_encode($catarr);
	}

  public function accessories() {
		$pageName = 'Accessories';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/accessories.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

  public function outfits() {
		$pageName = 'Outfits';
		$products = Product::getAllProducts();

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/outfits.tpl';
		//include_once SYSTEM_PATH.'/view/additem.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	public function additem() {
		$conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
		      or die ('Error: Could not connect to MySql database');
		    mysql_select_db(DB_DATABASE);
		    $title = $_POST['tittle'];
		    $img_url = $_POST['img_url'];
		    $description = $_POST['description'];
		    $price = $_POST['price'];
				$sizes = $_POST['sizes'];
		  $q = sprintf ("INSERT INTO `products` (`title`, `img_url`, `description`, `price`, 'sizes', `creator_id`) VALUES ('%s', '%s', '%s', '%d', '%s', '%d'); ", $title, $img_url, $description, $price, $size, $_SESSION['id']);
		  mysql_query($q);
		  header('Location: '.BASE_URL.'/');

		// $pageName = 'Add Item';
		// echo 'additem';
		// include_once SYSTEM_PATH.'/view/header.tpl';
		// include_once SYSTEM_PATH.'/view/additem.tpl';
		// include_once SYSTEM_PATH.'/view/footer.tpl';
  }
	public function itemdetailview($id) {
		$rating = 0;
		if (isset($_SESSION['id']))
		{
			$myRatingId = Rating::ratingByUserId($_SESSION['id'], $id);
			if ($myRatingId != null){
				$rating = Rating::loadById($myRatingId)->get('rating');
			}
		}
		$product = Product::loadById($id);
		$comments = Comment::loadByProductId($id);
		$pageName = '<?= $product->get("title") ?>';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/itemdetailview.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	public function editProduct($id) {
		$pageName = 'Edit Product';
		$product = Product::loadById($id);

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/editProduct.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function addtocart($id){
		$product = Product::loadById($id);
		Cart::addProduct($product->get('title'), $product->get('image_url'), $product->get('price'));
		header('Location: '.BASE_URL.'/cart/');
	}

	public function removefromcart($id){
		Cart::removeProduct($id);
		$_SESSION['msg'] = "You removed the from your cart called ";
		header('Location: '.BASE_URL.'/cart/');
	}

	public function additemprocess() {
		//$title = $_POST['title'];
		//$description = $_POST['description'];
		//$sizes = $_POST['size'];
		//$price = $_POST['price'];
		//$image_url = $_POST['image_url'];

		//these were put into associative arrays. need to get it working with AJAX

		//$info = $_POST;
		//foreach($info as $key => $value) {
  		//$key $value;
		//}
		//echo var_dump($info);

		//Product::addProduct($title, $description, $sizes, $price, $image_url);
		//header('Location: '.BASE_URL.'/blouses/');

		$info = $_POST;
		$title = "";
		$description = "";
		$price = "";
		$sizes = "";
		$image_url = "";
		foreach($info as $key => $value) {
			if ($key == 'title'){
				$title = $value;
			}
			if ($key == 'description'){
				$description = $value;
			}
			if ($key == 'price'){
				$price = $value;
			}
			if ($key == 'sizes'){
				$sizes = $value;
			}
			if ($key == 'image_url'){
				$image_url = $value;
			}
		}
		Product::addProduct($title, $description, $sizes, $price, $image_url);

		if ($title != null) {
			$id = Product::getId();
			$this->addAction('add', ' added the product ', $id, $title);
		}
  }

	private function getCatFact() {
		$endpoint = 'http://catfacts-api.appspot.com/api/facts';
		$contents = file_get_contents($endpoint);
		$json = json_decode($contents);
		$fact = $json->{'facts'};
		return implode($fact);
	}

	public function editProductProcess($id) {
		$title = $_POST['title'];
		$description = $_POST['description'];
		$sizes = $_POST['sizes'];
		$price = $_POST['price'];
		$image_url = $_POST['image_url'];

		$p = Product::loadById($id);
		$p->set('title', $title);
		$p->set('description', $description);
		$p->set('sizes', $sizes);
		$p->set('price', $price);
		$p->set('image_url', $image_url);
		$p->save();

		//
		//
		// // connect to DATABASE FIRST
		// $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
		// 	or die ('Error: Could not connect to MySql database');
		// mysql_select_db(DB_DATABASE);
		//
		// $q = sprintf("UPDATE product
		// 		SET title = '%s', description = '%s', sizes = '%s', price = %d, img_url = '%s'
		// 		WHERE id = %d ",
		// 		$title,
		// 		$description,
		// 		$sizes,
		// 		$price,
		// 		$img_url,
		// 		$id
		// 	);
		// 	echo $q;
		// 	mysql_query($q);

		$_SESSION['msg'] = "You edited the product called ".$title;
		header('Location: '.BASE_URL.'/outfits/');

		$this->addAction('edit', ' edited the item ', $id, $title);
	}

	public function removeProductCheck($id){
		$p = Product::loadById($id);
		$title = $p->get('title');
		include_once SYSTEM_PATH.'/view/removeProductCheck.tpl';
	}

	public function removeProductProcess($id){
		$name = Product::loadById($id)->get('title');
		Product::removeProduct($id);
		$_SESSION['msg'] = "You deleted the product called ";
		header('Location: '.BASE_URL.'/outfits/');

		$this->addAction('remove', ' removed ', $id, $name);
	}

	public function comment($pid){
		$conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
		      or die ('Error: Could not connect to MySql database');
		    mysql_select_db(DB_DATABASE);
		    $myComment = $_POST['commentText'];
		  $q = sprintf ("INSERT INTO `comments` (`product_id`, `comment`, `creator_id`, `creator_username`) VALUES ('%d', '%s', '%d', '%s'); ", $pid, $myComment, $_SESSION['id'], $_SESSION['user']);
		  mysql_query($q);
			header('Location: '.BASE_URL.'/');

			$name = Product::loadById($pid)->get('title');
			$this->addAction('comment', ' added the comment "'.$myComment.'" to item ', $pid, $name);
	}

	public function addAction($action, $description, $id, $target_name) {
		$conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
		      or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

		if ($action == 'follow') {
			$url_mod = 'profile';
		}
		else {
			$url_mod = 'itemdetailview';
		}

		$q = sprintf("INSERT INTO `actions` (`url_mod`, `target_id`, `target_name`, `action`, `description`, `creator_id`, `creator_username`) VALUES ('%s', '%d', '%s', '%s', '%s', '%d', '%s'); ", $url_mod, $id, $target_name, $action, $description, $_SESSION['id'], $_SESSION['user']);
		mysql_query($q);
		header('Location: '.BASE_URL.'/');
	}
}

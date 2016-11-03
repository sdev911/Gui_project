<?php

function isSelected($pn, $link) {
	if($pn == $link) {
		return ' id="selected-nav" ';
	}
}

?>
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>DreamAloud</title>
  <meta name="description" content="Clothing store for dreamers">
  <meta name="author" content="Allison Collier">
	<script>
		var baseURL = "<?=BASE_URL?>";
	</script>
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/style.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/Outfits.css">
  <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
  <script type="text/javascript" src="<?=BASE_URL?>/public/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="<?=BASE_URL?>/public/js/scripts.js"></script>
<script type="text/javascript" src="<?= BASE_URL ?>/public/js/catFact.js"></script>
  <meta name="viewport" content="initial-scale=1">
  <!--All photos come from modcloth.com / http://fashiontasty.com/pastel-dresses-style-ideas/ and rosegal.com-->
	<!--Some code referenced from Piazza and Class slides (especially in the model)-->

</head>

<body>

  <div id="wrapper">

		<div id="header">

	  <h1><a href="/">Dream Aloud</a></h1>

	  <ul id="primary-nav">
	  	<li><a href="<?=BASE_URL?>/outfits">Outfits</a></li>
	  	<li><a href="<?=BASE_URL?>/accessories">Accessories</a></li>
	  	<li><a href="contact.php">Contact</a></li>
	    <li id="search2">
	      <input type="text" value="Search products" /> <button>Go</button>
	    </li>
			<?php

			session_start();
			if(isset($_SESSION['user'])): ?>
				<li style="float:right"><a href="<?=BASE_URL?>/logout">Logout</a></li>
				<li style="float:right"><a><?= $_SESSION['user'] ?></a></li>
		 <?php	else: ?>
				<li style="float:right"><a href="<?=BASE_URL?>/login">Login</a></li>


			<?php endif; ?>
	    <li><a href="<?=BASE_URL?>/cart" id="shopping-cart">Shopping Cart</a></li>
	    <li id="breakFloat"></li>
	  </ul>

		<div style="background-color: lightblue;">
			<p>Cat Fact: <?=$this->getCatFact() ?></p>
		</div>

	  </div>

<!--
// Unset all of the session variables.
$_SESSION = array();

// If it's desired to kill the session, also delete the session cookie.
// Note: This will destroy the session, and not just the session data!
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// Finally, destroy the session.
session_destroy();
?>

-->

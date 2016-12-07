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
	<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/bootstrap/js/bootstrap.min.js">
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

			<nav class="navbar navbar-default" style="margin-bottom: 0px; background-color: rgba(0,0,0,0); border-color: rgba(0,0,0,0);">
			  <div class="container-fluid">
			    <div class="navbar-header">
			      <a class="navbar-brand" href="/">
							<img alt="Brand" src="<?=BASE_URL?>/public/img/logo.png">
						</a>
			    </div>
			    <ul class="nav navbar-nav">
			      <li><a href="<?=BASE_URL?>/outfits">Outfits</a></li>
			      <li><a href="#">About Us</a></li>
			      <li><a href="#">Contact Us</a></li>
			    </ul>
					<ul class="nav navbar-nav navbar-right">
						<?php
						if(isset($_SESSION['user'])): ?>
						<li><a href="<?=BASE_URL?>/cart">Shopping Cart</a></li>
						<?php endif; ?>
						<?php	if(isset($_SESSION['user'])): ?>
							<li><a href="<?=BASE_URL?>/logout">Logout</a></li>
							<li><a href="<?=BASE_URL?>/profile/<?= $_SESSION['id'] ?>"><?= $_SESSION['user'] ?></a></li>
							<?php if(($_SESSION['permissions'])==2): ?>
								<li><a href="<?=BASE_URL?>/users/">Set User Roles</a></li>
							<?php endif; ?>
					 <?php	else: ?>
							<li><a href="<?=BASE_URL?>/login">Login</a></li>
							<li><a href="<?=BASE_URL?>/signup">Signup</a></li>
						<?php endif; ?>
					</ul>

			  </div>
			</nav>


</div>
</div>

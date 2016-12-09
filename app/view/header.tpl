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
<script type="text/javascript" src="<?=BASE_URL?>/public/js/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/bootstrap/css/bootstrap.min.css">
	<script type="text/javascript" src="<?= BASE_URL ?>/public/bootstrap/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	<script type="text/javascript" src="<?=BASE_URL?>/public/js/scripts.js"></script>
<script type="text/javascript" src="<?= BASE_URL ?>/public/js/catFact.js"></script>
<?php if ($pageName == 'followers'): ?>
	<script src="http://d3js.org/d3.v2.min.js?2.8.1"></script>
	<script type="text/javascript" src="<?= BASE_URL ?>/public/js/chart.js"></script>
	<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/chart.css">
<?php endif; ?>
  <meta name="viewport" content="initial-scale=1">
  <!--All photos come from modcloth.com / http://fashiontasty.com/pastel-dresses-style-ideas/ and rosegal.com-->
	<!--Some code referenced from Piazza and Class slides (especially in the model)-->

</head>

<body>

<!-- About Us Modal -->
<div class="modal fade" id="aboutModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">About Us</h4>
      </div>
      <div class="modal-body">
        Dream Aloud is an ecommerce store that specializes in selling the best and brightest kitty couture. We aim to provide
	the best shopping experience for our online customers. Contact us if there is anything more we can do to serve you better.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Contact Us Modal -->
<div class="modal fade" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="contactModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Contact Us</h4>
      </div>
      <div class="modal-body">
	<p>Dream Aloud</p> 
	<p>1094 Dream Drive</p>
	<p>Blacksburg, VA 24060</p>  
	<p>540-680-9944</p>
	<p>Email: customerservice@dreamaloud.me</p>        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
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
			      <li><a data-target="#aboutModal" id="about" href="#aboutModal">About Us</a></li>
			      <li><a data-target="#contactModal" id="contact" href="#contactModal">Contact Us</a></li>
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
<div id="base-url" data-base="<?=BASE_URL?>"></div>


</div>
</div>

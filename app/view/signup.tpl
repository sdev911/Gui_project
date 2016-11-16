<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/signup.css">
 <link href="<?= BASE_URL ?>/public/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
  <link href="<?= BASE_URL ?>/public/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

  <script src="<?= BASE_URL ?>/public/bootstrap/bootstrap-validator/dist/validator.min.js"></script>

<div id="content">
<?php	if(isset($_SESSION['msg'])): ?>
<h3> <?=$_SESSION['msg']?> </h3>
<?php endif; ?>
<h2>Sign Up</h2>

<form id="signup" action="<?= BASE_URL ?>/signup/process" method="POST" data-toggle="validator">

  <div class="form-group">
  <label class="required">Username:</label>
  <input class="form-control" type="text" name="un">
  <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
  <label class="required">Password:</label>
  <input class="form-control" type="password" name="pw">
  </div>
  <div class="form-group">
  <label class="required">Confirm Password:</label>
  <input class="form-control" type="password" name="confirmpw">
  </div>
  <div class="form-group">
  <label class="required">Email address:</label>
  <input class="form-control" type="email" name="email" data-error="Please enter a valid email address." required>
  <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
  <label>First name:</label>
  <input type="text" class="form-control" name="fname">
  </div>
  <div class="form-group">
  <label>Last name:</label>
  <input type="text" class="form-control" name="lname">
  </div>

  <input type="submit" name="createAccount" value="Create Account">

</form>

</div>

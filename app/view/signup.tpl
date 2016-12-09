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
  <input class="form-control" type="text" name="un" data-error="Please enter a username." required><!-- If the username field is left blank a message will appear notifying the user it is missing -->
  <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
  <label class="required">Password:</label>
  <input class="form-control" id="inputPassword" type="password" name="pw" data-error="Please enter a password." required> <!-- If the password field is left blank a message will appear notifying the user it is missing -->
  <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
  <label class="required">Confirm Password:</label> <!-- Make sure the passwords match -->
  <input class="form-control" data-match="#inputPassword" type="password" name="confirmpw" data-error="Passwords do not match." required> <!--If the passwords do not match a message will appear notifying the user -->
  <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
  <label class="required">Email address:</label>
  <input class="form-control" type="email" name="email" data-error="Please enter a valid email address." required> <!-- If the email field is left blank or it does not contain an @ symbol a message will appear notifying the user it is missing/invalid -->
  <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
  <label>First name:</label>
  <input type="text" class="form-control" name="fname" data-error="Please enter your first name." required> <!-- If the first name field is left blank a message will appear notifying the user it is missing -->
  <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
  <label>Last name:</label>
  <input type="text" class="form-control" name="lname" data-error="Please enter your last name." required> <!-- If the last name field is left blank a message will appear notifying the user it is missing -->
  <div class="help-block with-errors"></div>
  </div>

  <input type="submit" class="btn btn-primary" name="createAccount" value="Create Account"> <!-- Submits the sign up form -->

</form>

</div>

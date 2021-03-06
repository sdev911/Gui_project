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
  <!-- If the username field is left blank a message will appear notifying the user it is missing -->
  <input class="form-control" type="text" name="un" data-error="Please enter a username." required>
  <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
  <label class="required">Password:</label>
  <!-- If the password field is left blank a message will appear notifying the user it is missing -->
  <input class="form-control" id="inputPassword" type="password" name="pw" data-error="Please enter a password." required> 
  <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
  <label class="required">Confirm Password:</label> <!-- Make sure the passwords match -->
  <!--If the passwords do not match a message will appear notifying the user -->
  <input class="form-control" data-match="#inputPassword" type="password" name="confirmpw" data-error="Passwords do not match." required> 
  <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
  <label class="required">Email address:</label>
  <!-- If the email field is left blank or does not have an @ symbol a message will appear notifying the user it is missing/invalid -->
  <input class="form-control" type="email" name="email" data-error="Please enter a valid email address." required> 
  <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
  <label>First name:</label>
  <!-- If the first name field is left blank a message will appear notifying the user it is missing -->
  <input type="text" class="form-control" name="fname" data-error="Please enter your first name." required> 
  <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
  <label>Last name:</label>
  <!-- If the last name field is left blank a message will appear notifying the user it is missing -->
  <input type="text" class="form-control" name="lname" data-error="Please enter your last name." required> 
  <div class="help-block with-errors"></div>
  </div>

  <input type="submit" class="btn btn-primary" name="createAccount" value="Create Account"> <!-- Submits the sign up form -->

</form>

</div>

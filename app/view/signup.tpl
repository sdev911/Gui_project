<div id="content">
<?php	if(isset($_SESSION['msg'])): ?>
<h3> <?=$_SESSION['msg']?> </h3>
<?php endif; ?>
<h2>Sign Up</h2>

<form id="signup" action="<?= BASE_URL ?>/signup/process" method="POST">

  <label class="required">Username: <input type="text" name="un"></label>
  <label class="required">Password: <input type="password" name="pw"></label>
  <label class="required">Confirm Password: <input type="password" name="confirmpw"></label>
  <label class="required">Email address: <input type="text" name="email"></label>
  <label>First name: <input type="text" name="fname"></label>
  <label>Last name: <input type="text" name="lname"></label>

  <input type="submit" name="createAccount" value="Create Account">

</form>

</div>

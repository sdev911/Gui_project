   <link href="<?= BASE_URL ?>/app/view/css/bootstrap.css" rel="stylesheet" type="text/css" />
  <link href="<?= BASE_URL ?>/app/view/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="<?= BASE_URL ?>/public/css/profile.css" rel="stylesheet" type="text/css" />

  <script src="<?= BASE_URL ?>/app/view/bootstrap-validator-master/dist/validator.min.js"></script>
  <script src="<?= BASE_URL ?>/public/js/profile.js"></script>
  
<form class="col-sm-4 col-md-offset-4" data-toggle="validator" role="form" id="profileForm" method="post" action="<?= BASE_URL ?>/profile/process/">
  <div class="form-group">
    <label for="exampleInputEmail1">First Name</label>
    <input type="first name" class="form-control" id="inputFName" aria-describedby="fnameHelp" placeholder="Enter first name" name="fname" value="<?=$userInfo->get('first_name') ?>">
  </div>
    <div class="form-group">
    <label for="exampleInputAdress1">Last Name</label>
    <input type="last name" name="lname" class="form-control" id="inputLName" aria-describedby="lnameHelp" placeholder="Enter last name" value="<?=$userInfo->get('last_name') ?>">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Bio</label>
    <textarea form="profileForm" class="form-control" id="inputBio" aria-describedby="bioHelp" placeholder="Enter bio" name="bio"><?=$userInfo->get('bio') ?></textarea>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email</label>
    <input type="email" name="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" placeholder="Enter email" value="<?=$userInfo->get('email') ?>" class="form-control" data-error="Please enter a valid email address." required>
    <div class="help-block with-errors"></div>
  </div>
  <fieldset class="form-group">
    <legend>Gender</legend>
    <div class="form-check">
      <label class="form-check-label">
        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="male" <?=($userInfo->get('gender') == male)?'checked':''?> required>
        Male
      </label>
    </div>
    <div class="form-check">
    <label class="form-check-label">
        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="female" <?=($userInfo->get('gender') == female)?'checked':''?>>
        Female
      </label>
    </div>
    <div class="form-check disabled">
    <label class="form-check-label">
        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios3" value="other" <?=($userInfo->get('gender') == other)?'checked':''?>>
        Other
        <div class="help-block with-errors"></div>
      </label>
    </div>
  </fieldset>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>



<div class="container" id="profileInfo">
  <div class="col-sm-4 col-md-offset-4">
    <h4>First Name: <?=$userInfo->get('first_name') ?></h4>
    <h4>Last Name: <?=$userInfo->get('last_name') ?></h4>
    <h4>Username: <?=$userInfo->get('username') ?></h4>
    <h4>Email: <?=$userInfo->get('email') ?></h4>
    <h4>Gender: <?=$userInfo->get('gender') ?></h4>
    <h4>Bio: <?=$userInfo->get('bio') ?></h4>
<a href="<?= BASE_URL ?>/profile/<?= $userId ?>/followers/">
<button type="button" id="viewFollowers" class="btn btn-success">View Followers</button>
</a>
<?php if($_SESSION['id']==$userId): ?>
<button type="button" id="editProfile" class="btn btn-warning">Edit Profile</button>
<?php endif; ?>
  </div>
</div>

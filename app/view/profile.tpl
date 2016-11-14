<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">

  <title>Profile</title>

   <link href="<?= BASE_URL ?>/app/view/css/bootstrap.css" rel="stylesheet" type="text/css" />
  <link href="<?= BASE_URL ?>/app/view/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

  <script src="<?= BASE_URL ?>/app/view/bootstrap-validator-master/dist/validator.min.js"></script>

</head>
<body>
<form class="col-sm-4" data-toggle="validator" role="form" id="profileForm" method="post" action="<?= BASE_URL ?>/profile/process/<?=id ?>">
  <div class="form-group">
    <label for="exampleInputEmail1">First Name</label>
    <input type="first name" class="form-control" id="inputFName" aria-describedby="fnameHelp" placeholder="Enter first name" name="fname">
  </div>
    <div class="form-group">
    <label for="exampleInputAdress1">Last Name</label>
    <input type="last name" name="lname" class="form-control" id="inputLName" aria-describedby="lnameHelp" placeholder="Enter last name">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Bio</label>
    <textarea form="profileForm" class="form-control" id="inputBio" aria-describedby="bioHelp" placeholder="Enter bio" name="bio"></textarea>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email</label>
    <input type="email" name="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" placeholder="Enter email" class="form-control" data-error="Bruh, that email address is invalid">
  </div>
  <div class="help-block with-errors"></div>
  <fieldset class="form-group">
    <legend>Gender</legend>
    <div class="form-check">
      <label class="form-check-label">
        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="male">
        Male
      </label>
    </div>
    <div class="form-check">
    <label class="form-check-label">
        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="female">
        Female
      </label>
    </div>
    <div class="form-check disabled">
    <label class="form-check-label">
        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios3" value="other">
        Other
      </label>
    </div>
  </fieldset>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>



<div class="container" id="profileInfo">
  <div class="col-sm-4" style="display: block;">
    <h4>First Name: </h4>
    <h4>Last Name: </h4>
    <h4>Username: </h4>
    <h4>Email: </h4>
    <h4>Gender: </h4>

<button type="button" id="viewFollowers" class="btn btn-success">View Followers</button>
<button type="button" id="editProfile" class="btn btn-warning">Edit Profile</button>
  </div>
</div>

</body>

</html>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">

  <title>Profile</title>

  <link href="<?= BASE_URL ?>/app/css/bootstrap.css" rel="stylesheet" type="text/css" />
  <link href="<?= BASE_URL ?>/app/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

  <script src="<?= BASE_URL ?>/app/bootstrap-validator-master/dist/validator.min.js"></script>

</head>
<body>
<form class="col-sm-4" data-toggle="validator" role="form" id="profileForm">
  <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input type="name" class="form-control" id="inputName1" aria-describedby="nameHelp" placeholder="Enter name">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Bio</label>
    <textarea form="profileForm" class="form-control" id="inputBio1" aria-describedby="bioHelp" placeholder="Enter bio"></textarea>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email</label>
    <input type="email" class="form-control" id="inputEmail1" aria-describedby="emailHelp" placeholder="Enter email" class="form-control" data-error="Bruh, that email address is invalid" required>
  </div>
  <div class="help-block with-errors"></div>
  <div class="form-group">
    <label for="exampleInputAdress1">Address</label>
    <input type="address" class="form-control" id="inputAddress1" aria-describedby="addressHelp" placeholder="Enter address">
  </div>
  <fieldset class="form-group">
    <legend>Gender</legend>
    <div class="form-check">
      <label class="form-check-label">
        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="option1">
        Male
      </label>
    </div>
    <div class="form-check">
    <label class="form-check-label">
        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
        Female
      </label>
    </div>
    <div class="form-check disabled">
    <label class="form-check-label">
        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios3" value="option3">
        Neither
      </label>
    </div>
  </fieldset>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>



<div class="container">
  <div class="col-sm-4">
    <h4>Name: </h4>
    <h4>Username: </h4>
    <h4>Address: </h4>
    <h4>Email: </h4>
    <h4>Gender: </h4>

<button type="button" class="btn btn-success">View Friends List</button>
<button type="button" class="btn btn-warning">Edit Profile</button>
  </div>
</div>

</body>

</html>

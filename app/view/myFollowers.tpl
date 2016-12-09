<link href="<?= BASE_URL ?>/public/css/myFollowers.css" rel="stylesheet" type="text/css" />
<div id="content">

<h2><?= User::loadById($followingID)->get('username') ?> is Following:</h2><!-- Display the username of the user who's follower page this is -->
<?php if ($followers != null):  ?> <!-- if you are following anyone -->

<?php foreach($followers as $follower) : ?>  <!-- loop through each of the people the user is following -->
  <h5>
    <a href = "<?= BASE_URL ?>/profile/<?= $follower->get('following_id') ?>"> <!-- if you click on the follower's username it will take you to their profile -->
      <?= User::loadById($follower->get('following_id'))->get('username') ?><!-- Displays username of follower -->
    </a>
    <?php if (isset($_SESSION['user'])): ?>
     <?php if(Follower::isFollowing($_SESSION['id'], $follower->get('following_id'))): ?><!-- checks to see whether you are already following someone -->
    <a href="<?=BASE_URL?>/removeFollow/<?= $follower->get('following_id') ?>"> <!-- clicking on this button means the user no longer follows this person -->
      <button>Stop Following </button>
    </a>
    <?php else: ?><!-- if you are not following someone, mainly if you are looking at someone else's page -->
       <a href="<?=BASE_URL?>/follow/<?= $follower->get('following_id') ?>"><!-- Displays a button that will enable you to follow someone -->
      <button>Follow </button>
    </a>
    <?php endif; ?>
    <?php endif; ?>
</h5>

<?php endforeach; ?>

<?php else: ?> <!-- you are not following anyone, so it only displays a message -->
  <h5> You are not following anyone </h5>
<?php endif; ?>

<h2><?= User::loadById($followingID)->get('username') ?>'s Followers:</h2> <!-- Display the username of the user who's follower page this is -->
<?php if ($following != null):  ?> <!-- if you are following anyone -->
<?php foreach($following as $user) : ?> <!-- loop through each of the users you are following -->
  <h5>
  <a href = "<?= BASE_URL ?>/profile/<?= $user->get('follower_id') ?>"> <!-- provide a link to the user's profile page -->
    <?= User::loadById($user->get('follower_id'))->get('username') ?> <!-- show the user that you are following -->
  </a>
  <?php if (isset($_SESSION['user'])): ?>
  <?php if(Follower::isFollowing($_SESSION['id'], $user->get('follower_id'))): ?> <!-- if you are following this person you can stop following them -->
    <a href="<?=BASE_URL?>/removeFollow/<?= $user->get('follower_id') ?>"> <!-- a button that will allow the user to stop following this person  -->
      <button>Stop Following </button>
    </a>
    <?php else: ?> <!-- if you are not currently following this person -->
    <?php if($_SESSION['id'] != $user->get('follower_id')): ?>
       <a href="<?=BASE_URL?>/follow/<?= $user->get('follower_id') ?>"> <!-- this button will allow the user to start following someone -->
      <button>Follow </button>
    </a>
    <?php endif; ?>
    <?php endif; ?>
    <?php endif; ?>
  </h5>

<?php endforeach; ?>
<?php else: ?>
  <h5> No one is following you</h5>
<?php endif; ?>
</div>
<div id="buttons">
<form id="changeColorForm" method="POST" action="<?= BASE_URL ?>/users/changeColor/"> <!-- Change the color of the user that is displayed in the chord diagram -->
  <label>Edit Color: <input type="text" id="changeColor" name="color" value=""></label>
  <input type="hidden" id="changeColorId" name="id" value="">
  <input type="submit" name="submit" value="Edit">
  <button type="button" name="cancel">Cancel</button>
</form>

<!--<form id="followPerson" method="POST" action="">
  <-->
</div>

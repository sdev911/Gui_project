<link href="<?= BASE_URL ?>/public/css/myFollowers.css" rel="stylesheet" type="text/css" />
<div id="content">

<!-- Display the username of the user who's follower page this is -->
<h2><?= User::loadById($followingID)->get('username') ?> is Following:</h2>
<?php if ($followers != null):  ?> <!-- if you are following anyone -->

<?php foreach($followers as $follower) : ?>  <!-- loop through each of the people the user is following -->
  <h5>
  <!-- if you click on the follower's username it will take you to their profile -->
    <a href = "<?= BASE_URL ?>/profile/<?= $follower->get('following_id') ?>"> 
      <?= User::loadById($follower->get('following_id'))->get('username') ?><!-- Displays username of follower -->
    </a>
    <?php if (isset($_SESSION['user'])): ?>
    <!-- checks to see whether you are already following someone -->
     <?php if(Follower::isFollowing($_SESSION['id'], $follower->get('following_id'))): ?>
     <!-- clicking on this button means the user no longer follows this person -->
    <a href="<?=BASE_URL?>/removeFollow/<?= $follower->get('following_id') ?>"> 
      <button>Stop Following </button>
    </a>
    <?php else: ?><!-- if you are not following someone, mainly if you are looking at someone else's page -->
    <!-- Displays a button that will enable you to follow someone -->
       <a href="<?=BASE_URL?>/follow/<?= $follower->get('following_id') ?>">
      <button>Follow </button>
    </a>
    <?php endif; ?>
    <?php endif; ?>
</h5>

<?php endforeach; ?>

<?php else: ?> <!-- you are not following anyone, so it only displays a message -->
  <h5> You are not following anyone </h5>
<?php endif; ?>
<!-- Display the username of the user who's follower page this is -->
<h2><?= User::loadById($followingID)->get('username') ?>'s Followers:</h2> 
<?php if ($following != null):  ?> <!-- if you are following anyone -->
<?php foreach($following as $user) : ?> <!-- loop through each of the users you are following -->
  <h5>
  <a href = "<?= BASE_URL ?>/profile/<?= $user->get('follower_id') ?>"> <!-- provide a link to the user's profile page -->
    <?= User::loadById($user->get('follower_id'))->get('username') ?> <!-- show the user that you are following -->
  </a>
  <?php if (isset($_SESSION['user'])): ?>
  <!-- if you are following this person you can stop following them -->
  <?php if(Follower::isFollowing($_SESSION['id'], $user->get('follower_id'))): ?> 
  <!-- a button that will allow the user to stop following this person  -->
    <a href="<?=BASE_URL?>/removeFollow/<?= $user->get('follower_id') ?>"> 
      <button>Stop Following </button>
    </a>
    <?php else: ?> <!-- if you are not currently following this person -->
    <?php if($_SESSION['id'] != $user->get('follower_id')): ?>
     <!-- this button will allow the user to start following someone -->
       <a href="<?=BASE_URL?>/follow/<?= $user->get('follower_id') ?>">
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
<!-- Change the color of the user that is displayed in the chord diagram -->
<form id="changeColorForm" method="POST" action="<?= BASE_URL ?>/users/changeColor/"> 
  <label>Edit Color: <input type="text" id="changeColor" name="color" value=""></label>
  <input type="hidden" id="changeColorId" name="id" value="">
  <input type="submit" name="submit" value="Edit">
  <button type="button" name="cancel">Cancel</button>
</form>

<div id="followPerson">
  <a id="followLink" href="">
<button id="followButton">Follow</button>
</a>
<a id="unfollowLink" href="">
<button id="unfollowButton">Unfollow</button>
</a>
</div>

</div>

<link href="<?= BASE_URL ?>/public/css/myFollowers.css" rel="stylesheet" type="text/css" />
<div id="content">

<h2><?= User::loadById($followingID)->get('username') ?> is Following:</h2>
<?php if ($followers != null):  ?>

<?php foreach($followers as $follower) : ?>
  <h5>
    <a href = "<?= BASE_URL ?>/profile/<?= $follower->get('following_id') ?>">
      <?= User::loadById($follower->get('following_id'))->get('username') ?>
    </a>
    <?php if (isset($_SESSION['user'])): ?>
     <?php if(Follower::isFollowing($_SESSION['id'], $follower->get('following_id'))): ?>
    <a href="<?=BASE_URL?>/removeFollow/<?= $follower->get('following_id') ?>">
      <button>Stop Following </button>
    </a>
    <?php else: ?>
       <a href="<?=BASE_URL?>/follow/<?= $follower->get('following_id') ?>">
      <button>Follow </button>
    </a>
    <?php endif; ?>
    <?php endif; ?>
</h5>

<?php endforeach; ?>

<?php else: ?>
  <h5> You are not following anyone </h5>
<?php endif; ?>

<h2><?= User::loadById($followingID)->get('username') ?>'s Followers:</h2>
<?php if ($following != null):  ?>
<?php foreach($following as $user) : ?>
  <h5>
  <a href = "<?= BASE_URL ?>/profile/<?= $user->get('follower_id') ?>">
    <?= User::loadById($user->get('follower_id'))->get('username') ?>
  </a>
  <?php if (isset($_SESSION['user'])): ?>
  <?php if(Follower::isFollowing($_SESSION['id'], $user->get('follower_id'))): ?>
    <a href="<?=BASE_URL?>/removeFollow/<?= $user->get('follower_id') ?>">
      <button>Stop Following </button>
    </a>
    <?php else: ?>
    <?php if($_SESSION['id'] != $user->get('follower_id')): ?>
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

<form id="changeColorForm" method="POST" action="<?= BASE_URL ?>/users/changeColor/">
  <label>Edit Color: <input type="text" id="changeColor" name="color" value=""></label>
  <input type="hidden" id="changeColorId" name="id" value="">
  <input type="submit" name="submit" value="Edit">
  <button type="button" name="cancel">Cancel</button>
</form>

<div id="content">

<h2>Users I'm Following:</h2>
<?php if ($followers != null):  ?>

<?php foreach($followers as $follower) : ?>
  <h5>
    <a href = "<?= BASE_URL ?>/profile/<?= $follower->get('following_id') ?>">
      <?= User::loadById($follower->get('following_id'))->get('username') ?>
    </a>
</h5>
<?php endforeach; ?>

<?php else: ?>
  <h5> You are not following anyone </h5>
<?php endif; ?>

<h2>My Followers:</h2>
<?php if ($following != null):  ?>
<?php foreach($following as $follower) : ?>
  <h5>
  <a href = "<?= BASE_URL ?>/profile/<?= $following->get('follower_id') ?>">
    <?= User::loadById($following->get('follower_id'))->get('username') ?>
  </a>
  </h5>

<?php endforeach; ?>
<?php else: ?>
  <h5> No one is following you</h5>
<?php endif; ?>
</div>

<div id="content">

<?php foreach($users as $user) : ?>
    <div>
    <label><?= $user->get('username') ?></label>
    <label>Current permission: </label>
    <?php if(($user->get('user_type'))==0): ?>
      <label>Non-seller </label>
      <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/1"><button >Make Seller</button></a>
      <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/2"><button >Make Admin</button></a>
    <?php elseif(($user->get('user_type'))==1): ?>
      <label>Seller </label>
          <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/0"><button >Make non-seller</button></a>
          <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/2"><button >Make Admin</button></a>
    <?php else: ?>
      <label>Admin </label>
          <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/0"><button >Make non-seller</button></a>
          <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/1"><button >Make Seller</button></a>
    <?php endif; ?>

    </div>
  <?php endforeach; ?>

</div>

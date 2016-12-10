<div id="content">

<h3>Total Users: <?= $userCount ?></h3>
<h3>Total Products: <?= $productCount ?></h3>
<h3>Total Comments: <?= $commentCount ?></h3>

<?php foreach($users as $user) : ?><!-- Loops through every user -->
    <div>
    <label><?= $user->get('username') ?></label> <!-- Prints the username of each user  -->
    <label>Current permission: </label>
    <?php if(($user->get('user_type'))==0): ?> <!-- Has an account but is not a seller or an admin -->
      <label>Non-seller </label>
      <!-- Changes the role of the user to a seller -->
      <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/1"><button >Make Seller</button></a> 
      <!-- Changes the role of the user to an admin  -->
      <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/2"><button >Make Admin</button></a>
    <?php elseif(($user->get('user_type'))==1): ?> <!-- If the user is currently a seller -->
      <label>Seller </label>
      <!-- Changes the role of the user to a non-seller  -->
          <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/0"><button >Make non-seller</button></a>
          <!-- Changes the role of the user to an admin  -->
          <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/2"><button >Make Admin</button></a>
    <?php else: ?> <!-- If user is not a seller or a non-seller they must be an admin -->
      <label>Admin </label>
      <!-- Change the role of the user to a non-seller  -->
          <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/0"><button >Make non-seller</button></a> 
          <!-- Change the role of the user to a seller -->
          <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/1"><button >Make Seller</button></a> 
    <?php endif; ?>

    </div>
  <?php endforeach; ?>

</div>

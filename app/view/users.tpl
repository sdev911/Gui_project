<div id="content">
<style>
h2, h3 {
text-align: center;
}
</style>

<h2> User Information & Set User Roles </h2>
<h3>Total Users: <?= $userCount ?></h3>
<h3>Total Products: <?= $productCount ?></h3>
<h3>Total Comments: <?= $commentCount ?></h3>
<br>

<div class="col-xs-8 col-xs-offset-2">
    <table class="table table table-hover table-bordered">
  <thead>
    <tr>
      <th>Username</th>
      <th>Current Permission</th>
      <th>Change Permission</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach($users as $user) : ?><!-- Loops through every user -->
    <tr>
      <td><?= $user->get('username') ?></label> <!-- Prints the username of each user  --></th>
      <?php if(($user->get('user_type'))==0): ?> <!-- Has an account but is not a seller or an admin -->
      <td>Non-seller</td>
      <!-- Buttons change the role of the user to a seller, non-seller, or admin  -->
      <td><a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/1"><button class = "btn btn-primary">Make Seller</button></a> 
      <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/2"><button class = "btn btn-primary">Make Admin</button></a></td>
      <?php elseif(($user->get('user_type'))==1): ?> <!-- If the user is currently a seller -->
      <td>Seller</td>
      <td><a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/0"><button class = "btn btn-primary">Make non-seller</button></a>
      <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/2"><button class = "btn btn-primary">Make Admin</button></a></td>
      <?php else: ?> <!-- If user is not a seller or a non-seller they must be an admin -->
      <td>Admin</td>
      <td><a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/0"><button class = "btn btn-primary">Make non-seller</button></a>
      <a href="<?=BASE_URL?>/changePermission/<?= $user->get('id') ?>/1"><button class = "btn btn-primary">Make Seller</button></a></td>
      </td>
      <?php endif; ?>
    </tr>
    <?php endforeach; ?>
  </tbody>
</table>
</div>


</div>

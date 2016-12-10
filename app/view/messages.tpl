<div id="content">
  <div id="messages">
    <?php if($messages != null): ?>
      <?php echo 'in if'; ?>
    <?php foreach($messages as $message) : ?>
      <?php echo 'in each'; ?>
      <div>
      <h3>Message from: <a href="<?=BASE_URL?>/profile/<?= $message->get('sender_id') ?>"><?= $message->get('sender_user') ?></a></h3>
      <label><?= $message->get('message') ?></label>
      </div>
    <?php endforeach; ?>
    <?php else: ?>
      <?php echo 'in else'; ?>
      <h3>No messages!</h3>
    <?php endif; ?>
  </div>
</div>

<!-- <div id="content">
  <div id="messages">
    <?php if (isset($_SESSION['user'])): ?>
    <?php foreach($messages as $message) : ?>
      <div>
      <h3>Message from: <a href="<?=BASE_URL?>/profile/<?= $comment->get('sender_id') ?>"><?= $message->get('sender_user') ?></a></h3>
      <label><?= $message->get('message') ?></label>
      </div>
    <?php endforeach; ?>
    <?php endif; ?>
  </div>
</div> -->

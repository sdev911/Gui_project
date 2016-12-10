<div id="content">
  <div id="messages">
    <?php foreach($messages as $message) : ?>
      <div>
      <h3>Message from: <a href="<?=BASE_URL?>/profile/<?= $message->get('sender_id') ?>"><?= $message->get('sender_user') ?></a></h3>
      <label><?= $message->get('message') ?></label>
      </div>
    <?php endforeach; ?>
  </div>
</div>

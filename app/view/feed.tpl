<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/ItemDetailView.css">

  <div id="content">
    <div id="boxes">

    <h3 id="activityfeed-header">Activity Feed</h3>

    <div id="feed">
      <ul>
        <?php foreach($actions as $action) : ?>

          <h3>
            <a href="<?= BASE_URL ?>/profile/<?= $action->get('creator_id') ?>/">
              <?= $action->get("creator_username") ?></a>
            <?= $action->get("description") ?>
            <a href="<?= BASE_URL ?>/<?= $action->get('url_mod') ?>/<?= $action->get('target_id') ?>/">
              <?= $action->get("target_name") ?></a>
          </h3>

        <?php endforeach; ?>
      </ul>
    </div>
  </div>
</div>

<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/ItemDetailView.css">

  <div id="content" style="padding-bottom:0px;">
    <!--<div id="boxes">-->

<ul class="list-group" id="activityfeed">
    <li class="list-group-item" style="text-align:center;"><h4 id="activityfeed-header">Activity Feed</h4></li>

    <div id="feed">
      
        <?php foreach($actions as $action) : ?>

  <li class="list-group-item"><h5>
            <a href="<?= BASE_URL ?>/profile/<?= $action->get('creator_id') ?>/">
              <?= $action->get("creator_username") ?></a>
            <?= $action->get("description") ?>
            <a href="<?= BASE_URL ?>/<?= $action->get('url_mod') ?>/<?= $action->get('target_id') ?>/">
              <?= $action->get("target_name") ?></a>
          </h5>
</li>

          

        <?php endforeach; ?>
      </ul>
    </div>
  <!--</div>-->
</div>

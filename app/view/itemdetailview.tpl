<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/ItemDetailView.css">
<div id="content">

<div id="boxes">

    <div>
      <ul id=breadcrumbs>
        <li><a href="<?= BASE_URL ?>">Home</a> > </li>
        <li><a href="<?= BASE_URL ?>/outfits">Outfits</a> > </li>
        <li><?= $product->get("title") ?></li>
      </ul>
      <h2><?= $product->get("title") ?></h2>
    </div>


    <div >
      <img src="<?= BASE_URL ?>/public/img/<?= $product->get('image_url') ?>" id="item-image" alt="Shop This Style">
        <br>
        <h3 class="info-heading">Price</h3>
        <h4 style="display:block; margin: 0; font-weight:normal;"><?= $product->get("price") ?></h4>
        <h3 class="info-heading">Color</h3>
        <br >
        <select>
          <option value="blue">Blue</option>
          <option value="purple">Purple</option>
        </select>
        <br >
        <h3 class="info-heading">Size</h3>
        <h5 id="sizing"><a href="sizing.html">Sizing Chart </a></h5>
        <br >
        <select>
          <option value="s">Small</option>
          <option value="m">Medium</option>
          <option value="l">Large</option>
          <option value="xl">Extra-Large</option>
        </select>
        <br >
        <h3 class="info-heading">Quantity</h3>
        <br >
        <form>
          <input type="text" name="quantity" id="quantity"><br>
        </form>
        <br >
        <h3 class="info-heading" id="ratings-header">Ratings</h3>
        <div class="rating">
          <span>☆</span>
          <span>☆</span>
          <span>☆</span>
          <span>☆</span>
          <span>☆</span>
        </div>
        <h3 class="info-heading">Description</h3>
        <br >
        <div id=description>
          <p><?= $product->get("description") ?></p>
        </div>
        <a href="<?= BASE_URL ?>/outfits/addtocart/<?= $product->get('id') ?>/"><button id="add-to-cart">Add to Cart</button></a>

    


        <?php
          if(isset($_SESSION['user'])): ?>
          <a href="<?=BASE_URL?>/outfits/edit/<?= $product->get('id') ?>"><button id="edit">Edit Item</button></a>
          <a href="<?=BASE_URL?>/outfits/remove/<?= $product->get('id') ?>/process" onClick="return confirm('Delete This Product?')"><button id="delete">Delete Item
          </button></a>

          <form id="comment" action="<?= BASE_URL ?>/outfits/comment/<?= $product->get('id') ?>/" method="POST">
          <label>Comment: <input type="text" name="commentText"></label>
          <input type="submit" name="createComment" value="Submit Comment">
          </form>
          <?php endif; ?>
          
          <?php foreach($comments as $comment) : ?>
        <div>
        <h3>Comment from: <?= $comment->get('creator_username') ?>           
            <a href="<?= BASE_URL ?>/follow/<?= $comment->get('creator_id') ?>/">
                <button id="follow">Follow <?= $comment->get('creator_username') ?></button>
            </a>
        </h3>

        <label><?= $comment->get('comment') ?></label>
        </div>
      <?php endforeach; ?>
      </div>
  </div>
</div>

<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/ItemDetailView.css">
<div id="content">
<!-- All of the photos are from Luna the Fashion Kitty https://www.facebook.com/the.fashion.kitty/?fref=ts -->
<div id="boxes">
    <!-- This shows the hierarchy at the item which is "Home -> Outfits -> Item" -->
    <div>
      <ul id=breadcrumbs>
        <li><a href="/">Home</a> > </li>
        <li><a href="<?= BASE_URL ?>/outfits">Outfits</a> > </li>
        <li><?= $product->get("title") ?></li>
      </ul>
      <h2><?= $product->get("title") ?></h2>
    </div>

    <!-- Show information about the product including:
         image, price, quantity selection, rating-->
    <div >
      <img src="<?= BASE_URL ?>/public/img/<?= $product->get('image_url') ?>" id="item-image" alt="Shop This Style">
        <br>
        <h3 class="info-heading">Price</h3>
        <h4 style="display:block; margin: 0; font-weight:normal;"><?= $product->get("price") ?></h4>
        <?php
          if(isset($_SESSION['user'])): ?>
        <h3 class="info-heading">Quantity</h3>
        <br >
        <form>
          <input type="text" name="quantity" id="quantity"><br>
        </form>
        <?php endif; ?>
        <br >
        <h3 class="info-heading" id="ratings-header">Ratings</h3>
        <?php
          if(isset($_SESSION['user'])): ?>

        <!-- Ratings information. Allows the user to select a rating. -->
        <div class="rating" id="item-rating">

          <?php if($rating == 5): ?>
            <a href="<?=BASE_URL?>/rating/<?= $product->get('id') ?>/5"><span style="font-size:100%;color:yellow;">&starf;</span></a>
          <?php else: ?>
            <a href="<?=BASE_URL?>/rating/<?= $product->get('id') ?>/5"><span style="font-size:100%;">&star;</span></a>
          <?php endif; ?>

          <?php if($rating >= 4): ?>
            <a href="<?=BASE_URL?>/rating/<?= $product->get('id') ?>/4"><span style="font-size:100%;color:yellow;">&starf;</span></a>
          <?php else: ?>
            <a href="<?=BASE_URL?>/rating/<?= $product->get('id') ?>/4"><span style="font-size:100%;">&star;</span></a>
          <?php endif; ?>

          <?php if($rating >= 3): ?>
            <a href="<?=BASE_URL?>/rating/<?= $product->get('id') ?>/3"><span style="font-size:100%;color:yellow;">&starf;</span></a>
          <?php else: ?>
            <a href="<?=BASE_URL?>/rating/<?= $product->get('id') ?>/3"><span style="font-size:100%;">&star;</span></a>
          <?php endif; ?>

          <?php if($rating >= 2): ?>
            <a href="<?=BASE_URL?>/rating/<?= $product->get('id') ?>/2"><span style="font-size:100%;color:yellow;">&starf;</span></a>
          <?php else: ?>
            <a href="<?=BASE_URL?>/rating/<?= $product->get('id') ?>/2"><span style="font-size:100%;">&star;</span></a>
          <?php endif; ?>

          <?php if($rating >= 1): ?>
            <a href="<?=BASE_URL?>/rating/<?= $product->get('id') ?>/1"><span style="font-size:100%;color:yellow;">&starf;</span></a>
          <?php else: ?>
            <a href="<?=BASE_URL?>/rating/<?= $product->get('id') ?>/1"><span style="font-size:100%;">&star;</span></a>
          <?php endif; ?>

        </div>
        <?php endif; ?>
        <br>
        <!-- Shows average rating -->
        <label> Average Rating:  <div id="text-rating"><?=  Rating::ratingByProductId($product->get('id')) ?></div></label>
        <br>
        <h3 class="info-heading">Description</h3>
        <br >
        <div id=description>
          <p><?= $product->get("description") ?></p>
        </div>
        <!-- Allows a user to add an item to their cart.
             if admin, they can edit or delete the product.-->
        <?php
        if(isset($_SESSION['user'])): ?>
        <a href="<?= BASE_URL ?>/outfits/addtocart/<?= $product->get('id') ?>/"><button id="add-to-cart">Add to Cart</button></a>
        <?php endif; ?>

        <?php
          if(isset($_SESSION['user'])): ?>
          <?php if((($_SESSION['permissions'])==1) And (($_SESSION['id'])==($product->get('creator_id'))) OR (($_SESSION['permissions'])==2)): ?>
          <a href="<?=BASE_URL?>/outfits/edit/<?= $product->get('id') ?>"><button id="edit">Edit Item</button></a>
          <a href="<?=BASE_URL?>/outfits/remove/<?= $product->get('id') ?>/process" onClick="return confirm('Delete This Product?')"><button id="delete">Delete Item
          </button></a>
          <?php endif; ?>

          <!-- Allows a user to post a comment.-->
          <form id="comment" action="<?= BASE_URL ?>/outfits/comment/<?= $product->get('id') ?>/" method="POST">
          <label>Comment: <input type="text" name="commentText"></label>
          <input type="submit" name="createComment" value="Submit Comment">
          </form>
          <?php endif; ?>
          
          <!-- List all the comments with the username attached. -->
          <?php foreach($comments as $comment) : ?>
        <div>
        <h3>Comment from: <a href="<?=BASE_URL?>/profile/<?= $comment->get('creator_id') ?>"><?= $comment->get('creator_username') ?></a>

    <?php if (isset($_SESSION['user'])): ?>
            <?php if($_SESSION['id'] != $comment->get('creator_id')): ?>
                <?php if(!Follower::isFollowing($_SESSION['id'], $comment->get('creator_id'))): ?> <!-- makes it so that you cannot follow yourself -->
                <a href="<?= BASE_URL ?>/follow/<?= $comment->get('creator_id') ?>/">

                  <button id="follow">Follow <?= $comment->get('creator_username') ?></button>

                </a>
              <?php else: ?>
                <a href="<?= BASE_URL ?>/removeFollow/<?= $comment->get('creator_id') ?>/">

                  <button id="follow">Unfollow <?= $comment->get('creator_username') ?></button>

                </a>
                  <?php endif; ?>
                  <?php endif; ?>
                  <?php endif; ?>
        </h3>

        <label><?= $comment->get('comment') ?></label>
        </div>
      <?php endforeach; ?>
      </div>
  </div>
</div>

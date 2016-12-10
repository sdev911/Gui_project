<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/AddItem.css">

  <div id="content">

    <img id="banner" src="<?=BASE_URL?>/public/img/homepage_cat.jpg" alt="Outfits">

  </div>
  
  <!-- Signup Modal -->
  <?php if(!isset($_SESSION['user'])): ?>
<div class="modal fade" id="signupBlurb" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Sign In</h4>
      </div>
      <div class="modal-body">
        You must make an account or login to shop.
      </div>
      <div class="modal-footer">
        <a type="button" class="btn btn-warning" href="<?=BASE_URL ?>/signup" role="button">Make an Account</a>
        <a type="button" class="btn btn-success" href="<?=BASE_URL ?>/login" role="button">Login</a>
        <a type="button" class="btn btn-default" data-dismiss="modal">Close</a>
      </div>
    </div>
  </div>
</div>
<?php endif; ?>

    <div id=items>
    <div class=outfits>
      <ul>
      <!-- All of the photos are from Luna the Fashion Kitty https://www.facebook.com/the.fashion.kitty/?fref=ts -->
        <?php foreach($products as $product) : ?> <!-- Loops through each of the products from the database populating the page -->
        <li>
          <div style="display: inline-block; width: 250px; height=271px;">
          <a href="<?=BASE_URL?>/itemdetailview/<?= $product->get('id') ?>"><img src="<?=BASE_URL?>/public/img/<?= $product->get('image_url') ?>" alt="Shop This Style" class="productImage"></a> <!-- Clicking on the picture of a product will take you to it's detailed view -->
          <div style="text-align: center">
          <h5><?= $product->get("title") ?></h5>
          <h5>$<?= $product->get("price") ?></h5>
          <?php
          if(isset($_SESSION['user'])): ?> <!-- if the user is logged in they will be able to add an item to their cart -->
          <a href="<?= BASE_URL ?>/outfits/addtocart/<?= $product->get('id') ?>/"><button id="addtocart">Add to Cart</button></a>
          <?php endif; ?>
          <?php
          if(isset($_SESSION['user'])): ?> <!-- if the user is logged in and has certain permissions (seller or admin) set they will be able to add and delete items -->
          <?php if((($_SESSION['permissions'])==1) And (($_SESSION['id'])==($product->get('creator_id'))) OR (($_SESSION['permissions'])==2)): ?>
          <a href="<?=BASE_URL?>/outfits/edit/<?= $product->get('id') ?>"><button id="edit">Edit Item</button></a><!-- Will take the user to the page where they can edit a product -->
          <a href="<?=BASE_URL?>/outfits/remove/<?= $product->get('id') ?>/process" onClick="return confirm('Delete This Product?')"><button id="delete">Delete Item</button></a> <!-- After clicking the delete button an alert will appear making sure the user wants to continue -->
          <?php endif; ?>
          <?php endif; ?>
        </div></div>
        </li>
      <?php endforeach; ?>
      </ul>
    </div>
  </div>
    <?php
    if(isset($_SESSION['user'])): ?>
    <?php if(($_SESSION['permissions']) != 0): ?> <!-- if the user is a seller or an admin they can add items -->
    <div id="add-product" style="margin: 20px 0 20px 0;">
  <div id="left">
    <h4><label>Item Title:</label></h4><br>
    <input type="text" name="title" id = "f1"><br> <!-- Input a title for the item that is being added -->
    <h4><label class="image">Item Image:</label></h4><br>
    <input type="file" name="image_url" id="imageToUpload"><br> <!-- Add an image to represent the item being added -->
    <h4><label class="description">Item Description:</label></h4><br>
    <textarea name="description" cols="65" rows="10" id = "f2"></textarea> <!-- Input a description of the item being added -->
  <br>
    <h4><label>Price:</label></h4><br>
    <input type="text" name="price" id = "f3"> <!-- Input a price for the item being added -->
  <br>
  <br>
  <input id="save" type="submit" name="submit" value="Add Item" > <!-- Submit the information for adding an item -->
</div>
</div>    <?php endif; ?><?php endif; ?>


</div>

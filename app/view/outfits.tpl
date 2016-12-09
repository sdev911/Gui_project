<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/AddItem.css">

  <div id="content">
<!-- -->


    <img id="banner" src="<?=BASE_URL?>/public/img/homepage_cat.jpg" alt="Outfits">

<!--<div class=outfits>
      <ul>
        <?php foreach($recent as $recentitem) : ?>
        <li>
          <div style="display: inline-block; width: 250px; height=271px;">
	<?=$recentitem ?>
          <a href="<?=BASE_URL?>/itemdetailview/<?= $recentitem->get('id') ?>"><img src="<?=BASE_URL?>/public/img/<?= $recentitem->get('image_url') ?>" alt="Shop This Style" class="productImage"></a>
          <div style="text-align: center">
          <h5><?= $recentitem->get("title") ?></h5>
          <h5>$<?= $recentitem->get("price") ?></h5>
        </div></div>
        </li>
      <?php endforeach; ?>
      </ul>
    </div>-->



    <div id="filterbar">


  	<h3 id="filterbar-header">Filters</h3>

    <div class="filter">
    	<h4>Color</h4>
    	<label><input type="checkbox" name="color" value="pink" /> Pink</label>
    	<label><input type="checkbox" name="color" value="blue" /> Blue</label>
    	<label><input type="checkbox" name="color" value="yellow" /> Yellow</label>
    	<label><input type="checkbox" name="color" value="green" /> Green</label>
      <h4 style="padding-left: 10px;">Size</h4>
    	<label><input type="checkbox" name="size" value="s" checked="checked" /> Small</label>
    	<label><input type="checkbox" name="size" value="m" /> Medium</label>
    	<label><input type="checkbox" name="size" value="l" /> Large</label>
    	<label><input type="checkbox" name="size" value="xl" /> X-Large</label>
    </div>

    <br style="clear: both;">

  	<button id=update-filters>Update filters</button>

  </div>

    <div id=items>
    <div class=outfits>
      <ul>
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
  <h4>Size Options</h4>
  <div id="color-options">
  <ul>
    <li class="product-and-info">
  <div id="info">
      <!--<input type="text" class="item-color"/>-->
    <ul id="options-list">
      <li id="first-option">
          <label>Size Options: </label>
          <input type="text" name="size" class="size-options" id = "f4" /> <!-- Input a size for the item being added -->
          <br>
          <!--<input type="text" name="quantity" class="quantity-options" />-->
      </li>
    </ul>

  </div>
  </li>
  </ul>
  </div>
  <br>
  <input id="save" type="submit" name="submit" value="Save Changes" > <!-- Submit the information for adding an item -->
</div>
</div>    <?php endif; ?><?php endif; ?>

<!--<div id="base-url" data-base="<?=BASE_URL?>">
    <img id="catscroll" src="<?= BASE_URL ?>/public/img/<?= $product->get('image_url') ?>" alt="Cat">
  </div>

  <button id="catPic">Cats Up For Adoption</button>-->


</div>

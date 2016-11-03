if(isset($_SESSION['user'])): ?>

  <div id="right">
  <h2>Add New Item</h2>
  <div style="display: inline-block;">
  </div>
</div>
<form style="margin: 20px 0 20px 0;" id="edit-product" action="<?= BASE_URL ?>/outfits/additem/process/" method="POST">
  <div id="left">
    <h4><label>Item Title:</label></h4><br>
    <input type="text" name="title"><br>
    <h4><label class="image">Item Image:</label></h4><br>
    <input type="file" name="image_url" id="imageToUpload"><br>
    <h4><label class="description">Item Description:</label></h4><br>
    <textarea name="description" cols="65" rows="10"></textarea>
  <br>
    <h4><label>Price:</label></h4><br>
    <input type="text" name="price">
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
          <input type="text" name="size" class="size-options" />
          <br>
          <!--<input type="text" name="quantity" class="quantity-options" />-->
      </li>
    </ul>

  </div>
  </li>
  </ul>
  </div>

  <!--<button id="add-color-option">Add Option</button>
  <button id="remove-color-option">Remove Option</button>-->
  <br>
  <input id="save" type="submit" name="submit" value="Save Changes" action="<?=BASE_URL?>/outfits/additem/process">
</div>
</form>
</div>
<?php endif; ?>

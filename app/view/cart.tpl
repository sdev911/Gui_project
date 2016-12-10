<!-- Style for the submit order button -->
<style>
button#submit-order{
  display: inline;
  padding: 10px;
  margin: 2px;
  border: none;
  background-color: #008CBA;
  color: white;
}
</style>

<!-- Order Submitted Modal -->
<div class="modal fade" id="submitBlurb" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">About Us</h4>
      </div>
      <div class="modal-body">
        Your order has been submitted. Thank you for your patronage.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<h2 style="text-align:center">Shopping Cart</h2>

<!-- Contains everything between Shopping Cart and the footer.
     Includes call to the item name, image, and remove from cart.
     Also includes Submit Order. -->
<div class=outfits>
      <ul>
        <!-- If the cart is empty, text says so, and submit order button doesn't
             work -->
        <?php if(empty($products)) : ?>
          <p>Your cart is empty</p>
          <script>
          $(document).ready(function()    {
            $("button#submit-order").attr('disabled', true);
          });
          </script>
        <?php else : ?>
        <!-- If the cart is not empty, it displays each item in the user's cart.
             This includes: title, price, image, and remove from cart button -->
        <?php foreach($products as $product) : ?>
        <li style="display: block">
          <div style="display: inline-block; width: 250px; height=271px;">
          <img src="<?=BASE_URL?>/public/img/<?= $product->get('image_url') ?>" alt="Shop This Style">
          <div style="text-align: center">
          <h5><?= $product->get("title") ?></h5>
          <h5>$<?= $product->get("price") ?></h5>
          <a href="<?=BASE_URL?>/outfits/removefromcart/<?= $product->get('id') ?>"><button id="addtocart">Remove from cart</button></a>
        </div>
        </div>
        </li>
      <?php endforeach; ?>
      <!-- Enables the submit order button-->
      <script>
      $(document).ready(function()    {
        $("button#submit-order").attr('enabled', true);
      });
      </script>

  <?php endif ?>
      </ul>
      <button id="submit-order" data-target="#aboutModal" style="margin: 0 auto; display: block;">Submit Order</button>
    </div>

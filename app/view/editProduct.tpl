<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/editproduct.css">
<div id="content">

<h2 style="margin:10px">Edit Product</h2>

<form id="edit-product" action="<?= BASE_URL ?>/outfits/edit/<?= $product->get('id') ?>/process" method="POST">

<label>Title: <input type="text" name="title" value="<?= $product->get('title') ?>"></label>

<label>Description: <textarea name="description"><?= $product->get('description') ?></textarea></label>

<label>Sizes: <input type="text" name="sizes" value="<?= $product->get('sizes') ?>"></label>

<label>Price ($): <input type="text" name="price" value="<?= $product->get('price') ?>"></label>

<label>Image URL: <input type="text" name="image_url" value="<?= $product->get('image_url') ?>"></label>

<input id="save" type="submit" name="submit" value="Save Changes" action="<?=BASE_URL?>/outfits/edit/<?= $product->get('id') ?>/process">

</form>

</div>

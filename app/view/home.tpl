<div id="content">

  <!-- Main banner image -->
  <div class="container-fluid">
    <div class="row">
      <div class="col-xs-12">
        <img src="<?= BASE_URL ?>public/img/mainimg.png" alt="main image" class="img-fluid" style="max-width: 100%; height: auto;">
      </div>
    </div>
  </div>

  <!-- Calls catFact from catFact.js which returns a random catfact string -->
  <div class = "row">
  <div class="alert alert-info col-xs-8" role="alert" style="margin-top: 20px;">
    <b>Cat Fact: </b><p id="catBlurb"> </p> 
  </div>
<div class = "col-xs-4">
  <button type="button" class="btn btn-primary" id="catFactButton">
  Click for Cat Fact
  </button>
</div>
</div>

  <!-- These are the original images. They are changed in scripts.js on
       hover by user. -->
  <div id=shopthislook class = "col-xs-12">
    <ul>
      <li><img src="<?=BASE_URL?>/public/img/cat8.jpg" id="mainImage1" alt="Shop This Style"></li>
      <li><img src="<?=BASE_URL?>/public/img/cat4.jpg" id="mainImage2" alt="Shop This Style"></li>
      <li><img src="<?=BASE_URL?>/public/img/cat5.jpg" id="mainImage3" alt="Shop This Style"></li>
      <li><img src="<?=BASE_URL?>/public/img/cat6.jpg" id="mainImage4" alt="Shop This Style"></li>
    </ul>
  </div>
</div>

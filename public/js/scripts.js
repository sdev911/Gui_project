$(document).ready(function()    {

$("#about").click(function(){
	$('#aboutModal').modal('show'); 
});

$("#contact").click(function(){
	$('#contactModal').modal('show'); 
});
  /**
  USER INTERATION 1: Creates shaking animation when user tries to remove the only
  color option in the div and gives error message that fades away.
  **/
  $("button#remove-color-option").click(function(){
    if($( "div#color-options > ul.other-option").length == 0){
      $("button#remove-color-option").animate({marginLeft: '5%'}, 'fast', function(){
        $("div#color-options").append("<h4 id='error' style='color:red; font-weight:bold'>There must be at least one color option for item.</h4>");
        $("button#remove-color-option").attr('disabled', true);
      $("button#remove-color-option").animate({marginLeft: '0'}, 'fast', function(){
        $("button#remove-color-option").animate({marginLeft: '5%'}, 'fast', function(){
          $("button#remove-color-option").animate({marginLeft: '0'}, 'fast');
          $("#error").delay(1500).fadeOut('slow', function(){
            $("#error").remove();
            $("button#remove-color-option").attr('disabled', false);
          });

        });
      });
      });
    }
    $( "div#color-options > ul.other-option").last().remove();
  });

  /**
  USER INTERACTION 2: When user hovers over pictures on the home page, the
  source of the image will change and a heading will be added with the name
  of the item in it.
  **/
   $( "#mainImage1" ).mouseover(function() {
    document.getElementById("mainImage1").src=baseURL+"/public/img/cat8_2.png";
    $("#shopthislook ul").prepend("<div class='container'><div class='row'><div class='col-xs-10 col-xs-offset-1'><h2>Elegant in Pink</h2></div></div></div>");
  });
  $( "#mainImage1" ).mouseout(function() {
    document.getElementById("mainImage1").src=baseURL+"/public/img/cat8.jpg";
    $("#shopthislook ul .container").remove();
  });
  $( "#mainImage2" ).mouseover(function() {
    document.getElementById("mainImage2").src=baseURL+"/public/img/cat4_2.jpg";
    $("#shopthislook ul").prepend("<div class='container'><div class='row'><div class='col-xs-10 col-xs-offset-1'><h2>Flower Power</h2></div></div></div>");
  });
  $( "#mainImage2" ).mouseout(function() {
    document.getElementById("mainImage2").src=baseURL+"/public/img/cat4.jpg";
    $("#shopthislook ul .container").remove();
  });
  $( "#mainImage3" ).mouseover(function() {
    document.getElementById("mainImage3").src=baseURL+"/public/img/cat5_2.jpg";
    $("#shopthislook ul").prepend("<div class='container'><div class='row'><div class='col-xs-10 col-xs-offset-1'><h2>Tulle We Meet Again</h2></div></div></div>");
  });
  $( "#mainImage3" ).mouseout(function() {
    document.getElementById("mainImage3").src=baseURL+"/public/img/cat5.jpg";
    $("#shopthislook ul .container").remove();
  });
  $( "#mainImage4" ).mouseover(function() {
    document.getElementById("mainImage4").src=baseURL+"/public/img/cat6_2.jpg";
    $("#shopthislook ul").prepend("<div class='container'><div class='row'><div class='col-xs-10 col-xs-offset-1'><h2>Patriotic Pussy</h2></div></div></div>");
  });
  $( "#mainImage4" ).mouseout(function() {
    document.getElementById("mainImage4").src=baseURL+"/public/img/cat6.jpg";
    $("#shopthislook ul .container").remove();
  });

  $.ajax({
  url: $("#base-url").attr("data-base")+"/nextCatFact",
  type: 'GET',
  success: function (resp) {
        console.log(resp);
	document.getElementById("catBlurb").innerHTML = resp;
}
});


$("#catFactButton").click(function(){
  $.ajax({
  url: $("#base-url").attr("data-base")+"/nextCatFact",
  type: 'GET',
  success: function (resp) {
        console.log(resp);
	document.getElementById("catBlurb").innerHTML = resp;
}
});

});

});

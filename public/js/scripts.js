$(document).ready(function()    {

$("#about").click(function(){
	$('#aboutModal').modal('show'); 
});

$("#contact").click(function(){
	$('#contactModal').modal('show'); 
});
	
$("#aboutFooter").click(function(){
	$('#aboutModal').modal('show'); 
});

$("#contactFooter").click(function(){
	$('#contactModal').modal('show'); 
});
	
$("#submit-order").click(function(){
	$('#submitBlurb').modal('show'); 
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
	document.getElementById("catBlurb").innerHTML = resp;
}
});
	
	if (window.location.pathname == '/outfits'){
		$('#signupBlurb').modal('show'); 
	}



$("#catFactButton").click(function(){
  $.ajax({
  url: $("#base-url").attr("data-base")+"/nextCatFact",
  type: 'GET',
  success: function (resp) {
	document.getElementById("catBlurb").innerHTML = resp;
}
});

});

});

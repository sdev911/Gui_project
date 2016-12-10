$(document).ready(function(){

$('#myModal').modal('show'); 

  $('#catPic').click(function(){
  $.ajax({
        url: $("#base-url").attr("data-base")+"/viewcat/process/",
        type: "GET", //request type
        dataType: 'json',
        success:function(result){
         //alert(result);
         //get this flipping image to change the source only, delete child stuff for div then put image in
         if ( $( "#catscroll" ).length > 0) {
           document.getElementById("catscroll").remove();
         }
         $('#base-url').append('<img id="catscroll" src="'+$("#base-url").attr("data-base")+"/public/img/"+result.catimageurl+'" alt="Cat"> ');

       }
     });
    });

$("#save").click(function(){
    var formData = {title: $("#f1").val(),
    image_url: $("#imageToUpload").val(),
    description: $("#f2").val(),
    price: $("#f3").val()}
    $.ajax({
      type: "POST",
      url: baseURL + "/outfits/additem/process/",
      data: formData,
      success: function(e){
      }
       });
       alert("You have added the item to the database, refresh the page to see the item appear on this page");
});

});

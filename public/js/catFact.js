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

$('#edit-product').submit(function(e){
      //e.preventDefault();
      var formData = JSON.stringify(jQuery('#edit-product').serializeArray());
    $.ajax({
          url: $("#base-url").attr("data-base")+"/outfits/additem/process",
          type: "POST", //request type
          contentType: 'application/json',
          data: formData,//$("#edit-product").serialize();

          success:function(result){
           //get this flipping image to change the source only, delete child stuff for div then put image in
           console.log(result);
         }
       });
      });

});

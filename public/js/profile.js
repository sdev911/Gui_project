$( document ).ready(function() {
    $('#profileForm').hide();
    $('#profileInfo').show();
    
    $('#editProfile').click(function(){
      $('#profileInfo').hide();
      $('#profileForm').show();
    });

    /**var path = window.location.pathname;
    if(path == ("profile/"+/[0-9]+/)){
	console.log('true');
    }
    else{
      console.log('false');
    }**/
	

});

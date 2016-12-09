$( document ).ready(function() {
    $('#profileForm').hide();
    $('#profileInfo').show();
    $('#activityfeed').show();
    
    $('#editProfile').click(function(){
      $('#profileInfo').hide();
      $('#profileForm').show();
      $('#activityfeed').hide();
    });

    /**var path = window.location.pathname;
    if(path == ("profile/"+/[0-9]+/)){
	console.log('true');
    }
    else{
      console.log('false');
    }**/
	

});

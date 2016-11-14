$( document ).ready(function() {
    $(.profileForm).hide();
    $(.profileInfo).show();
    
    $(.editProfile).click(function(){
      $(.profileInfo).hide();
      $(.profileForm).show();
    });
});

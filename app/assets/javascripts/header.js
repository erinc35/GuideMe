$(document).ready(function(){
 loginFormPress();

});

function loginFormPress()  {
   $(".login-link").on("click", function(event){
    event.preventDefault();
    $(".login-form").toggle();

  })

}



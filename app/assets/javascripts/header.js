$(document).ready(function(){
 loginFormPressed();

});

function loginFormPressed()  {
   $(".login-link").on("click", function(event){
    event.preventDefault();
    $(".login-form").toggle();
  })

}

$(document).ready(function() {
  checkoutLogin();
  checkoutSignup();
})

function checkoutLogin(){
  $("#checkout-login-but").on("click", function(e){
    event.preventDefault();
    $(".checkout-signup-atts").css("display", "none");
     $(".checkout-login-form").css("display", "block");
  })
}


function checkoutSignup(){
  $("#checkout-signup-but").on("click", function(e){
    event.preventDefault();
     $(".checkout-login-form").css("display", "none");
    $(".checkout-signup-atts").css("display", "block");
  })
}

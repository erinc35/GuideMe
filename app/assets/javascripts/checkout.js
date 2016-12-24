$(document).ready(function() {
  checkoutLogin();
})

function checkoutLogin(){
  $("#checkout-login-but").on("click", function(e){
    event.preventDefault();
    $(".checkout-signup-atts").css("display", "none");
     $(".checkout-login-form").css("display", "block");
  })
}

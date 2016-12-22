$(document).ready(function(){
  loginFormPress();
  mouseLeaveSignup();
  mouseLeaveLogin();
});

function loginFormPress()  {
  $(".login-link").on("click", function(event){
   event.preventDefault();
   $(".login-form").slideDown();
   mouseLeaveBlack();
   mouseEnterWhite();

 })

}


function mouseLeaveBlack(){
 $(".login-link").on("mouseleave", function(){


   $(".login-link").css("background-color", "#333333 ")
   // alert("fffff")
   $(".login-link").css("color", "beige");
 })
}

function mouseEnterWhite(){
 $(".login-link").on("mouseenter", function(){


   $(".login-link").css("background-color", "white")
   // alert("fffff")
   $(".login-link").css("color", "#333333 ")

 })
}

function mouseLeaveLogin(){
  $(".login-form").on("mouseleave", function(){
    $(".login-form").slideUp();
  })
}

function mouseLeaveSignup(){
  $(".signup-drop").on("mouseleave", function(){
    $(".signup-drop").slideUp();
  })
}

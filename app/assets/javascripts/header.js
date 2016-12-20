$(document).ready(function(){
  loginFormPress();
   // mouseLeaveBlack();

});

function loginFormPress()  {
  $(".login-link").on("click", function(event){
   event.preventDefault();
   $(".login-form").toggle();
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



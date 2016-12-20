$(document).ready(function(){
signUpHover();

});

function signUpHover()  {
  $(".signup-link").on("click", function () {
    $('.signup-drop').toggle()
  })
  mouseLeaveBlack2();
  mouseEnterWhite2();
}

function mouseLeaveBlack2(){
 $(".signup-link").on("mouseleave", function(){
   $(".signup-link").css("background-color", "#333333 ")
   $(".signup-link").css("color", "beige");

 })
}



function mouseEnterWhite2(){
 $(".signup-link").on("mouseenter", function(){
   $(".signup-link").css("background-color", "white")
   $(".signup-link").css("color", "#333333 ")

 })
}
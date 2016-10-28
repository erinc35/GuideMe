$(document).ready(function(){
 signUpHover();

});

function signUpHover()  {
   $(".signup-link").on("click", function () {
     $('.signup-drop').toggle()
   }
  )

}

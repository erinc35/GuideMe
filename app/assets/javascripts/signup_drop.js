$(document).ready(function(){
 signUpHover();

});

function signUpHover()  {
   $(".signup-link").mouseover(function () {
     $('.signup-drop').toggle()
   }
     )

}

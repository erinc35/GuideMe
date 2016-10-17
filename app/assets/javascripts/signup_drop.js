$(document).ready(function(){
 signUpHover();

});

function signUpHover()  {
   $(".signup-link").hover(function () {
     $('.signup-drop').slideDown('medium');
  },
  function () {
     $('.signup-drop').slideUp('medium');
  })

}

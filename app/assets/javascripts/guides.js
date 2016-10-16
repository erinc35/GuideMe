$(document).ready(function() {
  chatSubmitListener();
});


var chatSubmitListener = function () {
  $("#create-conversation").on("click", function(event){
    event.preventDefault();
    var buttonTarget = $(this);
    var formTarget = buttonTarget.parent();
    console.log(formTarget);
  });
};

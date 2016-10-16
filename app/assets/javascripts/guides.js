$(document).ready(function() {
  chatSubmitListener();
});


var chatSubmitListener = function () {
  $("#create-conversation").on("click", function(event){
    event.preventDefault();
    var buttonTarget = $(this);
    var formTarget = buttonTarget.parent();
    var formMethod = formTarget.attr("method");
    var formURL = formTarget.attr("action");
    var formData = formTarget.serialize();

    var request = $.ajax({
        url: formURL,
        type: formMethod,
        data: formData
    });

    request.done(function(response){
      console.log(response);
    });
  });
};

$(document).ready(function() {
  addGuide();
  removeGuide();
})

function addGuide() {
  $(".float-left").on('click', '#add_guide', function(event) {
    event.preventDefault();
    var that = this;
    var addAction = $(this).attr('href');
    var addMethod = $(this).attr('data-method');
    var data = $(this).parent().serialize();
    console.log(data);
    console.log(addAction);
    console.log(addMethod);
    // $('.saved_event').css("background-color", "#98FB98")
    $.ajax({
      url: addAction,
      method: addMethod,
      data: data
    })
    .done(function(result) {
      console.log($(that).parent());
      $(that).parent().remove();
      $('.saved_guide').remove();
      $('.float-left').children('.guides').prepend(result);
      // $('.events').prepend('.saved_event')
    });
  });
}

function removeGuide() {
  $(".float-left").on('click', '#remove_guide', function(event) {
    event.preventDefault();
    var that = this;
    var removeAction = $(this).attr('href');
    var removeMethod = $(this).attr('data-method');
    var data = $(this).parent().serialize();
    // $('.saved_event').css("background-color", "#98FB98")
    $.ajax({
      url: removeAction,
      method: removeMethod,
      data: data
    })
    .done(function(result) {
      console.log($(that).parent());
      $(that).parent().remove();
      $('.saved_guide').remove();
      $('.float-left').children('.guides').prepend(result);
      // $('.events').prepend('.saved_event')
    });
  });
}

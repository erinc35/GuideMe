$(document).ready(function() {
  addEvent();
  removeEvent();
})

function addEvent() {
  $(".events").on('click', '#add_event', function(event) {
    event.preventDefault;
    var that = this;
    var saveAction = $(this).attr('href');
    var saveMethod = $(this).attr('data-method');
    var data = $(this).parent().serialize();
    console.log(data);

    $.ajax({
      url: saveAction,
      method: saveMethod,
      data: data
    })
    .done(function(result) {
      $(that).parent().remove();
      $('.events').prepend(result);
      // $('.events').prepend('.saved_event')
    })
  });
}

function removeEvent() {
  $(".events").on('click', '#remove_event', function(event) {
    event.preventDefault;
    var that = this;
    var removeAction = $(this).attr('href');
    var removeMethod = $(this).attr('data-method');
    var data = $(this).parent().serialize();
    console.log(data);

    $.ajax({
      url: removeAction,
      method: removeMethod,
      data: data
    })
    .done(function(result) {
      $(that).parent().remove();
      $('.events').append(result);
      // $('.events').prepend('.saved_event')
    })
  });
}
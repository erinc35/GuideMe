$(document).ready(function() {
  addEvent();
  removeEvent();
  addRestaurant();
  removeRestaurant();
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

function addRestaurant() {
  $(".restaurants").on('click', '#add_restaurant', function(event) {
    event.preventDefault;
    var that = this;
    var addAction = $(this).attr('href');
    var addMethod = $(this).attr('data-method');
    var data = $(this).parent().serialize();
    console.log(data);

    $.ajax({
      url: addAction,
      method: addMethod,
      data: data
    })
    .done(function(result) {
      $(that).parent().remove();
      $('.restaurants').prepend(result);
      // $('.events').prepend('.saved_event')
    })
  });
}

function removeRestaurant() {
  $(".restaurants").on('click', '#remove_restaurant', function(event) {
    event.preventDefault;
    var that = this;
    var removeAction = $(this).attr('href');
    var removeMethod = $(this).attr('data-method');
    var data = $(this).parent().serialize();
    console.log(data);
    console.log("fidsjfadfjsaf");

    $.ajax({
      url: removeAction,
      method: removeMethod,
      data: data
    })
    .done(function(result) {
      $(that).parent().remove();
      $('.restaurants').append(result);
      // $('.events').prepend('.saved_event')
    })
  });
}
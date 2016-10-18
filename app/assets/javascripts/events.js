$(document).ready(function() {
  addEvent();
  removeEvent();
  addRestaurant();
  removeRestaurant();
  tabContent();
})

function addEvent() {
  $(".container").on('click', '#add_event', function(event) {
    event.preventDefault();
    var that = this;
    var saveAction = $(this).attr('href');
    var saveMethod = $(this).attr('data-method');
    var data = $(this).parent().serialize();
    console.log(data);
    // $('.saved_event').css("background-color", "#98FB98")
    $.ajax({
      url: saveAction,
      method: saveMethod,
      data: data
    })
    .done(function(result) {
      $(that).parent().remove();
      $('.container').children('.events').prepend(result);
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
  $(".container").on('click', '#add_restaurant', function(event) {
    event.preventDefault;
    console.log("bbbbb")
    
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

function tabContent() {
  $('ul.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');

    $('ul.tabs li').removeClass('current');
    $('.tab-content').removeClass('current');

    $(this).addClass('current');
    $("#"+tab_id).addClass('current');
  })
}
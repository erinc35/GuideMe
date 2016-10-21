$(document).ready(function() {
  addEvent();
  removeEvent();
  addRestaurant();
  removeRestaurant();
  tabContent();
  addAttraction();
  removeAttraction();
})

function addEvent() {
  $(".float-left").on('click', '#add_event', function(event) {
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
      $('.float-left').children('.events').prepend(result);
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
  $(".float-left").on('click', '#add_restaurant', function(event) {
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
  $(".float-left").on('click', '#remove_restaurant', function(event) {
    event.preventDefault;
    var that = this;
    var removeAction = $(this).attr('href');
    var removeMethod = $(this).attr('data-method');
    var data = $(this).parent().serialize();

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

function addAttraction() {
  $(".float-left").on('click', '#add_attraction', function(event) {
    event.preventDefault;
    
    var that = this;
    var addAction = $(this).attr('href');
    var addMethod = $(this).attr('data-method');
    var data = $(this).parent().serialize();

    $.ajax({
      url: addAction,
      method: addMethod,
      data: data
    })
    .done(function(result) {
      $(that).parent().remove();
      $('.attractions').prepend(result);
      // $('.events').prepend('.saved_event')
    })
  });
}

function removeAttraction() {
  $(".float-left").on('click', '#remove_attraction', function(event) {
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
      $('.attractions').append(result);
      // $('.events').prepend('.saved_event')
    })
  });
}
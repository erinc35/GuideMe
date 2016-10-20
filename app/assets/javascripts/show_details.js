$(document).ready(function(){
  showDetailsAttractions();
  hideDetailsAttractions();
  showDetailsRestaurants();
  hideDetailsRestaurants();
  showDetailsEvents();
  hideDetailsEvents();

});

function showDetailsAttractions(){
  $("#tab-2").on('click', '.click-detail', function(e){
    e.preventDefault();
    // console.log($(this));
    $(this).siblings('.saved-event').slideDown();
    console.log("zzzz")
      $(this).hide();
        $(this).siblings(".hide-detail").show();
  })
}

function hideDetailsAttractions(){
  $("#tab-2").on('click', '.hide-detail', function(e){
    e.preventDefault();
    $(this).siblings('.saved-event').slideUp();
     $(this).hide();
      $(this).siblings(".click-detail").show();
  })
}

function showDetailsRestaurants(){
  $("#tab-3").on('click', '.click-detail', function(e){
    e.preventDefault();
    // console.log($(this));
    $(this).siblings('.saved-event').slideDown();
    console.log("zzzz")
      $(this).hide();
        $(this).siblings(".hide-detail").show();
  })
}

function hideDetailsRestaurants(){
  $("#tab-3").on('click', '.hide-detail', function(e){
    e.preventDefault();
    $(this).siblings('.saved-event').slideUp();
     $(this).hide();
      $(this).siblings(".click-detail").show();
  })
}
function showDetailsEvents(){
  $("#tab-4").on('click', '.click-detail', function(e){
    e.preventDefault();
    // console.log($(this));
    $(this).siblings('.saved-event').slideDown();
    console.log("zzzz")
      $(this).hide();
        $(this).siblings(".hide-detail").show();
  })
}

function hideDetailsEvents(){
  $("#tab-4").on('click', '.hide-detail', function(e){
    e.preventDefault();
    $(this).siblings('.saved-event').slideUp();
     $(this).hide();
      $(this).siblings(".click-detail").show();
  })
}

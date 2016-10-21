$(document).ready(function(){
  showTripDetails();
  hideTripDetails();


});

function showTripDetails(){
  $("#parent-div").on('click', '.show-detail', function(e){
    e.preventDefault();
    console.log($(this));
    $(this).siblings('.trip-details').slideDown();
    console.log("zzzz")
      $(this).hide();
        $(this).siblings(".hide-tripdetail").show();
  })
}

function hideTripDetails(){
  $("#parent-div").on('click', '.hide-tripdetail', function(e){
    e.preventDefault();
    $(this).siblings('.trip-details').slideUp();
     $(this).hide();
      $(this).siblings(".show-detail").show();
  })
}

$(document).ready(function(){
  showDetails();
  hideDetails();
});

function showDetails(){
  $("#tab-2").on('click', '.click-detail', function(e){
    e.preventDefault();
    // console.log($(this));
    $(this).siblings('.saved-event').slideDown();
    console.log("zzzz")
      $(this).hide();
        $(this).siblings(".hide-detail").show();
  })
}

function hideDetails(){
  $("#tab-2").on('click', '.hide-detail', function(e){
    e.preventDefault();
    $(this).siblings('.saved-event').slideUp();
     $(this).hide();
      $(this).siblings(".click-detail").show();
  })
}

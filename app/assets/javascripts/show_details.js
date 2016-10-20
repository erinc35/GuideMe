$(document).ready(function(){
  showDetails();
  hideDetails();
});

function showDetails(){
  // $('.tabs).on('click', '.click-detail', function(e){
  $(".click-detail").on("click", function(e){
    console.log("ffff")
    e.preventDefault();
    // console.log($(this));
    $(this).siblings('.saved-event').slideDown();
    console.log("zzzz")
      $(this).hide();
        $(this).siblings(".hide-detail").show();
  })
}

function hideDetails(){
  $(".hide-detail").click(function(e){
    e.preventDefault();
    $(this).siblings('.saved-event').slideUp();
     $(this).hide();
      $(this).siblings(".click-detail").show();
  })
}

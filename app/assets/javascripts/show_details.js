$(document).ready(function(){
  showDetails();
  hideDetails();
});

function showDetails(){
  $(".click-detail").click(function(){
    $(".saved-event").slideDown();
      $(".click-detail").hide();
        $(".hide-detail").show();
  })
}

function hideDetails(){
  $(".hide-detail").click(function(){
    $(".saved-event").slideUp();
    console.log("ffff")
     $(".hide-detail").hide();
      $(".click-detail").show();
  })
}

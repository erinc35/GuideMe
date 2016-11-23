$(document).ready(function() {
  initMap();
});

function initMap(){
  // console.log("RRR  ")
  // console.log("tttt")
  var autocomplete = new google.maps.places.Autocomplete($("#city")[0]);
  autocomplete.bindTo('bound', map);

  // console.log("dsssss")
  $('#city').keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });
};


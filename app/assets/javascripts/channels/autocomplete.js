function initMap(){
  // console.log("RRR  ")
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 8
    });
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

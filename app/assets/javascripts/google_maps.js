// $(document).ready(function(){
//   initMap();
// });


// function initMap() {
//   console.log("ddddd")
//         var map = new google.maps.Map(document.getElementById('map'), {
//           center: {lat: -34.397, lng: 150.644},
//           zoom: 12
//         });
//         var infoWindow = new google.maps.InfoWindow({map: map});

//         // Try HTML5 geolocation.
//         if (navigator.geolocation) {
//           navigator.geolocation.getCurrentPosition(function(position) {
//             var pos = {
//               lat: position.coords.latitude,
//               lng: position.coords.longitude
//             };

//             infoWindow.setPosition(pos);
//             infoWindow.setContent('Location found.');
//             map.setCenter(pos);


//             var events = <%= @events_longlat %>;
//             for (i=0; i < events.length; i++) {
//               var pos = {lat: events[i][1], lng: events[i][0]};
//               var marker = new google.maps.Marker({
//                 position: pos,
//                 map: map,
//                 title: "hi"
//               });
//               marker.addListener('click', function() {
//                 infowindow.open(map, marker);
//               });
//             };

//             var restaurants = <%= @restaurants_longlat %>;
//             for (i=0; i < restaurants.length; i++) {
//               var pos = {lat: restaurants[i][1], lng: restaurants[i][0]};
//               var marker = new google.maps.Marker({
//                 position: pos,
//                 map: map,
//                 title: "hi"
//               });
//               marker.addListener('click', function() {
//                 infowindow.open(map, marker);
//               });
//             };

//             var attractions = <%= @attractions_longlat %>;
//             for (i=0; i < attractions.length; i++) {
//               var pos = {lat: attractions[i][1], lng: attractions[i][0]};
//               var marker = new google.maps.Marker({
//                 position: pos,
//                 map: map,
//                 title: "hi"
//               });
//               marker.addListener('click', function() {
//                 infowindow.open(map, marker);
//               });
//             };
//           }, function() {
//             handleLocationError(true, infoWindow, map.getCenter());
//           });
//         } else {
//           // Browser doesn't support Geolocation
//           handleLocationError(false, infoWindow, map.getCenter());
//         }
//       }

//       function handleLocationError(browserHasGeolocation, infoWindow, pos) {
//         infoWindow.setPosition(pos);
//         infoWindow.setContent(browserHasGeolocation ?
//                               'Error: The Geolocation service failed.' :
//                               'Error: Your browser doesn\'t support geolocation.');
//       }



var map;
var marker;
var coordinates = [
  [47.063332, 28.867066],
  [47.063300, 28.867446],
  [47.063107, 28.867870],
  [47.062785, 28.867779],
  [47.062431, 28.867608],
  [47.062204, 28.867501],
  [47.061963, 28.867410],
  [47.061707, 28.867302],
  [47.061665, 28.867632],
  [47.061884, 28.867873]
];
var currentIndex = 0;

function initMap() {
  map = L.map('map').setView(coordinates[0], 13); 

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
    maxZoom: 18,
  }).addTo(map);

  var markerIcon = L.icon({
    iconUrl: 'https://www.nicepng.com/png/full/295-2955914_red-marker-circle-png.png',
    iconSize: [25, 40],
    iconAnchor: [20, 40]
  });

  marker = L.marker(coordinates[0], { icon: markerIcon }).addTo(map);

  setInterval(function() {
    updateMarkerPosition();
  }, 3000);
}

function setPosition(lat, lng) {
  map.panTo(new L.LatLng(lat, lng));
  marker.setLatLng([lat, lng]);
}

function openBatteryStatusPage() {
  window.location.href = "batterystatus.html";
}

function updateMarkerPosition() {
  var lat, lng;
  if (currentIndex < coordinates.length) {
    lat = coordinates[currentIndex][0];
    lng = coordinates[currentIndex][1];
    currentIndex++;
  } else {
    lat = getRandomCoordinate(46, 48);
    lng = getRandomCoordinate(27, 29);
  }
  setPosition(lat, lng);
}

function getRandomCoordinate(min, max) {
  return Math.random() * (max - min) + min;
}

/* Coordinates from RTK
var map;
var marker;

function initMap() {
  map = L.map('map').setView([0, 0], 13); 

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
    maxZoom: 18
  }).addTo(map);

  marker = L.marker([0, 0]).addTo(map); 

  fetchRtkData(); // Fetch RTK data and update marker position
  setInterval(fetchRtkData, 5000); 
}

function fetchRtkData() {
  //Request to the RTK API to fetch the data
  fetch('RTK_API_URL')
    .then(response => response.json())
    .then(data => {
      // Extract longitude and latitude coordinates from the fetched data
      var longitude = data.longitude;
      var latitude = data.latitude;

      updateMarkerPosition(latitude, longitude);
    })
    .catch(error => {
      console.log('Error fetching RTK data:', error);
    });
}

function updateMarkerPosition(latitude, longitude) {
  marker.setLatLng([latitude, longitude]); 
  map.panTo([latitude, longitude]); 
}
*/



/* All coordinates are taken randomly
var map;
var marker;

function initMap() {
    map = L.map('map').setView([47.063332, 28.867066], 13); 

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
        maxZoom: 18,
    }).addTo(map);

    // Create a red marker with a larger size
    var markerIcon = L.icon({
        //iconUrl: '/img/redmarker.png', 
        iconUrl: 'https://www.nicepng.com/png/full/295-2955914_red-marker-circle-png.png',
        iconSize: [40, 40], 
        iconAnchor: [20, 40] 
    });

    marker = L.marker([47.063332, 28.867066], { icon: markerIcon }).addTo(map); 

    //setInterval(updateMarkerPosition, 5000); 
    setInterval(function(){
    updateMarkerPosition(); 
}, 5000);
    
}

function setPosition(x, y){
    map.panTo(new L.LatLng(x, y));
    marker.setLatLng([x, y]);
}

function updateMarkerPosition() {
    var randomLat = getRandomCoordinate(46, 48);
    var randomLng = getRandomCoordinate(27, 29);
    setPosition(randomLat, randomLng)

    //marker.setLatLng([randomLat, randomLng]); 
}

function getRandomCoordinate(min, max) {
    return Math.random() * (max - min) + min;
} */

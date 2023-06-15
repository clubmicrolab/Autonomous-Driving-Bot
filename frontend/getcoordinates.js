function updateCoordinates(latitude, longitude) {
  var coordinatesElement = document.getElementById("coordinates");
  coordinatesElement.textContent = "Latitude: " + latitude.toFixed(6) + " | Longitude: " + longitude.toFixed(6);
}

function fetchCoordinates() {
  var latitude = getRandomCoordinate(46, 48);
  var longitude = getRandomCoordinate(27, 29);

  updateCoordinates(latitude, longitude);
}

function startCoordinateUpdate() {
  fetchCoordinates();
  setInterval(fetchCoordinates, 5000); 
}

startCoordinateUpdate();

function getRandomCoordinate(min, max) {
  return Math.random() * (max - min) + min;
}

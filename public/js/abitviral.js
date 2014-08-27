var log, main;

main = function() {
  var location_error, location_found, map;
  log("aBitViral started");
  L.Icon.Default.imagePath = "/imgs/vendor/leaflet";
  map = L.map("map").setView([51.505, -0.09], 13);
  L.tileLayer("http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "Map data &copy; <a href=\"http://openstreetmap.org\">OpenStreetMap</a>  contributors - used in aBitViral",
    maxZoom: 18
  }).addTo(map);
  map.locate({
    setView: true,
    maxZoom: 16,
    timeout: 100000
  });
  location_found = function(e) {
    var radius;
    radius = e.accuracy / 2;
    L.marker(e.latlng).addTo(map).bindPopup("You are within " + radius + " meters from this point").openPopup();
    L.circle(e.latlng, radius).addTo(map);
    log("your location: " + e.latlng);
  };
  location_error = function(e) {
    log(e.message);
  };
  map.on("locationfound", location_found);
  map.on("locationerror", location_error);
};

log = function(string) {
  var debug;
  debug = document.getElementById("debug");
  debug.innerHTML = debug.innerHTML + string + "<br>";
};

document.addEventListener("DOMContentLoaded", main, false);

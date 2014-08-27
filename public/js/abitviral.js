var log, main;

main = function() {
  var location_error, location_found, locations, map, markers, onMapClick, server;
  log("aBitViral started");
  L.Icon.Default.imagePath = "/imgs/vendor/leaflet";
  map = L.map("map").setView([51.505, -0.09], 16);
  server = "openstreetmap.org";
  server = "stamen.com/watercolor";
  L.tileLayer("http://{s}.tile." + server + "/{z}/{x}/{y}.jpg", {
    attribution: "Map data &copy; <a href=\"http://openstreetmap.org\">OpenStreetMap</a>  contributors",
    maxZoom: 16
  }).addTo(map);
  map.locate({
    setView: true,
    maxZoom: 16,
    timeout: 100000
  });
  markers = [];
  locations = [new L.LatLng(43.881200, 11.092421), new L.LatLng(43.825744, 11.130530), new L.LatLng(43.731795, 11.223742), new L.LatLng(43.770871, 11.270176), new L.LatLng(43.782320, 11.251208), new L.LatLng(43.140239, 12.105642), new L.LatLng(41.918044, 8.736798)];
  onMapClick = function(evt) {
    var idx;
    idx = evt.target.idx;
    return markers[idx].openPopup();
  };
  location_found = function(e) {
    var idx, loc, marker, radius, _i, _j, _len, _len1;
    radius = e.accuracy / 2;
    L.marker(e.latlng).addTo(map).bindPopup("You").openPopup();
    for (_i = 0, _len = locations.length; _i < _len; _i++) {
      loc = locations[_i];
      markers.push(L.marker(loc));
    }
    for (idx = _j = 0, _len1 = markers.length; _j < _len1; idx = ++_j) {
      marker = markers[idx];
      marker.addTo(map);
      marker.bindPopup("User " + idx);
      marker.idx = idx;
      marker.on('click', onMapClick);
    }
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

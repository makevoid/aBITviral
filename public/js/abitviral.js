var app, log, main;

app = {};

app.host = "http://localhost:3001/";

app.bc_host = "http://blockchain.info/api..";

app.current_user = null;

app.index = function() {
  app.current_user = this.login();
  return this.test();
};

app.test = function() {
  return http({
    url: "" + this.host + "test",
    method: "get",
    success: function(xhr) {
      var test;
      test = json(xhr.response).message;
      return console.log("test xhr: " + test);
    }
  });
};

app.people_nearby = function(lat, lng) {
  return true;
};

app.broadcast_location = function(lat, lng) {
  return true;
};

app.balance = function() {
  return http({
    url: "" + this.host + "balance",
    method: "get",
    success: function(data) {
      return console.log(data);
    }
  });
};

app.login = function() {
  var store;
  store = localStorage;
  if (store.abv_account) {
    return store.abv_account;
  } else {
    return store.abv_account = this.generate_password();
  }
};

app.generate_password = function() {
  return abv.crypto.random_password(10);
};

main = function() {
  var location_error, location_found, locations, map, markers, onMapClick, server;
  app.index();
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
  locations = [new L.LatLng(43.881200, 11.092421), new L.LatLng(43.825744, 11.130530), new L.LatLng(43.731795, 11.223742), new L.LatLng(43.770871, 11.270176), new L.LatLng(43.782320, 11.251208), new L.LatLng(43.140239, 12.105642), new L.LatLng(41.918044, 8.736798), new L.LatLng(43.774622, 11.250312), new L.LatLng(43.774900, 11.255655), new L.LatLng(43.768501, 11.251299), new L.LatLng(43.775970, 11.256728)];
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

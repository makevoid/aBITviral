main = ->
  log "aBitViral started"
  L.Icon.Default.imagePath = "/imgs/vendor/leaflet"
  map = L.map("map").setView([
    51.505
    -0.09
  ], 13)
  L.tileLayer("http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
    attribution: "Map data &copy; <a href=\"http://openstreetmap.org\">OpenStreetMap</a>  contributors - used in aBitViral"
    maxZoom: 18
  ).addTo map
  map.locate
    setView: true
    maxZoom: 16
    timeout: 100000

  location_found = (e) ->
    radius = e.accuracy / 2
    L.marker(e.latlng).addTo(map).bindPopup("You are within " + radius + " meters from this point").openPopup()
    L.circle(e.latlng, radius).addTo map
    log "your location: #{e.latlng}"
    return

  location_error = (e) ->
    log e.message
    return

  map.on "locationfound", location_found
  map.on "locationerror", location_error
  return


# var map_div = document.getElementById("map")
# map_div.style.height = 500
# map.invalidateSize()
log = (string) ->
  debug = document.getElementById("debug")
  debug.innerHTML = debug.innerHTML + string + "<br>"
  return

document.addEventListener "DOMContentLoaded", main, false
app = {}

app.host = "http://localhost:3001/"

app.bc_host = "http://blockchain.info/api.."
app.current_user = null

app.index = ->
  app.current_user = @login()

  @test()

app.test = ->
  http
    url: "#{@host}test",
    method: "get",
    success: (xhr) ->
      test = json(xhr.response).message
      console.log "test xhr: #{test}"

app.people_nearby = (lat, lng) ->
  # TODO
  true

app.broadcast_location = (lat, lng) ->
  # TODO
  true

app.balance = ->
  http
    url: "#{@host}balance",
    method: "get",
    success: (data) ->
      console.log data

app.login = ->
  store = localStorage
  if store.abv_account
    store.abv_account
  else
    store.abv_account = @generate_password()

app.generate_password = ->
  abv.crypto.random_password 10



main = ->
  app.index()

  #########


  log "aBitViral started"
  L.Icon.Default.imagePath = "/imgs/vendor/leaflet"
  map = L.map("map").setView([
    51.505
    -0.09
  ], 16)
  # map server
  server = "openstreetmap.org"     # format png
  server = "stamen.com/watercolor" # format jpg
  L.tileLayer("http://{s}.tile.#{server}/{z}/{x}/{y}.jpg",
    attribution: "Map data &copy; <a href=\"http://openstreetmap.org\">OpenStreetMap</a>  contributors"
    maxZoom: 16
  ).addTo map
  map.locate
    setView: true
    maxZoom: 16
    timeout: 100000

  #  almost-global variables
  markers = []

  locations = [
    # posti scelti completamente a caso - places selected "randomly"
    new L.LatLng(43.881200, 11.092421), # prato
    new L.LatLng(43.825744, 11.130530), # campi
    new L.LatLng(43.731795, 11.223742), # galluzzo
    new L.LatLng(43.770871, 11.270176), # piazza beccaria
    new L.LatLng(43.782320, 11.251208), # lago dei cigni
    new L.LatLng(43.140239, 12.105642), # lago trasimeno
    new L.LatLng(41.918044, 8.736798 ), # Ajaccio, corsica
    new L.LatLng(43.774622, 11.250312), # piazza stazione incrocio
    new L.LatLng(43.774900, 11.255655), # via gori
    new L.LatLng(43.768501, 11.251299), # arno river
    new L.LatLng(43.775970, 11.256728), # somewhere in the center
  ]


  onMapClick = (evt) ->
    idx = evt.target.idx
    markers[idx].openPopup()

  location_found = (e) ->
    radius = e.accuracy / 2
    L.marker(e.latlng).addTo(map).bindPopup("You").openPopup()


    for loc in locations
      markers.push L.marker(loc)

    for marker, idx in markers
      marker.addTo map
      marker.bindPopup "User #{idx}"
      marker.idx = idx
      marker.on 'click', onMapClick

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
getMap = function (lat, lng, zoom) {
  var center = new google.maps.LatLng(lat, lng);

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: zoom,
    center: center,
    minZoom: 7,
    streetViewControl: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
};

function goto_state(lid) {
  if (lid == "io")
    getMap(42.472097, 78.384361, 12);
  if (lid == "oo")
    getMap(40.528284, 72.801075, 12);
  if (lid == "bo")
    getMap(40.053570, 70.816069, 12);
  if (lid == "no")
    getMap(41.425352, 75.998054, 14);
  if (lid == "to")
    getMap(42.517062, 72.233520, 12);
  if (lid == "jo")
    getMap(40.934719, 72.999859, 13);
  if (lid == "co")
    getMap(42.874958, 74.586868, 9);
  if (lid == "bi")
    getMap(42.874958, 74.586868, 12);
}

window.onload = getMap(41.269550, 74.766098, 7);

var map;
var markers = [];

function display_map(lat, long, zoom)
{
  var mapOptions = {
    center: new google.maps.LatLng(lat, long),
    zoom: zoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var canvas = $('#map_canvas')[0];
  map = new google.maps.Map(canvas, mapOptions);
}

function add_marker(user_lat, user_long, user_name)
{
  var latlng = new google.maps.LatLng(user_lat, user_long, user_name);
  var marker = new google.maps.Marker({position: latlng, map: map, title: user_name});
  markers.push(marker);
}


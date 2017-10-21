var map;
var marker;
var infowindow;
var marker2;
var flag = 0;

function initialize(latitude,longitude) {
var myCenter= new google.maps.LatLng(latitude,longitude);
  var mapProp = {
    center: myCenter,
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  
 

  map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
  
  //var marker = new google.maps.Marker({position:myCenter});
  //marker.setMap(map);
 var ltlg = new google.maps.LatLng(latitude,longitude);
 marker2 =  new google.maps.Marker({
     position: ltlg,
     map: map,
   });

  google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
  });
}

function placeMarker(location) {
	
	/*if(flag == 0){
		setMapOnAll(null);
		flag = 1;
	}*/
	
	
  if (!marker || !marker.setPosition) {
	  marker2.setMap(null);
    marker = new google.maps.Marker({
      position: location,
      map: map,
    });
  } else {
    marker.setPosition(location);
  }
  if (!!infowindow && !!infowindow.close) {
    infowindow.close();
  }
  infowindow = new google.maps.InfoWindow({
    content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
  });
  
  document.getElementById('long').value = location.lng();
  document.getElementById('lat').value = location.lat();
  infowindow.open(map, marker);
}

google.maps.event.addDomListener(window, 'load', initialize);
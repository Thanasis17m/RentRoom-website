

function myMap(latitude,longitude) {
	var myCenter = new google.maps.LatLng(latitude,longitude);
	  var mapCanvas = document.getElementById("googleMap");
	  var mapOptions = {center: myCenter, zoom: 15};
	  var map = new google.maps.Map(mapCanvas, mapOptions);
	  var marker = new google.maps.Marker({position:myCenter});
	  marker.setMap(map);

}



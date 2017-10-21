function myMap(arr) {
	var myCenter = new google.maps.LatLng(arr[0][2],arr[0][1]);
	  var mapCanvas = document.getElementById("googleMap");
	  var mapOptions = {center: myCenter, zoom: 10};
	  var map = new google.maps.Map(mapCanvas, mapOptions);
	  var markers = [arr.length];
	  var contentStrings = [arr.length];
	  var infowindows = [arr.length];
	 
	  
	  for(j = 0; j < arr.length; j++ ){
		
		  
		  var lat_lang = new google.maps.LatLng(arr[j][2],arr[j][1]);
		  markers[j] = new google.maps.Marker({position:lat_lang});
		  markers[j].setMap(map);
		  contentStrings[j] = '<a href="getListingDetails?listing_name='+arr[j][0]+'">'+arr[j][0]+ '</a>';
		  
		  infowindows[j] = new google.maps.InfoWindow({
	          content: contentStrings[j]
	        });
		  
		  google.maps.event.addListener(markers[j], 'click', function(innerKey) {
		      return function() {
		          infowindows[innerKey].open(map, markers[innerKey]);
		         
		          for(i = 0; i<arr.length; i++){
		        	  if(i != innerKey){
		        		  infowindows[i].close();
		        	  }
		          }
		          
		      }
		    }(j));
	  }
}

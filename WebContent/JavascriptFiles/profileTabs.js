

function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";/*hide the contents of all tabs*/
    }
    tablinks = document.getElementsByClassName("tab_button");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");/*make all tabs with an active class,inactive*/
    }
    document.getElementById(tabName).style.display = "block";/*display the requested tab's content*/
    evt.currentTarget.className += " active";/*make that tab active*/
    
    if(tabName === 'Host'){
    	alert(1);
    	google.maps.event.addDomListener(window, 'load', function () { myMap(arr); });
    }
}


$(document).ready(function () { /*when page loads the first tab is opened by default*/
	
	document.getElementById("defaultOpen").click();

	

});
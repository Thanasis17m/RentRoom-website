
$(document).ready(function() {
  
  var dateToday = new Date();
  $("#departing").datepicker({
  	dateFormat: "yy-mm-dd",
  	minDate: dateToday, //we disable the selection of days that have passed
  	onSelect: function(date) {            
        	var date1 = $('#departing').datepicker('getDate');           
            var date = new Date( Date.parse( date1 ) ); 
            date.setDate( date.getDate() + 1 );        
            var newDate = date.toDateString(); 
            newDate = new Date( Date.parse( newDate ) );                      
            $('#returning').datepicker("option","minDate",newDate);            
    }
  });

  $("#returning").datepicker({
  	dateFormat: "yy-mm-dd",
  	minDate: dateToday
  });
});
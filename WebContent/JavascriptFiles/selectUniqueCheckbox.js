$(document).ready(function(){

$('input[name="availability"]').on('change', function() {
   $('input[name="availability"]').not(this).prop('checked', false);
});

});
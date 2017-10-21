  $( function() {
    $( "#slider_range" ).slider({
      range: true,	//Set the range option to true to capture a range of values with two drag handles.
      min: 9,
      max: 1000,
      values: [ 9, 1000 ],
      slide: function( event, ui ) {
        $( "#price_values" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
      }
    });
    $( "#price_values" ).val( "$" + $( "#slider_range" ).slider( "values", 0 ) +
      " - $" + $( "#slider_range" ).slider( "values", 1 ) );

    $( "#slider_range" ).css('background', '#ff6f00');	//change the color of the slider
    $( "#slider_range .ui-slider-range" ).css('background', '#ff5733');

  } );
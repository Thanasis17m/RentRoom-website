

function resize() {//this function changes the url of the banner photo when the screen resizes
  if ($(window).width() < 400){
      $(".home_banner img").attr('src', '..//Images/home_banner_extrasmall.png');
  } else if (($(window).width() < 600) && ($(window).width() > 400)) { 
      $(".home_banner img").attr('src', '..//Images/home_banner_small.png'); 
  } else {
      $(".home_banner img").attr('src', '..//Images/home_banner.png');
  }
}

$(document).ready(function () {
	$(window).resize(function() {
		resize();
	});
});

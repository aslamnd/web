$(function(){
  var content_height = $("#slideshow").outerHeight() + $("#content").outerHeight();
  var window_height = $(window).height();
  var total_height = 0;
  if(content_height > window_height){
    total_height = content_height;
  }else{
    total_height = window_height;
  }

  if($("#sidebar-inner").height() < total_height){
    $("#sidebar-inner").css('height',total_height);
  }
});

$.easing.bounce = function (x, t, b, c, d) {
	var s = 0.8
	if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
	return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
}

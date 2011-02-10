$.easing.bounce = function (x, t, b, c, d) {
	var s = 0.1;
	if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
	return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
}

$.easing.heavy_bounce = function (x, t, b, c, d) {
	var s = 0.8;
	if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
	return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
}

$(function(){
  $('input, textarea').placeholder();
});

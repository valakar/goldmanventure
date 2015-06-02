// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jssor
//= require jssor.slider
//= require Tocca
//= require modernizr
//= require_tree .


//jssor_slider1_starter = function (containerId) {
//	var options = { $AutoPlay: true };
//	var jssor_slider1 = new $JssorSlider$(containerId, options);
//};
function is_touch_device() {
	return 'ontouchstart' in window // works on most browsers
		|| 'onmsgesturechange' in window; // works on ie10
};
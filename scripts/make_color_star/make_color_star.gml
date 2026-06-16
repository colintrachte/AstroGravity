/// @description make_color_star(red,blue)
/// @param red
/// @param blue
function make_color_star(red, blue) {
	//by Ground Effect Games
	//produces a color that ranges somewhere between red and blue
	//red and blue arguments should be between 0 and 255.
	var low;
	low=min(red,blue);
	return make_color_rgb(red,low+random(max(red,blue)-low),blue);



}

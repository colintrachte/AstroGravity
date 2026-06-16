/// @description random_color_star()
function random_color_star() {
	//by Ground Effect Games
	//produces a color that ranges somewhere between red and blue
	var low,r,g,b;
	r=55+random(200);
	b=55+random(200);
	low=min(r,b)
	g=low+random(max(r,b)-low)
	return make_color_rgb(r,g,b);



}

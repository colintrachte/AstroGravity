/// @description space_set_nebula(number of layers)
/// @param number of layers
function space_set_nebula(number) {
	//used to generate the nebula background in the create event of o_star
	for (var i=0;i<number;i+=1)
	{
	    //x,y, and image angle of the dust
	    nebula_scale[i]=.8+random(2);
	    nebula_r[i]=random(360);
	    nebula_x[i]=__view_get( e__VW.WView, 0 )/2 - lengthdir_x(random_decrease(900*nebula_scale[i],.5),nebula_r[i]-30);
	    nebula_y[i]=__view_get( e__VW.HView, 0 )/2 - lengthdir_y(random_decrease(900*nebula_scale[i],.5),nebula_r[i]-30);
	    nebula_color[i]=make_color_hsv(random(255),255-random_squared(155),255-random_squared(155));
	}
	nebula_count=number;
	//nebula_name=random_name(choose(external.greek_names,external.viking_names));



}

/// @description space_set_background_stars(# of stars,average star radius,max distance)
/// @param # of stars
/// @param average star radius
/// @param max distance
function space_set_background_stars(average, max, arg2) {
	//used to generate background stars around the main stars
	for (var i=0;i<average;i+=1)
	{
	    star_len[i]=max+random(arg2);
	    star_dir[i]=random(360);
	    star_r[i]=random_normal(max);
	    star_color[i]=random_color_star();
	    star_alpha[i]=.2+random(.5);
	}
	star_count=average;



}

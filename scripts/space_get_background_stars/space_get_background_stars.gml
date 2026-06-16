/// @description space_get_background_stars(instance id)
/// @param instance id
function space_get_background_stars(instance) {
	//retrieves star background info from a star object
	//used to generate background stars around the main stars
	for (var i=0;i<instance.star_count;i+=1)
	{
	    star_len[i]=instance.star_len[i];
	    star_dir[i]=instance.star_dir[i];
	    star_r[i]=instance.star_r[i];
	    star_color[i]=instance.star_color[i];
	    star_alpha[i]=instance.star_alpha[i];
	}



}

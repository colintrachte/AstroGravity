/// @description space_matter_classify(radius)
/// @param radius
function space_matter_classify(radius) {
	//By Ground Effect Games
	//this decides what an object is depending on the global settings in load_globals()

	if (radius>=global.min_nebula_radius)
	{
	    return "nebula";
	}
	else
	{
	    if (radius>=global.min_star_radius)
	    {
	        return "star";
	    }
	    else
	    {
	        if (radius>=global.min_planet_radius)
	        {
	            return "planet";
	        }
	        else
	        {
	            if (radius>=global.min_moon_radius)
	            {
	                return "moon";
	            }
	            else
	            {
	                if (radius>=global.min_debris_radius)
	                {
	                    //asteroids are twice as likely as comets, because comets use more CPU
	                    return choose("asteroid","asteroid","comet");
	                }
	            }
	        }
	    }
	}



}

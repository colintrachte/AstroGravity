/// @description space_matter_subclassify(type,radius,density)
/// @param type
/// @param radius
/// @param density
function space_matter_subclassify(type, radius, density) {
	//future code for subclassifications of planets, stars, etc.

	switch type
	{
	    case "nebula":
	    {
        
	        return "regular";
	    }
    
	    case "star":
	    {
	        //subtypes:
	        //Binary stars and red giants are large with low density
	        //black holes are large with high density
	        //red dwarf stars are small with low density
	        //white dwarf stars are small with high density
	        //regular stars are left over after all the special cases are chosen.
        
	        //anomalies:
	        //white dwarves have a 25% chance of being pulsars with EM fields that disable shields
        
	        small=((radius-global.min_star_radius)<global.delta_star_radius*.1);
	        large=((radius-global.min_star_radius)>global.delta_star_radius*.9);
	        hard=density>100000;
	        soft=density<10;
        
	        if small
	        {
	            if hard
	            {
	                return "white dwarf";
	            }

	            if soft
	            {
	                return "red dwarf";
	            }
	        }
        
	        if large
	        {
	            if hard
	            {
	                return "black hole";
	            }

	            if soft
	            {
	                return choose("binary","red giant");
	            }
	        }
        
	        return "regular";
	    }
    
	    case "planet":
	    {
	        //planet types may change depending on their stats.
	        //types:
	        //volcanic, frozen (too close to sun or too far away)
	        //arid, oceanic (very little water or lots of it)
	        //terran (balance of water and heat)
	        //gas giant, brown dwarf (not dense enough)
	        //crystalline (very dense)
    
	        if (density<2000)//23% of all planets are mostly gas
	        {
	            if ((radius-global.min_planet_radius)>global.delta_planet_radius*.95)
	            {
	                return "brown dwarf";
	            }
            
	            if ((radius-global.min_planet_radius)>global.delta_planet_radius*.9)
	            {
	                return "gas giant";
	            }
	        }
	        else
	        {
	            if (density<5000)//46% of all planets are mostly rock
	            {
	                return "rocky";
	            }
	            else
	            {
	                //the rest have a significant amount of metal
	                return "metallic";
	            }
	        }
	    } break;
    
	    case "moon":
	    {
        
	        return "regular";
	    }
    
	    case "comet":
	    {
        
	        return "regular";
	    }
    
	    case "asteroid":
	    {
        
	        return "regular";
	    }
	}



}

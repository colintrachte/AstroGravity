/// @description math_astrogravity(other object,force multiplier,maximum distance)
/// @param other object
/// @param force multiplier
/// @param maximum distance
function math_astrogravity(other, force, maximum) {
	//by Ground Effect Games
	//The object using this script is attracted to the object type specified in other

	var dist,magnitude;

	//apply to all objects with the given name, or you can give a specific id!
	with other
	{
	    if (id!=other.id)//the object can't be attracted to its own coordinates
	    {
	        with other//the object that called the script
	        {
	            dist=point_distance(x,y,other.x,other.y);
	            //it is important to limit the distance at which gravity applies
	            if (dist<maximum)
	            {
	                magnitude=point_distance(0,0,other.sprite_width,other.sprite_height);
	                //if you execute this script every step, the pull of gravity is multiplied by fps
	                motion_add(point_direction(x,y,other.x,other.y),force*power(magnitude,3)/(1+sqr(dist+magnitude)));
	            }//F=m1a=G*m1*m2/sqr(dist), and we are solving for acceleration. m1 cancels.
	        }
	    }
	}



}

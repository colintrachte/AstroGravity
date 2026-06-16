/// @description math_disperse(other object,percent,max distance)
/// @param other object
/// @param percent
/// @param max distance
function math_disperse(other, percent, max) {
	//used to move groups of objects towards or away from each other in increments
	//percentage is the percent of the difference in distance you want to cover
	//by Ground Effect Games

	with other//apply to all objects with the given name, or you can give a specific id!
	{
	    if (id!=other.id)//the object can't affect itself
	    {
	        with other//the object that called the script
	        {
	            var dist=point_distance(x,y,other.x,other.y);
	            if (dist<max)
	            {
	                var length,dir;
	                length=percent*(max-dist);
	                dir=point_direction(other.x,other.y,x,y);
	                x+=lengthdir_x(length,dir);
	                y+=lengthdir_y(length,dir);
	            }
	        }
	    }
	}



}

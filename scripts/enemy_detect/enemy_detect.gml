/// @description enemy_detect(object,visibility distance,radar distance)
/// @param object
/// @param visibility distance
/// @param radar distance
function enemy_detect(argument0, argument1, argument2) {
	//with all objects of the given type, set visibility relative to distance
	var dist;

	//apply to all objects with the given name, or you can give a specific id!
	with argument0
	{
	    dist=point_distance(other.x,other.y,x,y);
	    if dist<argument1
	    {
	        visibility=sqrt(1-(dist/argument1));
	    }
	    if dist<argument2
	    {
	        reflectivity=sqrt(1-(dist/argument2));
	    }
	}



}

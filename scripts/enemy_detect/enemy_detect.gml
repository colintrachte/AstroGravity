/// @description enemy_detect(object,visibility distance,radar distance)
/// @param object
/// @param visibility distance
/// @param radar distance
function enemy_detect(object, visibility, radar) {
	//with all objects of the given type, set visibility relative to distance
	var dist;

	//apply to all objects with the given name, or you can give a specific id!
	with object
	{
	    dist=point_distance(other.x,other.y,x,y);
	    if dist<visibility
	    {
	        visibility=sqrt(1-(dist/visibility));
	    }
	    if dist<radar
	    {
	        reflectivity=sqrt(1-(dist/radar));
	    }
	}



}

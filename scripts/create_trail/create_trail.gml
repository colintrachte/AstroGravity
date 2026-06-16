/// @description create_trail(x offset,y offset,number of points, smooth path, update speed, number of segments, starting width, ending width, sprite, color, alpha,sword)
/// @param x offset
/// @param y offset
/// @param number of points
/// @param  smooth path
/// @param  update speed
/// @param  number of segments
/// @param  starting width
/// @param  ending width
/// @param  sprite
/// @param  color
/// @param  alpha
/// @param sword
function create_trail(x, y, number, smooth, update, number_5, starting, ending, sprite, color, alpha, sword) {
	//By Ground Effect Games
	//trail length is a result of how many points there are in the path, and how often you update them
	var trail = instance_create(x,y,o_trail)
	with trail
	{
	    trail_xoffset=x;
	    trail_yoffset=y;
	    trail_offset=point_distance(0,0,x,y);
	    trail_angle_offset=point_direction(0,0,x,y);
	    trail_object=other.id;
	    trail_path_create(number,smooth)
	    trail_rate=update;//interval, in seconds, between updates of the trail
	    trail_alarm0=0;//this alarm uses delta time for trail updates
	    trail_segments=number_5;
	    trail_startwidth=starting;
	    trail_endwidth=ending;
	    trail_texture=sprite_get_texture(sprite,0)
	    image_blend=color;
	    image_alpha=alpha;
	    sword=sword;
	}
	return trail;



}

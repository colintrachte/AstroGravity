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
function create_trail(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {
	//By Ground Effect Games
	//trail length is a result of how many points there are in the path, and how often you update them
	var trail = instance_create(x,y,o_trail)
	with trail
	{
	    trail_xoffset=argument0;
	    trail_yoffset=argument1;
	    trail_offset=point_distance(0,0,argument0,argument1);
	    trail_angle_offset=point_direction(0,0,argument0,argument1);
	    trail_object=other.id;
	    trail_path_create(argument2,argument3)
	    trail_rate=argument4;//interval, in seconds, between updates of the trail
	    trail_alarm0=0;//this alarm uses delta time for trail updates
	    trail_segments=argument5;
	    trail_startwidth=argument6;
	    trail_endwidth=argument7;
	    trail_texture=sprite_get_texture(argument8,0)
	    image_blend=argument9;
	    image_alpha=argument10;
	    sword=argument11;
	}
	return trail;



}

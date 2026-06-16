/// @description collision_move_snap(object,radius)
/// @param object
/// @param radius
function collision_move_snap(object, radius) {
	//by Ground Effect Games
	//if dropped too close to another object,
	//snap to a position that is far enough away.
	object=instance_nearest(x,y,object);
	move_outside_all(point_direction(object.x,object.y,x,y),radius)



}

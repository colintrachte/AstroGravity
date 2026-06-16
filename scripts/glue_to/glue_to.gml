/// @description glue_to(object,offset,angle)
/// @param object
/// @param offset
/// @param angle
function glue_to(object, offset, angle) {
	//stick an object to another with some offset and angle
	//you can use point_distance to calculate offset if you want
	x=object.x+lengthdir_x(offset,angle);
	y=object.y+lengthdir_y(offset,angle);



}

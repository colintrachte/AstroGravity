/// @description path_point_push(path,point id,length,direction)
/// @param path
/// @param point id
/// @param length
/// @param direction
function path_point_push(path, point, length, direction) {
	//by Ground Effect Games
	//moves the given point some length and direction relative to its current position
	path_change_point(path, point,path_get_point_x(path,point)+lengthdir_x(length,direction),path_get_point_y(path,point)+lengthdir_y(length,direction),path_get_point_speed(path,point));



}

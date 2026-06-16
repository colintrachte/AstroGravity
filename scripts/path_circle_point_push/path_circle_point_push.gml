/// @description path_circle_point_push(path,point id,length,direction)
/// @param path
/// @param point id
/// @param length
/// @param direction
function path_circle_point_push(path, point, length, direction) {
	//by Ground Effect Games
	//moves the given point some length and direction relative to its current position
	//compatible with circles created using path_random_circle
	var xx,yy;
	xx=path_get_point_x(path,point)+lengthdir_x(length,direction);
	yy=path_get_point_y(path,point)+lengthdir_y(length,direction);
	path_change_point(path, point,xx,yy,point_distance(0,0,xx,yy));



}

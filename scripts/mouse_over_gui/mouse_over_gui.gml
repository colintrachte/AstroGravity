/// @description mouse_over_gui(x1,y1,x2,y2)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
function mouse_over_gui(x1, y1, x2, y2) {
	//by Ground Effect Games
	//checks if the mouse is within a given rectangle
	return point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x1,y1,x2,y2);



}

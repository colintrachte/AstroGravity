/// @description trail_path_update(x,y,speed)
/// @param x
/// @param y
/// @param speed
function trail_path_update(x, y, speed) {
	//adds a given point to the path and deletes the oldest one.

	path_add_point(trail_path,x,y,speed);
	if (trail_count>=trail_count_max)
	{
	    path_delete_point(trail_path,0)
	}
	else
	{
	    trail_count+=1;
	}



}

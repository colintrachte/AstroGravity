/// @description path_in_rectangle(x1,y1,x2,y2,path,path x,path y)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param path
/// @param path x
/// @param path y
function path_in_rectangle(x1, y1, x2, y2, path, path_5, path_6) {
	//returns true if ANY point on a path is within the given rectangle
	var path_length=path_get_number(path);
	for (var i=0;i<path_length;i+=1)
	{
	    if point_in_rectangle(path_5+path_get_point_x(path,i),path_6+path_get_point_y(path,i),x1,y1,x2,y2)
	    {
	        return true;
	    }
	}
	return false;
}

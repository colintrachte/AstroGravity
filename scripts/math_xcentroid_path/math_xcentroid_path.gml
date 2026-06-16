/// @description math_xcentroid_path(path)
/// @param path
function math_xcentroid_path(path) {
	//By Ground Effect Games
	//computes the x centroid of the points on a path
	var n=path_get_number(path);

	if (n>0)
	{
	    var i,xx;
	    xx=0;
	    for (i=0;i<n;i+=1)
	    {
	        xx+=path_get_point_x(path,i);
	    }
	    return xx/n;
	}
	return 0;
}
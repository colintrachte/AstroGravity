/// @description math_ycentroid_path(path)
/// @param path
function math_ycentroid_path(path) {
	//By Ground Effect Games
	//computes the y centroid of the points on a path
	var n=path_get_number(path);

	if (n>0)
	{
	    var i,yy;
	    yy=0;
	    for (i=0;i<n;i+=1)
	    {
	        yy+=path_get_point_y(path,i);
	    }
	    return yy/n;
	}
	return 0;
}
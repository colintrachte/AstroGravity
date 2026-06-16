/// @description math_centroid_grid(grid,column)
/// @param grid
/// @param column
function math_centroid_grid(grid, column) {
	//By Ground Effect Games
	//computes the centroid of the points in one column of a grid
	var n=ds_grid_height(grid);

	if (n>0)
	{
	    var i,yy;
	    yy=0;
	    for (i=0;i<n;i+=1)
	    {
	        yy+=ds_grid_get(grid,column,i);
	    }
	    return yy/n;
	}
	return 0;
}
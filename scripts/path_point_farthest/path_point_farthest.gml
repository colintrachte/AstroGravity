/// @description path_point_farthest(path,path x,path y,x,y)
/// @param path
/// @param path x
/// @param path y
/// @param x
/// @param y
function path_point_farthest(path, path_1, path_2, x, y) {
	//by Ground Effect Games
	//finds the farthest point from x,y
	var path_length=path_get_number(path);
	var i,point_id=0,dist,dist2;

	if (path_length>0)
	{
	    dist=point_distance(path_1+path_get_point_x(path,0),path_2+path_get_point_y(path,0),x,y);
	    point_id=0;
	    for (i=1;i<path_length;i+=1)
	    {
	        dist2=point_distance(path_1+path_get_point_x(path,i),path_2+path_get_point_y(path,i),x,y);
	        if (dist2>dist)
	        {
	            dist=dist2;
	            point_id=i;
	        }
	    }
	}
	return point_id;



}

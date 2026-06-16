/// @description path_interpolate(input path1,input path2,segments,weighting,output path)
/// @param input path1
/// @param input path2
/// @param segments
/// @param weighting
/// @param output path
function path_interpolate(input, input_1, segments, weighting, output) {
	//By Ground Effect Games
	//interpolates between two paths and returns the weighted result.
	//path position and path weighting both have values between 0-1
	var i,x1,y1,x2,y2,len,dir,seglength;

	seglength=1/round(segments);
	path_clear_points(output)
	path_set_closed(output,0)

	for (i=0;i<=1;i+=seglength)
	{
	    //get the (x,y) coordinates for the current path location, i.
	    x1=path_get_x(input,i);
	    y1=path_get_y(input,i);
	    s1=path_get_speed(input,i);
	    x2=path_get_x(input_1,i);
	    y2=path_get_y(input_1,i);
	    s2=path_get_speed(input_1,i);
    
	    //measure the angle and distance, and apply the weighting
	    len=point_distance(x1,y1,x2,y2)*weighting;
	    dir=point_direction(x1,y1,x2,y2);
	    sp=s2+(s1-s2)*weighting;
	    path_add_point(output,x1+lengthdir_x(len,dir),y1+lengthdir_y(len,dir),sp)
	}



}

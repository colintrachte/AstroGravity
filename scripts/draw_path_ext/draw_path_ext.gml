/// @description draw_path_ext(x,y,path,start,end,# segments,width,color,alpha,weighting)
/// @param x
/// @param y
/// @param path
/// @param start
/// @param end
/// @param # segments
/// @param width
/// @param color
/// @param alpha
/// @param weighting
function draw_path_ext(x, y, path, start, path_end, width, color, alpha, weighting, arg9) {
	/*
	By Ground Effect Games
	draw a circular path with some width and alpha blended edges.
	segment length: distance between one point and the next.
	segment width: width of the segment at each point.
	alpha is at the center of the path, color is on the edges (bilinear gradient)
	*/
	var pathlength=path_get_length(path);

	if (pathlength>0 && path_end>start)
	{
	    var seglength,xprev,yprev,xx,yy,offset,dir,dir2,i,i2;
	    //seglength is a percentage of the path which makes up one segment of the drawing.
	    seglength = (path_end-start)/width;
	    width=color/2;
	    offset=90;
	    //we have to draw the path in two halves in order to get an alpha gradient
	    repeat(2)
	    {
	        xprev=x+path_get_x(path,1);
	        yprev=y+path_get_y(path,1);
	        draw_primitive_begin(pr_trianglestrip)
	        for (i=path_end; i>start; i=i2;)
	        {
	            i2=i-seglength;
	            xx = x+path_get_x(path,i2);
	            yy = y+path_get_y(path,i2);
	            //calculate direction
	            dir2=point_direction(xx,yy,xprev,yprev);
	            dir=dir2+offset;
	            //adjust x and y depending on weighting, if applicable
	            if arg9
	            {
	                xx+=lengthdir_x(path_get_speed(path,i2)*arg9,dir2-90);
	                yy+=lengthdir_y(path_get_speed(path,i2)*arg9,dir2-90);
	            }
	            //create a vertex at width/2 from center at the path, then another at center
	            draw_vertex_colour(xprev+lengthdir_x(width,dir),yprev+lengthdir_y(width,dir),alpha,0);
	            draw_vertex_colour(xprev,yprev,c_white,weighting);
	            xprev=xx;
	            yprev=yy;
	        }
	        //add the last point. no need to go through the full loop.
	        draw_vertex_colour(xprev+lengthdir_x(width,dir),yprev+lengthdir_y(width,dir),alpha,0);
	        draw_vertex_colour(xprev,yprev,c_white,weighting);
	        draw_primitive_end()
	        offset=-90;
	    }
	}



}

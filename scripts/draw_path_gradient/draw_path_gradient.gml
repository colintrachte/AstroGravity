/// @description draw_path_gradient(x offset,y offset,path,segment length,width,color1,color2,alpha,weighting)
/// @param x offset
/// @param y offset
/// @param path
/// @param segment length
/// @param width
/// @param color1
/// @param color2
/// @param alpha
/// @param weighting
function draw_path_gradient(x, y, path, segment, width, color1, color2, alpha, weighting) {
	/*
	By Ground Effect Games
	draw a path with a width and a color gradient and alpha blended edges.
	segment length: distance between one point and the next.
	segment width: width of the segment at each point.
	alpha is at the center of the path, color is on the edges (bilinear gradient)
	*/
	var pathlength=path_get_length(path);

	if (pathlength>segment)
	{
	    var seglength,xprev,yprev,xx,yy,offset,dir,dir2,i,i2,color;
	    //seglength is a percentage of the path which makes up one segment of the drawing.
	    seglength = segment/pathlength;
	    width=width/2;
	    offset=90;
	    //we have to draw the path in two halves in order to get an alpha gradient
	    repeat(2)
	    {
	        xprev=x+path_get_x(path,1);
	        yprev=y+path_get_y(path,1);
	        i2=1-seglength;
	        xx = x+path_get_x(path,i2);
	        yy = y+path_get_y(path,i2);
	        dir2=point_direction(xx,yy,xprev,yprev);
	        draw_primitive_begin(pr_trianglestrip)
	        draw_vertex_colour(xprev,yprev,c_white,0);
	        xprev=x+path_get_x(path,i2);
	        yprev=y+path_get_y(path,i2);
	        for (i=i2; i>0; i=i2;)
	        {
	            i2=i-seglength;
	            color=merge_color(color1,color2,i);
	            xx = x+path_get_x(path,i2);
	            yy = y+path_get_y(path,i2);
	            //calculate direction
	            dir2=point_direction(xx,yy,xprev,yprev);
	            dir=dir2+offset;
	            //adjust x and y depending on weighting
	            xx+=lengthdir_x(path_get_speed(path,i2)*weighting,dir2-90);
	            yy+=lengthdir_y(path_get_speed(path,i2)*weighting,dir2-90);
	            //create a vertex at width/2 from center at the path, then another at center
	            draw_vertex_colour(xprev+lengthdir_x(width,dir),yprev+lengthdir_y(width,dir),color,0);
	            draw_vertex_colour(xprev,yprev,c_white,alpha);
	            xprev=xx;
	            yprev=yy;
	        }
	        //add the last point. no need to go through the full loop.
	        draw_vertex_colour(xprev,yprev,c_white,0);
	        draw_primitive_end()
	        offset=-90;
	    }
	}



}

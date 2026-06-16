/// @description draw_magnify_path_simple(x offset,y offset,path,seglength,width,texture,texture_pixelwidth,texture_pixelheight,stretch %,color1,color2,alpha,weighting)
/// @param x offset
/// @param y offset
/// @param path
/// @param seglength
/// @param width
/// @param texture
/// @param texture_pixelwidth
/// @param texture_pixelheight
/// @param stretch %
/// @param color1
/// @param color2
/// @param alpha
/// @param weighting
function draw_magnify_path_simple(x, y, path, seglength, width, texture, texture_pixelwidth, texture_pixelheight, stretch, color1, color2, alpha, weighting) {
	//By Ground Effect Games

	var pathlength=path_get_length(path);

	if (pathlength>seglength)
	{
	    var xprev,yprev,x1,y1,x2,y2,dir,i,wx,wy,offset,lt;
	    //returns a percentage of the path which makes up one segment of the drawing.
	    seglength = seglength/pathlength;
	    width=width;
	    offset=1;
	    repeat(2)
	    {
	        xprev=x+path_get_x(path,1);
	        yprev=y+path_get_y(path,1);
	        draw_primitive_begin_texture(pr_trianglestrip,texture)
	        draw_vertex_texture_color(xprev,yprev,xprev/texture_pixelwidth,yprev/texture_pixelheight,color1,0);
	        i=1-seglength;
	        xprev=x+path_get_x(path,i);
	        yprev=y+path_get_y(path,i);
	        for (i=1-(2*seglength); i>0; i-=seglength;)
	        {
	            x1 = x+path_get_x(path,i);
	            y1 = y+path_get_y(path,i);
	            //calculate direction
	            dir=point_direction(x1,y1,xprev,yprev)+90;
	            //adjust x and y depending on weighting
	            x1+=lengthdir_x(path_get_speed(path,i)*weighting,dir);
	            y1+=lengthdir_y(path_get_speed(path,i)*weighting,dir);
	            //set the width
	            wx = lengthdir_x(offset*width,dir);
	            wy = lengthdir_y(offset*width,dir);
	            x2 = xprev+wx;
	            y2 = yprev+wy;
	            lt = width*stretch;
	            //draw one point on the edge, then another in the center of the path
	            draw_vertex_texture_colour(x2,y2,x2/texture_pixelwidth,y2/texture_pixelheight,color2,0);
	            draw_vertex_texture_colour(xprev,yprev,(xprev+lengthdir_x(lt,dir))/texture_pixelwidth,(yprev+lengthdir_y(lt,dir))/texture_pixelheight,color1,alpha);
	            xprev=x1;
	            yprev=y1;
	        }
	        //add the last point. no need to go through the full loop.
	        draw_vertex_texture_color(xprev,yprev,xprev/texture_pixelwidth,yprev/texture_pixelheight,color1,0);
	        draw_primitive_end()
	        offset*=-1;
	    }
	}



}

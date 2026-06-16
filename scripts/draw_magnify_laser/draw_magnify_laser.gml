/// @description draw_magnify_laser(x1,y1,x2,y2,width,texture,texture_pixel_width,texture_pixel_height,pixelstretch,cap,color1,color2,alpha1,alpha2)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param width
/// @param texture
/// @param texture_pixel_width
/// @param texture_pixel_height
/// @param pixelstretch
/// @param cap
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
function draw_magnify_laser(x1, y1, x2, y2, width, texture, texture_pixel_width, texture_pixel_height, pixelstretch, cap, color1, color2, alpha1, alpha2) {
	//by Ground Effect Games
	//we are creating a bilinear gradient with trianglular end caps so there isn't a flat end.

	var length=point_distance(x1,y1,x2,y2);
	if (length>1)
	{
	    var angle,i;
	    angle=point_direction(x1,y1,x2,y2);
	    width=width*.5;//we are starting in the middle of the laser and drawing two halves

	    if (cap<1)//if the user doesn't want end caps, skip them.
	    {
	        i=90;
	        repeat(2)
	        {
	            draw_primitive_begin_texture(pr_trianglestrip,texture)//change to pr_linestrip to debug
	            //middle of the laser has max distortion and alpha
	            xx=x1;
	            yy=y1;//middle starting point
	            draw_vertex_texture_color(xx,yy,(xx+lengthdir_x(pixelstretch,angle+90))/texture_pixel_width,(yy+lengthdir_y(pixelstretch,angle+90))/texture_pixel_height,color1,alpha1)
	            //outer edge at the starting point. has no distortion and no alpha
	            xx+=lengthdir_x(width,angle+i);
	            yy+=lengthdir_y(width,angle+i);//coordinates of the point to be added
	            draw_vertex_texture_color(xx,yy,xx/texture_pixel_width,yy/texture_pixel_height,color2,0)
	            //middle of the ending point
	            xx=x2;
	            yy=y2;//coordinates of the point to be added
	            draw_vertex_texture_color(xx,yy,(xx+lengthdir_x(pixelstretch,angle+90))/texture_pixel_width,(yy+lengthdir_y(pixelstretch,angle+90))/texture_pixel_height,color1,alpha2)
	            //outer edge of the ending point
	            xx+=lengthdir_x(width,angle+i);
	            yy+=lengthdir_y(width,angle+i);//coordinates of the point to be added
	            draw_vertex_texture_color(xx,yy,xx/texture_pixel_width,yy/texture_pixel_height,color2,0)
	            draw_primitive_end();
	            i=-i;
	        }
	    }
	    else//if the user wants end caps
	    {
	        var side=cap*4;
	        i=90;
	        repeat(2)
	        {
	            draw_primitive_begin_texture(pr_trianglestrip,texture)//change to pr_linestrip to debug
	            //end cap forms a triangular point at the beginning and end
	            xx=x1+lengthdir_x(-side,angle);
	            yy=y1+lengthdir_y(-side,angle);//coordinates of the point to be added
	            draw_vertex_texture_color(xx,yy,xx/texture_pixel_width,yy/texture_pixel_height,color2,0)
	            //middle of the laser has max distortion and alpha
	            xx=x1;
	            yy=y1;//middle starting point
	            draw_vertex_texture_color(xx,yy,(xx+lengthdir_x(pixelstretch,angle+90))/texture_pixel_width,(yy+lengthdir_y(pixelstretch,angle+90))/texture_pixel_height,color1,alpha1)
	            //outer edge at the starting point. has no distortion and no alpha
	            xx+=lengthdir_x(width,angle+i);
	            yy+=lengthdir_y(width,angle+i);//coordinates of the point to be added
	            draw_vertex_texture_color(xx,yy,xx/texture_pixel_width,yy/texture_pixel_height,color2,0)
	            //middle of the ending point
	            xx=x2;
	            yy=y2;//coordinates of the point to be added
	            draw_vertex_texture_color(xx,yy,(xx+lengthdir_x(pixelstretch,angle+90))/texture_pixel_width,(yy+lengthdir_y(pixelstretch,angle+90))/texture_pixel_height,color1,alpha2)
	            //outer edge of the ending point
	            xx+=lengthdir_x(width,angle+i);
	            yy+=lengthdir_y(width,angle+i);//coordinates of the point to be added
	            draw_vertex_texture_color(xx,yy,xx/texture_pixel_width,yy/texture_pixel_height,color2,0)
	            //end cap of the ending point
	            xx=x2+lengthdir_x(side,angle);
	            yy=y2+lengthdir_y(side,angle);//coordinates of the point to be added
	            draw_vertex_texture_color(xx,yy,xx/texture_pixel_width,yy/texture_pixel_height,c_white,0)
	            draw_primitive_end();
	            i=-i;
	        }
	    }
	}



}

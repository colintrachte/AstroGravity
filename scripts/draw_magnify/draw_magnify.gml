/// @description draw_magnify(x,y,radius,# polygons,texture,texture pixelwidth,texture pixelheight,pixels stretch,degrees twist)
/// @param x
/// @param y
/// @param radius
/// @param # polygons
/// @param texture
/// @param texture pixelwidth
/// @param texture pixelheight
/// @param pixels stretch
/// @param degrees twist
function draw_magnify(x, y, radius, texture, texture_4, texture_5, pixels, degrees, arg8) {
	//by Ground Effect Games
	//This is specifically designed for use with the application surface.
	//The x and y values are absolute values of pixels on your display, NOT in the room!
	//if you need alpha or coloring, use draw_set_alpha and draw_set_color

	//you can't draw a shape with less than three sides (circles are polygons)
	if (texture>=3)
	{
	    var xx,yy,r2,side,i,texture_angle;
	    //slopes up to full magnification at half of the radius
	    r2=radius*.5;
    
	    //we are drawing a polygon with the number of sides given in arg8
	    //The number of sides cannot physically exceed the circumference of the circle.
	    side=360/round(texture);
    
	    //change to pr_linestrip to debug
	    draw_primitive_begin_texture(pr_trianglestrip,texture_4)
	    for (i=image_angle-360;i<=image_angle;i+=side)
	    {
	        texture_angle=i-arg8;
	        xx=x+lengthdir_x(radius,i);
	        yy=y+lengthdir_y(radius,i);
        
	        //outer circle of points has no magnification or twist
	        draw_vertex_texture_color(xx,yy,xx/texture_5,yy/pixels,c_white,0)
        
	        xx-=lengthdir_x(r2,i);
	        yy-=lengthdir_y(r2,i);
        
	        //middle circle of points twists and stretches the texture, causing magnification.
	        draw_vertex_texture(xx,yy,(xx-lengthdir_x(degrees,texture_angle))/texture_5,(yy-lengthdir_y(degrees,texture_angle))/pixels)
	    }

	    for (i=image_angle-360;i<=image_angle;i+=side)
	    {
	        texture_angle=i-arg8;
	        xx=x+lengthdir_x(r2,i);
	        yy=y+lengthdir_y(r2,i);
	        draw_vertex_texture(x,y,x/texture_5,y/pixels)   
	        //middle circle of points twists and stretches the texture, causing magnification.
	        draw_vertex_texture(xx,yy,(xx-lengthdir_x(degrees,texture_angle))/texture_5,(yy-lengthdir_y(degrees,texture_angle))/pixels)
	    }
	    draw_primitive_end();
	}



}

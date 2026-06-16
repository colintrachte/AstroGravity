/// @description draw_magnify_ext(x,y,radius,# polygons,texture,texture_pixelwidth,texture_pixelheight,pixels_stretch,degrees_twist,color1,color2,color3,alpha1,alpha2,alpha3)
/// @param x
/// @param y
/// @param radius
/// @param # polygons
/// @param texture
/// @param texture_pixelwidth
/// @param texture_pixelheight
/// @param pixels_stretch
/// @param degrees_twist
/// @param color1
/// @param color2
/// @param color3
/// @param alpha1
/// @param alpha2
/// @param alpha3
function draw_magnify_ext(x, y, radius, texture, texture_pixelwidth, texture_pixelheight, pixels_stretch, degrees_twist, color1, color2, color3, alpha1, alpha2, alpha3, arg14) {
	//by Ground Effect Games
	//designed to run in the draw gui event, using a texture generated from the application surface or same sized surface
	//to understand how this works, you need to know polar coordinates
	//we are actually drawing a stack of two n-sided polygons that approximate a 3D sphere.
	//only draw if we have enough triangles.
	if (texture>=3)
	{
	    var side,r1,r2,xx,yy,texture_angle,i;
    
	    //we can do some calculations outside the loop to save CPU.
    
	    //The number of sides cannot physically exceed the circumference of the circle.
	    //also, we round the number of sides to prevent a loss in precision of the drawing.
	    side=360/round(texture);
	    //r1 is the middle radius, where the texture is stretched and twisted the most.
	    r1=radius*.5;
	    //this variable stretches the texture
	    r2=r1-degrees_twist;
    
	    //change to pr_linestrip to debug
	    draw_primitive_begin_texture(pr_trianglestrip,texture_pixelwidth)
	    //This loop draws a donut
	    for (i=image_angle-360;i<=image_angle;i+=side)
	    {
	        texture_angle=i-color1;
	        xx=x+lengthdir_x(radius,i);
	        yy=y+lengthdir_y(radius,i);
        
	        //outer circle of points has no magnification or twist
	        draw_vertex_texture_color(xx,yy,xx/texture_pixelheight,yy/pixels_stretch,alpha1,arg14)
	        xx-=lengthdir_x(r1,i);
	        yy-=lengthdir_y(r1,i);
        
	        //middle circle of points twists and stretches the texture, causing magnification.
	        draw_vertex_texture_color(xx,yy,(x+lengthdir_x(r2,texture_angle))/texture_pixelheight,(y+lengthdir_y(r2,texture_angle))/pixels_stretch,color3,alpha3)
	    }
    
	    //this loop fills the donut hole. The two layers work together to produce a 3D illusion.
	    for (i=image_angle-360;i<=image_angle;i+=side)
	    {
	        texture_angle=i-color1;
	        //middle circle of points twists and stretches the texture, causing magnification.
	        draw_vertex_texture_color(x+lengthdir_x(r1,i),y+lengthdir_y(r1,i),(x+lengthdir_x(r2,texture_angle))/texture_pixelheight,(y+lengthdir_y(r2,texture_angle))/pixels_stretch,color3,alpha3)
	        //there is only one point in the center
	        draw_vertex_texture_color(x,y,x/texture_pixelheight,y/pixels_stretch,color2,alpha2)
	    }
	    draw_primitive_end();
	}



}

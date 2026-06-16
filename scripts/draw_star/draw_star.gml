/// @description draw_star(x,y,radius1,radius2,sides,color1,color2,alpha1,alpha2)
/// @param x
/// @param y
/// @param radius1
/// @param radius2
/// @param sides
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
function draw_star(x, y, radius1, radius2, sides, color1, color2, alpha1, alpha2) {
	//by Ground Effect Games
	//geometric star shape

	//stops the script if there is nothing to draw
	if (sides<=0)
	{exit;}

	var xx,yy,side,start_angle,finish_angle,i;

	side=2*pi/sides;

	//use image_angle just like a sprite would
	start_angle=(image_angle-90)*pi/180;
	finish_angle=2*pi+start_angle;

	//The difference in radius determines how spikey the star is.
	draw_primitive_begin(pr_trianglestrip)
	for (i=start_angle; i<finish_angle; i+=side)
	{
	    //radius 1 point
	    xx=x+radius1*cos(i);
	    yy=y+radius1*sin(i);
	    draw_vertex_color(xx,yy,color2,alpha2)
    
	    //center of the star
	    draw_vertex_color(x,y,color1,alpha1)
    
	    //radius 2 point
	    xx=x+radius2*cos(i+side*.5);
	    yy=y+radius2*sin(i+side*.5);
	    draw_vertex_color(xx,yy,color2,alpha2)
    
	    //center of the star
	    draw_vertex_color(x,y,color1,alpha1)
	}
	//radius 1 point
	xx=x+radius1*cos(i);
	yy=y+radius1*sin(i);
	draw_vertex_color(xx,yy,color2,alpha2)
    
	//center of the star
	draw_vertex_color(x,y,color1,alpha1)

	draw_primitive_end();



}

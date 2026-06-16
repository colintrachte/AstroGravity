/// @description draw_hud_crosshairs(x,y,radius1,radius2,degrees thickness,sides,color1,color2,alpha1,alpha2)
/// @param x
/// @param y
/// @param radius1
/// @param radius2
/// @param degrees thickness
/// @param sides
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
function draw_hud_crosshairs(x, y, radius1, radius2, degrees, sides, color1, color2, alpha1, alpha2) {
	//by Ground Effect Games
	//radially distributes a given number of triangles between radius1 and radius2

	//stops the script if there is nothing to draw
	if (sides>0)
	{
	    var xx,yy,thickness,side,angle,delta;
    
	    //we are drawing crosshairs like a polygon with the number of sides given in color1
	    side=2*pi/sides;
    
	    //use image_angle just like a sprite would
	    angle=(image_angle-90)*pi/180;
	    delta=2*pi+angle;
    
	    //thickness, in degrees, converted to radians
	    thickness=degrees*pi/360;
	    draw_primitive_begin(pr_trianglelist)
	    for (var i=angle;i<delta;i+=side)
	    {
	        //these first two points form a line perpendicular to the center
	        xx=x+radius1*cos(i-thickness);
	        yy=y+radius1*sin(i-thickness);
	        draw_vertex_color(xx,yy,color1,alpha1)
    
	        xx=x+radius1*cos(i+thickness);
	        yy=y+radius1*sin(i+thickness);
	        draw_vertex_color(xx,yy,color1,alpha1)
        
	        //The last point determines which way the triangles point
	        xx=x+radius2*cos(i);
	        yy=y+radius2*sin(i);
	        draw_vertex_color(xx,yy,color2,alpha2)
	    }
	    draw_primitive_end();
	}



}

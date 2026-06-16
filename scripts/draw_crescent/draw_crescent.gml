/// @description draw_crescent(x,y,inner radius,outer radius,# polygons,color1,color2,alpha1,alpha2,angle)
/// @param x
/// @param y
/// @param inner radius
/// @param outer radius
/// @param # polygons
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
/// @param angle
function draw_crescent(x, y, inner, outer, color1, color2, alpha1, alpha2, angle, arg9) {
	//by Ground Effect Games
	//to understand how this works, you need to know polar coordinates

	//only draw if we have enough triangles to do it with.
	if (color1>3)
	{
	    var side,r1,shadow;
    
	    //The number of sides cannot physically exceed the circumference of the circle.
	    //also, we round the number of sides to minimize loss in precision of the drawing.
	    side=360/round(color1);
    
	    //these numbers are used repeatedly in the loop, so we do the calculation in advance to save CPU.
	    //this radius is for the middle of the ring
	    r1=inner+(outer-inner)*.8;
    
	    //change to pr_linestrip to debug
	    draw_primitive_begin(pr_trianglestrip)
	    //This loop draws the outside of the ring
	    for (var i=arg9-360;i<=arg9;i+=side)
	    {
	        shadow=sqr(angle_difference(arg9,i)/180);
	        draw_vertex_color(x+lengthdir_x(outer,i),y+lengthdir_y(outer,i),alpha1,angle)
	        draw_vertex_color(x+lengthdir_x(r1,i),y+lengthdir_y(r1,i),merge_color(c_black,color2,shadow),alpha2*shadow)
	    }
    
	    //this loop draws the inside of the ring
	    for (var i=arg9-360;i<=arg9;i+=side)
	    {
	        shadow=sqr(angle_difference(arg9,i)/180);
	        draw_vertex_color(x+lengthdir_x(r1,i),y+lengthdir_y(r1,i),merge_color(c_black,color2,shadow),alpha2*shadow)
	        draw_vertex_color(x+lengthdir_x(inner,i),y+lengthdir_y(inner,i),alpha1,angle)
	    }
	    draw_primitive_end();
	}



}

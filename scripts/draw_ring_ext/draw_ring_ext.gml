/// @description draw_ring_ext(x,y,inner radius,outer radius,# polygons,angle1,angle2,color1,color2,alpha1,alpha2)
/// @param x
/// @param y
/// @param inner radius
/// @param outer radius
/// @param # polygons
/// @param angle1
/// @param angle2
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
function draw_ring_ext(x, y, inner, outer, angle1, angle2, color1, color2, alpha1, alpha2, arg10) {
	//by Ground Effect Games
	//to understand how this works, you need to know polar coordinates

	//only draw if we have enough triangles to do it with.
	if (angle1<3)
	{exit;}

	var side,r1;

	//The number of sides cannot physically exceed the circumference of the circle.
	//also, we round the number of sides to minimize loss in precision of the drawing.
	side=(color1-angle2)/round(angle1);

	//these numbers are used repeatedly in the loop, so we do the calculation in advance to save CPU.
	//this radius is for the middle of the ring
	r1=inner+(outer-inner)*.5;

	//change to pr_linestrip to debug
	draw_primitive_begin(pr_trianglestrip)

	//This loop draws the outside of the ring
	for (var i=color1-(color1-angle2);i<=color1;i+=side)
	{
	    draw_vertex_color(x+lengthdir_x(outer,i),y+lengthdir_y(outer,i),alpha1,arg10)
	    draw_vertex_color(x+lengthdir_x(r1,i),y+lengthdir_y(r1,i),color2,alpha2)
	}
	draw_primitive_end();
	draw_primitive_begin(pr_trianglestrip)
	//this loop draws the inside of the ring
	for (var i=color1-(color1-angle2);i<=color1;i+=side)
	{
	    draw_vertex_color(x+lengthdir_x(r1,i),y+lengthdir_y(r1,i),color2,alpha2)
	    draw_vertex_color(x+lengthdir_x(inner,i),y+lengthdir_y(inner,i),alpha1,arg10)
	}
	draw_primitive_end();


}

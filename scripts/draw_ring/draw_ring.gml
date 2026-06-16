/// @description draw_ring(x,y,inner radius,outer radius,# polygons,color1,color2,alpha1,alpha2)
/// @param x
/// @param y
/// @param inner radius
/// @param outer radius
/// @param # polygons
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
function draw_ring(x, y, inner, outer, color1, color2, alpha1, alpha2, arg8) {
	//by Ground Effect Games
	//to understand how this works, you need to know polar coordinates

	//only draw if we have enough triangles to do it with.
	if (color1<3)
	{exit;}

	var side,r1;

	//The number of sides cannot physically exceed the circumference of the circle.
	//also, we round the number of sides to minimize loss in precision of the drawing.
	side=360/round(color1);

	//these numbers are used repeatedly in the loop, so we do the calculation in advance to save CPU.
	//this radius is for the middle of the ring
	r1=inner+(outer-inner)*.5;

	//change to pr_linestrip to debug
	draw_primitive_begin(pr_trianglestrip)

	//This loop draws the outside of the ring
	for (var i=0;i<=360;i+=side)
	{
	    draw_vertex_color(x+lengthdir_x(outer,i),y+lengthdir_y(outer,i),alpha1,arg8)
	    draw_vertex_color(x+lengthdir_x(r1,i),y+lengthdir_y(r1,i),color2,alpha2)
	}

	//this loop draws the inside of the ring
	for (var i=0;i<=360;i+=side)
	{
	    draw_vertex_color(x+lengthdir_x(r1,i),y+lengthdir_y(r1,i),color2,alpha2)
	    draw_vertex_color(x+lengthdir_x(inner,i),y+lengthdir_y(inner,i),alpha1,arg8)
	}
	draw_primitive_end();



}

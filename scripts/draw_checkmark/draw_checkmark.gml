/// @description draw_checkmark(x,y,scale)
/// @param x
/// @param y
/// @param scale
function draw_checkmark(x, y, scale) {
	//change to pr_linestrip to debug
	draw_primitive_begin(pr_trianglestrip)
	draw_vertex(x-10*scale,y-10*scale)
	draw_vertex(x+50*scale,y-100*scale)
	draw_vertex(x+90*scale,y-110*scale)
	draw_vertex(x,y+20*scale)
	draw_vertex(x-20*scale,y)
	draw_vertex(x-50*scale,y)
	draw_vertex(x-40*scale,y-30*scale)
	draw_vertex(x+15*scale,y)
	draw_primitive_end()



}

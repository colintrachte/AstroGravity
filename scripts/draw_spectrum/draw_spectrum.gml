/// @description draw_spectrum(x1,y1,width,height,hue1,hue2,alpha_top,alpha_bottom)
/// @param x1
/// @param y1
/// @param width
/// @param height
/// @param hue1
/// @param hue2
/// @param alpha_top
/// @param alpha_bottom
function draw_spectrum(x1, y1, width, height, hue1, hue2, alpha_top, alpha_bottom) {
	//by Ground Effect Games
	//draws the color spectrum
	var c,i;

	draw_primitive_begin(pr_trianglestrip)
	for (i=0; i<=1; i+=1/255)
	{
	    c=make_color_hsv(hue1+i*(hue2-hue1),255,255);
	    draw_vertex_colour(x1+i*width,y1,c,alpha_top)//horizontal bar
	    draw_vertex_colour(x1+i*width,y1+height,c,alpha_bottom)//move i next to height for vertical
	}
	draw_primitive_end()



}

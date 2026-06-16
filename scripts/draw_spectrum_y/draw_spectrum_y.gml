/// @description draw_spectrum_y(x1,y1,width,height,hue1,hue2,alpha_left,alpha_right)
/// @param x1
/// @param y1
/// @param width
/// @param height
/// @param hue1
/// @param hue2
/// @param alpha_left
/// @param alpha_right
function draw_spectrum_y(x1, y1, width, height, hue1, hue2, alpha_left, alpha_right) {
	//by Ground Effect Games
	//draws the color spectrum
	var c,i;

	draw_primitive_begin(pr_trianglestrip)
	for (i=0; i<=1; i+=1/255)
	{
	    c=make_color_hsv(hue1+i*(hue2-hue1),255,255);
	    draw_vertex_colour(x1,y1+i*height,c,alpha_left)//horizontal bar
	    draw_vertex_colour(x1+width,y1+i*height,c,alpha_right)//move i next to height for vertical
	}
	draw_primitive_end()



}

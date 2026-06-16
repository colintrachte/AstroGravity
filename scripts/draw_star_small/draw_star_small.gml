/// @description draw_star_small(x,y,r,color,alpha)
/// @param x
/// @param y
/// @param r
/// @param color
/// @param alpha
function draw_star_small(x, y, r, color, alpha) {
	draw_set_alpha(alpha*.7)
	draw_circle_color(x,y,r*.1,c_white,color,0)
	draw_set_alpha(alpha*.2)
	draw_set_blend_mode(bm_add)
	draw_circle_color(x,y,r,color,c_black,0)
	draw_set_alpha(alpha)
	draw_circle_color(x,y,r*.2,c_white,c_black,0)
	draw_reset()



}

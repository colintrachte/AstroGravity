/// @description draw_hud_points(x,y,r,alpha)
/// @param x
/// @param y
/// @param r
/// @param alpha
function draw_hud_points(x, y, r, alpha) {
	//draws the global score
	draw_set_alpha(alpha)
	draw_text(x+r,y,string_hash_to_newline(string(global.organic_points)))
	draw_star_small(x,y,r,c_lime,alpha)
	draw_text(x+r,y+50,string_hash_to_newline(string(global.metallic_points)))
	draw_star_small(x,y+50,r,c_red,alpha)
	draw_text(x+r,y+100,string_hash_to_newline(string(global.ectenic_points)))
	draw_star_small(x,y+100,r,c_aqua,alpha)
	draw_set_alpha(1)



}

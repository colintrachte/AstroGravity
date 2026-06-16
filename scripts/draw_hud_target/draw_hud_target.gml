/// @description draw_hud_target()
function draw_hud_target() {
	draw_set_blend_mode(bm_add);
	//comment layers for less complex graphics
	draw_hud_crosshairs(x,y,15+radius*4,(3+radius),16,3,c_black,c_white,0,.3)
	draw_hud_crosshairs(x,y,15+radius*4,(3+radius)*2,18,3,c_black,c_white,0,.6)
	draw_hud_crosshairs(x,y,15+radius*4,(3+radius)*3,20,3,c_black,c_white,0,.8)
	draw_set_blend_mode(bm_normal);



}

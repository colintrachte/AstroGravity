function draw_space_rock() {
	draw_path_circle(x,y,path,0,1,min(segments,radius),image_blend,c_black,image_alpha,image_alpha)
	//draw detail
	draw_set_blend_mode(bm_add)
	draw_path_circle_ext(x,y,path,0,1,min(segments,radius),fx.texture[1],256,256,0,c_white,image_blend,image_alpha,image_alpha)
	draw_set_blend_mode(bm_normal)



}

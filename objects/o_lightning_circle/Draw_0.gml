draw_set_blend_mode(bm_add)
draw_lightning_ring(x,y,path[0],0,hp,segments*hp,15,image_angle,c_yellow,1,path[1],p_metal,fx.particles)
draw_set_blend_mode(bm_normal)
draw_text(x-56,y-16,string_hash_to_newline("energy: "+string(hp*100)))
//draw_path(path1,0,0,1)//debug


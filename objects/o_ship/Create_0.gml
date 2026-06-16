fire_enable()
ship_set_type(irandom(1))
ship_set_particles()
ship_set_physics()
ship_set_weapon(0,0,.2,.4)
ship_grid=ds_grid_create(7,0);
ship_grid_load()
scale=ship_grid_scale(ship_grid);
regen=.001;//per step. shields go from 0-1. Need to implement delta time to make it work smoothly
live_s = 3;
shield=create_shield(0,0,45,2,4,48,20,8,sprite_get_texture(sp_disk,0),regen,merge_color(c_white,c_aqua,.5),12)

//drawing
cloak=0;
visibility=1;
left_animation=.5;
left_frame=0;
left_frame_target=0;
right_animation=.5;
right_frame=0;
right_frame_target=0;

//camera
shake=0;
camera_target_add(id,1)



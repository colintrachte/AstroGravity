if camera.zoom<20
{
    var radius=200;
    if (antigravity<0)
    {
        draw_circle_ext(x,y,radius,radius/(camera.zoom+2),fx.texture[2],512,512,random(360),c_red,c_red,.5,0)
    }
    
    draw_ship_grid(ship_grid,x,y,scale,image_angle-90,image_blend,image_alpha,left_animation,right_animation,0)
    draw_self()
    
    if cloak
    {
        draw_effect_cloak(x,y,cloak_mask,camera.zoom,.5,.5,c_white,1);
    }
    
    if camera.zoom<5
    {
        draw_radar_blip(x,y,global.button_radius[0]*camera.zoom,__view_get( e__VW.WPort, 0 ),p_space_enemy,c_red,.9,6,1,0)
        draw_radar_blip(x,y,global.button_radius[0]*camera.zoom,__view_get( e__VW.WPort, 0 ),o_point,c_aqua,.9,5,1,0)
        draw_radar_blip(x,y,global.button_radius[0]*camera.zoom,__view_get( e__VW.WPort, 0 )*5,o_star,c_white,.9,4,1,0)
        draw_radar_blip(x,y,global.button_radius[0]*camera.zoom,__view_get( e__VW.WPort, 0 )*2,p_space_debris,c_yellow,.9,3,1,0)
        draw_radar_blip(x,y,global.button_radius[0]*camera.zoom,__view_get( e__VW.WPort, 0 ),o_planet,c_fuchsia,.9,8,0,0)
    }
}
else
{
    draw_circle(x,y,8*camera.zoom,1)
    draw_circle(x,y,2*camera.zoom,0)
}


if camera.zoom<20
{
    var radius=200;
    if (antigravity<0)
    {
        draw_circle_ext(x,y,radius,radius/(camera.zoom+2),fx.texture[2],512,512,random(360),c_red,c_red,.5,0)
    }
    draw_self()

    if cloak
    {
        draw_effect_cloak(x,y,cloak_mask,camera.zoom,.5,.5,c_white,1);
    }
    
    if !visibility
    {
        draw_ring(x,y,56+8*sin(current_time/100),50+8*cos(current_time/100),6,c_white,c_white,reflectivity,0)
    }
    //uncomment to debug targeting system
    //draw_circle(target_x,target_y,10,0)
    if selected
    {
        draw_hud_target()
    }
}


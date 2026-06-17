//these things only display when a player object exists
with p_player
{
    draw_spectrum(0,0,__view_get( e__VW.WPort, 0 )*percent_energy,18,0,212.5*percent_energy,1,0)
    //lives
    for (i=0;i<live_s;i+=1)
    {
        draw_polygon(10+i*20,8,8,4,0,c_black,c_white,1,.5)
        draw_polygon_outline(10+i*20,8,8,4,0,c_black,.6)
    }
}

if !instance_exists(p_ship_creator)
{
    //demo text
    draw_set_blend_mode(bm_subtract);
    draw_set_color(c_gray);
    draw_rectangle(0,16,300,120,0);
    draw_set_blend_mode(bm_normal);
    draw_set_color(c_white);
    draw_set_halign(fa_left)
    draw_text(0,20,string_hash_to_newline("FPS: "+string(fps)+"#R : Create a new Galaxy#B : Build a ship#N : Spawn your ship at mouse#Mouse Wheel : Zoom In/Out#Esc : Double tap to pause#Left/right click : select/deselect#double click to create portal"))
    draw_set_halign(fa_middle)
    
    //polygon graph
    material_color=make_color_rgb(material[1]*255,material[0]*255,material[2]*255)
    draw_hud_polygraph(radius,200,radius+1,sides,90,material_color,material_color,image_alpha*.2,image_alpha*.4)
    draw_set_color(material_color)
    draw_path_line(material_path,radius,200)
    draw_set_color(c_white)
    draw_dot(radius+math_xcentroid_path(material_path),200+math_ycentroid_path(material_path),3,c_gray,material_color,.9,.8)

    //points
    draw_hud_points(24,272,16,.9)
}


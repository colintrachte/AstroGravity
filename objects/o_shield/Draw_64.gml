if ready && camera.zoom<4 && instance_exists(parent_id)
{
    //draw_set_blend_mode(bm_add)
    var len,i,j,xx,yy,color;
    xx=(x-__view_get( e__VW.XView, 0 ))/camera.zoom;
    yy=(y-__view_get( e__VW.YView, 0 ))/camera.zoom;
    for (j=0;j<layers;j+=1)
    {
        len=(inner_radius+(thickness+spacing*2)*j)/camera.zoom;
        for (i=0;i<sections;i+=1)
        {
            if shields_up
            {
                draw_path_circle_ext(xx,yy,path[j],i/sections,(i+1)/sections,len*.1,texture1,len*2,len*2,image_angle+rot_offset,c_white,image_blend,shields_up*section_energy[i,j],.1*shields_up*section_energy[i,j])
            }
            else
            {
                draw_magnify_path_circle(xx,yy,path[j],i/sections,(i+1)/sections,sqrt(len),texture,__view_get( e__VW.WPort, 0 ),__view_get( e__VW.HPort, 0 ),-(j+1)*(section_energy[i,j]+1),image_angle+rot_offset,image_blend,(1+j)/layers)
            }
            color=make_color_hsv(section_energy[i,j]*80,255,255);
            draw_ring_ext(__view_get( e__VW.WPort, 0 )-100,__view_get( e__VW.HPort, 0 )-100,camera.zoom*len-thickness*section_energy[i,j]/2-1,camera.zoom*len+thickness*section_energy[i,j]/2+1,(inner_radius+(thickness+spacing*2)*j)/6,180+rot_offset+(i-1)*360/sections,180+rot_offset+i*360/sections,color,color,.4,.3)
            draw_ring_ext(__view_get( e__VW.WPort, 0 )-100,__view_get( e__VW.HPort, 0 )-100,camera.zoom*len-thickness*section_energy[i,j]/2,camera.zoom*len+thickness*section_energy[i,j]/2,(inner_radius+(thickness+spacing*2)*j)/6,180+rot_offset+(i-1)*360/sections,180+rot_offset+i*360/sections,color,color,.9,.6)
        }
    }
    draw_set_blend_mode(bm_add)
    if shields_up
    {
        draw_crescent(xx,yy,1,len,len,c_white,image_blend,shields_up,0,damage_dir+180)
        draw_lightning_simple(xx,yy,xx+lengthdir_x(100,damage_dir),yy+lengthdir_y(100,damage_dir),32,30)
    }
    draw_set_blend_mode(bm_normal)
    draw_sprite_ext(parent_id.sprite_index,0,__view_get( e__VW.WPort, 0 )-100,__view_get( e__VW.HPort, 0 )-100,1,1,90,c_white,1)
}


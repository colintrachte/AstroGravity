if trans_alpha>0
{
    draw_set_blend_mode(bm_add)
    for (var i=0;i<nebula_count;i+=1)
    {
        draw_background_ext(tx_nebula,__view_get( e__VW.XView, 0 )+nebula_x[i]*camera.zoom,__view_get( e__VW.YView, 0 )+nebula_y[i]*camera.zoom,nebula_scale[i]*camera.zoom,nebula_scale[i]*camera.zoom,nebula_r[i],nebula_color[i],trans_alpha);
    }
    if backstar_detail
    if instance_exists(star_id)
    {
        for (var i=0;i<star_count;i+=1)
        {
            draw_star_small(star_id.x+lengthdir_x(star_len[i],star_dir[i])+(100*(camera.x-star_id.x)/__view_get( e__VW.WView, 0 )),star_id.y+lengthdir_y(star_len[i],star_dir[i])+(100*(camera.y-star_id.y)/__view_get( e__VW.HView, 0 )),star_r[i],star_color[i],star_alpha[i]*sqrt(trans_alpha))
        }
    }
    draw_set_blend_mode(bm_normal)
}


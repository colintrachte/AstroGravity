path_delete(path)
if (camera.zoom_target==camera.zoom_min)
{
    create(o_point)
    global.game_score+=1;
    hud.level_score+=1;
}
for (i=1;i<8;i+=1)
{
    with seg[i] instance_destroy()
}


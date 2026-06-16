path_delete(path)
if (camera.zoom_target==camera.zoom_min)
{
    create(o_point)
    points+=1;
    hud.level_points+=1;
}
for (var i=1;i<8;i+=1)
{
    with seg[i] instance_destroy()
}


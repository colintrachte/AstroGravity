/// @description this is what makes an object selectable

if selected
{
    camera_target_remove(id)
}
else
{
    camera_target_add(id,.5)
}
selected=!selected;

with hud
{
    object_get_material(other)
    
    var i,len,delta,dir,r;

    path_clear_points(material_path)
    path_set_kind(material_path,0)
    len=array_length(material);
    delta=360/len;
    for (i=0;i<len;i+=1)
    {
        r=material[i]*radius;
        dir=i*delta+90;
        path_add_point(material_path,lengthdir_x(r,dir),lengthdir_y(r,dir),r)
    }
}


/// @description point dragdrop
if (parent_id.m[action]>0)
{
    with o_ship_point
    {
        if material==other.action
        {
            instance_destroy()
        }
    }
    create_ship_point(x,y,32*o_ship_creator.scale,action,image_blend)
    parent_id.m[action]-=1;
}


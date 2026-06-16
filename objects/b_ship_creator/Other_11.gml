/// @description point dragdrop
if (parent_id.m[action]>0)
{
    create_ship_point(x,y,32*o_ship_creator.scale,action,image_blend)
    parent_id.m[action]-=1;
}
if parent_id.tutorial_active<3
{
    with b_ship_creator
    {
        if action<3
        {
            parent_id.tutorial_active=3;
        }
    }
}


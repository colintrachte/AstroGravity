if !mouse_check_button(mb_left)
{
    if other.material>0
    {
        if !o_ship_creator.page
        {
            motion_add(point_direction(other.x,other.y,x,y)+choose(1,0),friction)
        }
    }
    else
    {
        if !movable and other.visible
        {
            other.visible=0;
            movable=1;
        }
    }
}


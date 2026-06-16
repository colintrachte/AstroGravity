var destination;
if ready_to_jump && point_distance(x,y,other.x,other.y)<other.sprite_width
{
    if (other.id == instance_find(o_portal,0))
    {
        destination=instance_find(o_portal,1);
        if (destination!=noone)
        {
            x=destination.x;
            y=destination.y;
        }
    }
    else
    {
        destination=instance_find(o_portal,0);
        x=destination.x;
        y=destination.y;
    }
    ready_to_jump=0;
}


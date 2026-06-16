//bullets do not collide with the shields of the ship that fired them
if (other.parent_id!=parent_id)
{
    damage_shield(other,.5)
    other.image_blend=merge_color(c_white,image_blend,.5);
}


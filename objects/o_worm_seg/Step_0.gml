if distance_to_object(worm.seg[_id-1])>1
{
    move_towards_point(worm.seg[_id-1].x,worm.seg[_id-1].y,worm.seg[_id-1].speed)
}
else
{
    speed=0;
}

image_angle=direction;
image_scale(worm.image_xscale)
image_blend=worm.image_blend;


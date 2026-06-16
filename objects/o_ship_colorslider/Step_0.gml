if click
{
    targets=median(yy+minlimit,window_mouse_get_y(),yy+maxlimit)-yy;
}

if abs(targets-s)>1
{
    s+=(targets-s)/5;
    image_blend=make_color_hsv(targets,255,255);
}
else
{
    s=targets;
}

y=s+yy;


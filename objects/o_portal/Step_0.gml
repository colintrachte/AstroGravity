if abs(scale-image_xscale)>.05//if the portal is not close to target size
{image_xscale+=4*(scale-image_xscale)/game_get_speed(gamespeed_fps);}
else
{
    if (endcreate!=0 && donecreating==0)
    {
        instance_create(x,y,endcreate)
        donecreating=1;
    }
    if closeportal
    {scale=0;}
}

image_alpha=image_xscale;
image_yscale=image_xscale;
alarm0-=screen.sec;
if (alarm0<=0)
{
    closeportal=1;
}

if scale!=0
{
    image_angle+=spin;
    cloudangle+=3*spin;
}

if image_xscale<.05
instance_destroy()


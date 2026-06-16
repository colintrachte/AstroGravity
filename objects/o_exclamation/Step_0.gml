image_angle+=spin;

scale+=scale_rate*2;
image_scale(scale)
image_alpha*=.98;
if image_alpha<.02
{
    instance_destroy()
}


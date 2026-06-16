/// @description intermittent step
alarm[0]=irandom(update_speed);

//confine the camera to within 100,000 pixels of 0,0
camera_confine(0,0,100000)

//particle starfield
part_type_size(fx.stars,.02*zoom,.05*zoom,0,0)
if random_dice(10/update_speed) && zoom>.5
{
    instance_create(x+tolerance(__view_get( e__VW.WView, 0 ))*.5,y+tolerance(__view_get( e__VW.HView, 0 ))*.5,o_astroparticle)
}
else
{
    part_particles_create(fx.below,x+tolerance(__view_get( e__VW.WView, 0 ))*.5,y+tolerance(__view_get( e__VW.HView, 0 ))*.5,fx.stars,1)
}


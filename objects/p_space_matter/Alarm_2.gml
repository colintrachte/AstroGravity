/// @description this code is only run by stars. it handles random spawns
if in_view
{
    if (camera.zoom<global.min_planet_radius/4)
    {
        //asteroids are more likely than particle swarms.
        //bigger star systems are more likely to spawn swarms.
        if random_dice(15-ln(system_radius))
        {
            instance_create(x+tolerance(system_radius),y+tolerance(system_radius),o_astroswarm)
        }
        else
        {
            create_space_matter(8+random(8),.2+random_squared(.5),tolerance(30),3*radius+random(system_radius),random(360))
        }
    }
}
alarm[2]=random(1000);


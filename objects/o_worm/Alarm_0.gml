/// @description intermittent step
alarm[0]=random_decrease(update_speed,.5);

ship_step_ai()

if camera.zoom>20
{
    instance_destroy()
}

//confine the player within 8000 pixels of the star
if (point_distance(x,y,camera.selected.x,camera.selected.y)>8000)
{
    motion_add(point_direction(x,y,camera.selected.x,camera.selected.y),update_speed)
}

math_astrogravity(p_space_matter,.0001*antigravity*update_speed,5000)

accel=sqrt(percent_energy)*max_accel*throttle;
ke=.5*mass*sqr(speed);//kinetic energy = .5*mv^2


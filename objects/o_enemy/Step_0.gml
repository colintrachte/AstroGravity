ship_step_visibility()
ship_step_weapons()

//physics
math_astrogravity(p_space_matter,.0003*antigravity,5000)
//F=ma, E=F*time

if (energy<max_energy)
{
    if energy<=0
    {
        effect_explosion(x,y,1,1)
        create_shockwave(x,y,10,500,2,.2,tolerance(30),tolerance(90),random_color(),image_blend,random_color(),1)
        instance_destroy()
        exit;
    }

    energy+=recharge_rate*reactor_efficiency*screen.sec+energy_boost*.1;
    energy_boost*=.9;
    if median(.1,energy_boost,-.1)==energy_boost
    {
        energy_boost=0;
    }
    energy=median(0,energy,max_energy);
    percent_energy=energy/max_energy;
    color=make_color_hsv(212.5*percent_energy,255,255);
}

accel=percent_energy*max_accel*throttle;
ke=.5*mass*sqr(speed);//kinetic energy = .5*mv^2

//controls
if point_distance(x,y,target_x,target_y)>500 && abs(angle_difference(point_direction(x,y,target_x,target_y),image_angle))<60
{
        force=mass*accel;
        energy-=force*screen.sec/engine_efficiency;//impulse energy = force*time
        motion_add(image_angle,accel*screen.sec)
        friction=sqr(speed/max_speed);
        math_rotate(target_x,target_y,max_spin*screen.sec)
}
else //if powered down,
{
    friction=0;//float in space, but still turn 
    math_rotate(target_x,target_y,max_spin*.2*screen.sec)
}
//in real life, maxspeed would be the speed of light, c=299792458 meters per second
image_yscale=1-(sqr(speed)/sqr(max_speed));//lorentz contraction L=L0sqrt(1-v^2/c^2)
//lorentz contraction normally decreases length with speed.
//We are using it backwards to decrease the ship's width for visual effect.

ship_step_particles()
ship_step_ai()


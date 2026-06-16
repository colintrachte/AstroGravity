//if keyboard_check_pressed(ord('A'))
{
    accel=percent_energy*max_accel*throttle/2;
    force=mass*accel;
    energy-=force*screen.sec/engine_efficiency;//impulse energy = force*time
    motion_add(image_angle-22,accel*screen.sec*10)
    ke=.5*mass*sqr(speed);//kinetic energy = .5*mv^2
    left_frame+=pi;
}


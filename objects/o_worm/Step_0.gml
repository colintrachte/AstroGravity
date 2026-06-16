ship_step_ai()

direction+=sin(current_time*speed/1000)*50/(1+speed);
//update the path used for drawing the worm
path_change_point(path,9,x+lengthdir_x(104*image_xscale*.5,image_angle),y+lengthdir_y(104*image_xscale*.5,image_angle),1)
path_change_point(path,8,x,y,1)
for (var i=1;i<8;i+=1)
{
    path_change_point(path,i,seg[8-i].x,seg[8-i].y,1)
}
path_change_point(path,0,seg[7].x+lengthdir_x(105*seg[7].image_xscale*.5,seg[7].image_angle+180),seg[7].y+lengthdir_y(105*seg[7].image_xscale*.5,seg[7].image_angle+180),1)

ship_step_weapons()

//physics
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

//controls
if point_distance(x,y,target_x,target_y)>500 && abs(angle_difference(point_direction(x,y,target_x,target_y),image_angle))<60
{
        force=mass*accel;
        energy-=force*screen.sec/engine_efficiency;//impulse energy = force*time
        motion_add(point_direction(x,y,target_x,target_y),accel*screen.sec)
        friction=sqr(speed/max_speed);
        math_rotate(target_x,target_y,max_spin*screen.sec)
}
else //if powered down,
{
    friction=0;//float in space, but still turn 
    math_rotate(target_x,target_y,max_spin*.2*screen.sec)
}


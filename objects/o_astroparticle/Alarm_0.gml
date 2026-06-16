/// @description alarm and dice are used to greatly reduce CPU impact.
visible=(median(.5,camera.zoom,4)==camera.zoom);
if visible
{
    //physics
    choose
    (
        math_astrogravity_ext(p_space_enemy,screen.sec*10,1000,100),
        math_astrogravity_ext(p_player,screen.sec*10,1000,100),
        math_astrogravity_ext(p_space_matter,screen.sec*10,1000,100)
    )
    
    var ship=collision_point(x,y,o_ship,0,1);
    if (ship!=noone)
    {
        instance_destroy()
        ship.energy_boost+=5;
    }
    
    if (collision_point(x,y,p_space_matter,0,1)!=noone)
    {
        scale*=.5;
    }

    
    //drawing and lifespan
    image_alpha=max(1,sqrt(speed)/8);
}
scale*=.995;
if (scale<.1)
{
    instance_destroy()
}

alarm[0]=update_speed+random(sqrt(update_speed));


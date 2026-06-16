//bullets do not collide with the ship that fired them
if (other.id!=parent_id)
{
    other.energy-=energy;
    energy*=.5;
    effect_explosion(x,y,1,1)
    create_shockwave(x,y,10,100,2,.2,tolerance(30),tolerance(90),random_color(),image_blend,random_color(),1)
    if random_dice(energy)
    {
        instance_destroy()
    }
}


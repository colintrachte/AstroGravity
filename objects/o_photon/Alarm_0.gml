if image_alpha<1
{
    image_alpha*=sqrt(image_alpha);//fade out
    friction=0;//stop accelerating
    if image_alpha<.01
    {
        instance_destroy()
    }
}
else
{
    //seeker bullets!
    if seeker
    {
        if instance_exists(target)
        {
            math_turn(target.x,target.y,10*screen.sec)
        }
    }
    
    image_angle=direction;
    math_astrogravity(p_space_matter,screen.sec*update_speed,500)
}

trail.image_alpha=image_alpha;

alarm[0]=random_decrease(update_speed,.5);


alarm[0]=update_speed;
//slow down the shockwave over time
sp*=.99;
image_angle+=spin;
//all variables for this object are initialized with a script with the same name as the object
if (radius<targetradius)
{
    //increase the radius if it is less than target radius
    radius+=targetradius*sp;
}
else
{
    //destroy when max radius is reached
    instance_destroy()
}

/*collide=collision_circle(x,y,radius,p_space_debris,0,1);

if (collide!=noone)
{
    with p_space_debris
    {
        var dist=point_distance(x,y,other.x,other.y);
        //it is important to limit the distance at which gravity applies
        if (dist<other.radius)
        {
            var magnitude=point_distance(0,0,sprite_width,sprite_height);
            //the force here is multiplied by fps
            motion_add(point_direction(other.x,other.y,x,y),power(magnitude,3)/(1+sqr(dist+magnitude)));
        }
    }
}*/

/* */
/*  */

/// @description create_bullet(x,y,speed,direction,color,energy,trail,seeker,type,scale,target,lifespan,update speed)
/// @param x
/// @param y
/// @param speed
/// @param direction
/// @param color
/// @param energy
/// @param trail
/// @param seeker
/// @param type
/// @param scale
/// @param target
/// @param lifespan
/// @param update speed
function create_bullet(x, y, speed, direction, color, energy, trail, seeker, type, scale, target, lifespan, update) {
	//the switch statment allows you to add other types of bullets

	switch type
	{
	    case 0: {bullet=instance_create(x,y,o_photon);} break;
	    default: {bullet=instance_create(x,y,o_photon);} break;
	}

	with bullet
	{
	    speed=speed;
	    direction=direction;
	    image_angle=direction;
	    image_blend=color;
	    //remember the object that created the bullet,
	    //so it can't damage the gun that fired it.
	    parent_id=other.id;
	    energy=energy;
	    if trail
	    {
	        trail=create_trail(0,0,10,0,.01,15,32,0,sp_trail,image_blend,image_alpha,0);
	    }
	    seeker=seeker;
	    image_scale(scale);
	    target=target;
	    alarm[1]=lifespan;//lifespan, in steps, of the bullet before it fades out
	    update_speed=update;
	    alarm[0]=update_speed;//intermittent step update speed
    
	    friction=-.2;
	}



}

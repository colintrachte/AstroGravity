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
function create_bullet(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12) {
	//the switch statment allows you to add other types of bullets

	switch argument8
	{
	    case 0: {bullet=instance_create(argument0,argument1,o_photon);} break;
	    default: {bullet=instance_create(argument0,argument1,o_photon);} break;
	}

	with bullet
	{
	    speed=argument2;
	    direction=argument3;
	    image_angle=direction;
	    image_blend=argument4;
	    //remember the object that created the bullet,
	    //so it can't damage the gun that fired it.
	    parent_id=other.id;
	    energy=argument5;
	    if argument6
	    {
	        trail=create_trail(0,0,10,0,.01,15,32,0,sp_trail,image_blend,image_alpha,0);
	    }
	    seeker=argument7;
	    image_scale(argument9);
	    target=argument10;
	    alarm[1]=argument11;//lifespan, in steps, of the bullet before it fades out
	    update_speed=argument12;
	    alarm[0]=update_speed;//intermittent step update speed
    
	    friction=-.2;
	}



}

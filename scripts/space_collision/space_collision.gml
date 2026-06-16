function space_collision() {
	var object_contact=collision_circle(x,y,radius,p_space_matter,1,1);
	if (object_contact!=noone)
	{
	    //the chance of an object being destroyed depends on the size of the object it collides with.
	    //small objects are completely destroyed by significantly larger objects
	    if diameter<object_contact.radius
	    {
	        instance_destroy()
	        object_contact.speed*=.5;
	    }
	    else
	    {
	        if (radius<object_contact.radius)
	        {
	            if random_dice(sqrt(diameter))
	            {
	                instance_destroy()
	                object_contact.speed*=.5;
	            }
	        }
	    }
	}
           
	//delete the object if it is outside of the galaxy
	if instance_exists(galaxy_id)
	{
	    if (point_distance(x,y,galaxy_id.x,galaxy_id.y)>galaxy_id.radius)
	    {
	        instance_destroy()
	    }
	}



}

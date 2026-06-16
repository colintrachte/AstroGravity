function space_matter_impact() {
	//if the current object is not about to despawn
	if (image_alpha>.1)
	{
	    //with the space matter causing the collision
	    with other
	    {
	        if random_dice(sqrt(radius*3))
	        {
	            instance_destroy()
	        }
	        else
	        {
	            motion_add(other.direction+180,50*screen.sec/radius)
	            var p=path_point_closest(path,x,y,other.x,other.y);
	            path_circle_point_push(path,p,radius*.2,180-image_angle+360*p/path_get_number(path))
	            if (type=="planet") && choose(1,0)
	            {
	                with create_space_matter(global.min_debris_radius+random(global.delta_debris_radius),.2+random_squared(.5),tolerance(30),random_increase(radius+16,.5),random(360))
	                {
	                    //comets normally fade in, but in this case we don"t want that.
	                    image_alpha=1;
	                    //tell the new space debris that it should not orbit anything.
	                    orphan=1;
	                }
	            }
	        }
	    }
	    effect_explosion(x,y,1,1)
	    create_shockwave(x,y,10,100,2,.2,tolerance(30),tolerance(90),random_color(),image_blend,random_color(),1)
	}



}

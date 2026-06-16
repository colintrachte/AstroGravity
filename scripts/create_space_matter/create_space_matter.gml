/// @description create_space_matter(radius,variance,spin,orbit radius,orbit angle)
/// @param radius
/// @param variance
/// @param spin
/// @param orbit radius
/// @param orbit angle
function create_space_matter(radius, variance, spin, orbit, orbit_4) {
	//By Ground Effect Games
	//variance is the percentage by which some other variables are randomized.
	//this is the script for creating all objects with parent p_space_matter

	//figure out where to create the object
	var xx,yy;
	xx=x+lengthdir_x(orbit,orbit_4);
	yy=y+lengthdir_y(orbit,orbit_4);

	//figure out what type of object to create depending on global settings in load_globals()
	switch space_matter_classify(radius)
	{
	    //I have organized this list from largest to smallest
	    case "nebula":  {body=instance_create(xx,yy,o_nebula);} break;
	    case "star": {body=instance_create(xx,yy,o_star);} break;
	    case "planet": {body=instance_create(xx,yy,o_planet);} break;
	    case "moon":  {body=instance_create(xx,yy,o_moon);} break;
	    case "comet":  {body=instance_create(xx,yy,o_comet);} break;
	    case "asteroid":  {body=instance_create(xx,yy,o_asteroid);} break;
	}

	//set up all the variables needed for the object (replaces the creation event)
	with (body)
	{
	    //Everything before the switch/case structure is default settings
    
	    //identities and spawns
	    type=space_matter_classify(radius);
	    parent_id=other.id;
	    galaxy_id=instance_nearest(x,y,o_galaxy);
	        //default setting is to not spawn anything
	    child_count=0;
	    spawned_children=1;
	    discovered=0;
	    selected=0;
    
	    //physics
	    radius=radius;
	    diameter=radius*2;
	    twopi=6.283185;
	    //area=twopi*sqr(radius);
	    volume=math_get_volume(radius,radius,1);//volume is technically m^3, where 1 pixel=1 meter, but planets are not simulated to scale.
	    density=(.5+random(7))*1000;//this is a realistic range, in kg/m^3. Earth is ~5500.
	    mass=volume*density;
	    image_scale(diameter/(1+sprite_width))
	        //spin is how many degrees to rotate every second, varied by variance
	    spin=spin+tolerance(spin*variance);
	    orbit_radius=orbit;
	    orbit_angle=orbit_4;
	    orphan=!instance_exists(parent_id);
    
	    if orbit_radius
	    {
	        var velocity_angle, vx, vy, t1, t2, GM, eccX, eccY, ke;
        
	        orbit_path = path_add();
        
	        //(Gravitational Constant)*(mass of the star)
	        M=1000000;
	        G=6.667384;
	        GM=G*(M+mass);
        
	        xx=lengthdir_x(orbit_radius,orbit_angle);
	        yy=lengthdir_y(orbit_radius,orbit_angle);
        
	        //initial velocity needed for a perfectly circular orbit.
	        orbit_speed=math_orbital_velocity(mass,orbit_radius);
        
	        //velocity angle determines how close to a circular orbit we actually get
	        velocity_angle=orbit_angle+90+tolerance(min(60,ln(power(orbit_radius,2))));
	        vx=lengthdir_x(orbit_speed,velocity_angle);
	        vy=lengthdir_y(orbit_speed,velocity_angle);
        
	        //specific orbital energy
	        ke=sqr(orbit_speed)/2;
	        energy = ke - GM/orbit_radius;
	        if (energy <= 0)
	        {
	            t1 = energy + ke;
	            t2 = xx*vx + yy*vy;
            
	            //eccentricity (how far away from a perfect circle is it on a scale of 0-1?)
	            eccX = (t1*xx - t2*vx)/GM;
	            eccY = (t1*yy - t2*vy)/GM;
	            ecc  = math_magnitude(eccX,eccY);
	            ecc_angle = point_direction(0,0,eccX,eccY);
            
	            moment = xx*vy - yy*vx;
            
	            //semilatus is the opposite side of a right triangle with one corner at the sun,
	            //inscribed into an ellipse where the sun is not centered. Google for details.
	            semiLatus = sqr(moment)/GM;

	            path_orbit(0,0,orbit_path, semiLatus, moment, M+mass, ecc,ecc_angle,energy);
	            pos=random(1);
	            orbit_circumference=path_get_length(orbit_path);
	            path_in_view=0;
	            //semi_major_axis=GM/abs(2*energy);
	            //orbit_period=twopi*sqrt(power(semi_major_axis,3)/GM)
	        }
	        else
	        {
	            //planets moving faster than escape velocity are "orphans"
	            orphan=1;
	        }
	    }
	    else
	    {
	        //if no orbit radius is specified, figure one out.
	        parent_id=instance_nearest(x,y,p_space_matter);
	        orbit_radius=point_distance(x,y,parent_id.x,parent_id.y);
	        if orbit_radius<1
	        {
	            orbit_radius=1;
	        }
	        orbit_circumference=twopi*orbit_radius;
	        orbit_speed=math_orbital_velocity(mass,orbit_radius);
	    }
    
	    //drawing
	    depth=random(90);
	    in_view=0;
	    segments=1;
	        //the inner radius is varied by variance
	    path=path_add();
	    path_random_circle(path,0,0,radius*(1-variance),radius,0,radius,1,1);
	    image_angle+=depth*2;
	    path_rotate(path,-depth*2);
	    exclamation=1;
	    exclamation_text="";
    
	    //unique code required for each type
	    switch type
	    {
	        case "nebula":
	        {
            
	        } break;
        
	        case "star":
	        {
	            //size factor is always larger than 2.
	            //it determines the number of points on the star shaped map icons
	            size_factor=round(ln(radius-global.min_star_radius+6));
	            //density is between 1 and a million. densities close to 1 are more likely.
	            density=power(1+random_squared(9),6);
	            //red is more likely than blue
	            color=make_color_star(255-random_squared(255),random_squared(255));
	            subtype=space_matter_subclassify(type,radius,density);
	            switch subtype
	            {
	                case "black hole": {visible=false;} break;
	                case "red giant":  {color=c_red} break;
	                case "binary":  {visible=false;image_scale(0);} break;
	                case "white dwarf":  {color=c_white;} break;
	                case "red dwarf": {color=c_red;} break;
	                case "regular":  {} break;
	            }
	            //pulsars mostly occur at high densities, but there are rare exceptions.
	            //pulsar=random_dice(100000/density);
            
	            //in order to reduce the distances between stars and planets,
	            //gravity is calculated using sprite size, not mass.
	            //mass is only used to calculate what type of star it should be.
	            mass=volume*density;
	            //larger stars have fewer planets.
	            child_count=round(.4+random_squared(20/size_factor));
	            spawned_children=0;
	            system_spacing=random_increase(global.min_star_radius*twopi,.2);
	            system_radius=system_spacing*child_count;
	            //nebulas will have 2 layers
	            space_set_nebula(2)
	            space_set_background_stars(sqr(ln(radius+system_radius)),48,system_radius)
	            object_set_material(1-random_squared(1),random_squared(1),1-random_squared(1))
	            //initialize asteroid spawn timer
	            alarm[2]=choose(1,2,3);
	            dt=0;
	            exclamation_text="New System!";
	        } break;
	        case "planet":
	        {
	            if instance_exists(parent_id)
	            {
	                distance_factor=min(1,ln(orbit_radius)/10);
	                ice=.5*distance_factor;
	                temp=math_space_temperature(color_get_value(parent_id.image_blend),orbit_radius+1,1)
	                color_glow=merge_color(parent_id.image_blend,c_white,ice);
	            }
	            else
	            {
	                orphan=1;
	                distance_factor=.1;
	                ice=1;
	                temp=100;
	                color_glow=merge_color(image_blend,c_white,ice);
	            }
	            rings=0;
	            aurora=0;
	            aurora_dir=0;
	            aurora_sweep=90;
	            //rain
	            raining=0;
	            //rain dir and sweep determine where the rain begins and ends.
	            rain_dir=0;
	            //how many degrees from rain dir to wrap around the planet
	            rain_sweep=180;
	            exclamation_text="Planet Discovered!";
	            size_factor=round(ln(radius-global.min_planet_radius+1));
	            earth=density/7500;
	            //liquid water requires a specific temperature range
	            water=(median(273,temp,373)==temp)*7500/(density+1000);
	            atmo=random_squared(10*distance_factor);
	            lava=random_squared(.5/distance_factor);
	            //image_blend may vary depending on surroundings.
	            //The intrinsic color of the planet must be saved to a separate variable.
	            color=merge_color(merge_color(random_color_star(),c_black,.5),color_glow,.3);
	            object_set_material(1-random_squared(1),1-random_squared(1),random_squared(1))
	            //larger planets tend to have more moons
	            child_count=random(size_factor*distance_factor);
	            spawned_children=0;
	            //moons are generally less than half the size of their planets
	            system_spacing=random_increase(radius*1.5,.5);
	            system_radius=child_count*system_spacing;
	        } break;
	        case "moon":
	        {
	            if orphan
	            {
	                ice=1;
	            }
	            else
	            {
	                shadow_angle=parent_id.orbit_angle;
	                distance_factor=1;//sqrt(orbit_radius/parent_id.system_radius);
	                ice=.5*distance_factor;
	            }
	            exclamation_text="Moon Discovered!";
	            color_glow=merge_color(parent_id.image_blend,c_white,ice);
	            color=merge_color(merge_color(random_color_star(),c_black,.5),color_glow,.3);
	            object_set_material(1-random_squared(1),1-random_squared(1),random_squared(1))
	        } break;
	        //comets are bluish and have tails, asteroids are reddish and have no tail.
	        case "comet":
	        {
	            image_alpha=0;
	            color=make_color_star(40,55+random(200));
	            //comets are mostly organic
	            object_set_material(1-random_squared(1),random_squared(1),random_squared(1))
	            trail=create_trail(0,0,20,0,.03,diameter,diameter,diameter,sp_trail,color,1,0);
	            trail.depth=depth+1;
	            speed=orbit_speed*screen.sec/3;
	            stored_speed=speed;
	            direction=orbit_angle+90;
	            exclamation_text="Comet!";
	        } break;
	        case "asteroid":
	        {
	            image_alpha=0;            
	            color=make_color_star(55+random(200),40);
	            //asteroids are mostly metallic
	            object_set_material(random_squared(1),1-random_squared(1),random_squared(1))
	            speed=orbit_speed*screen.sec/3;
	            stored_speed=speed;
	            direction=orbit_angle+90;
	            exclamation_text="Asteroid!";
	        } break;
	    }
	    //these variables are universal, but also dependent on unique code
	    image_blend=color;
    
	        //timing - these alarms may be found in the parent object p_space_matter.
	    //alarms are randomized slightly so they don"t all happen at once.
	        //collision detection
	    alarm[0]=choose(1,2,3);
	        //spawn children, if applicable
	    alarm[1]=choose(1,2,3);
	        //disable collisions for the first three seconds after creation
	    alarm[3]=180;
	        collisions_enabled=0;
	        //some code can be run less frequently than every step.
	    update_speed=4;
	    alarm[4]=update_speed;
    
	        //detailed descriptions coming soon!
	    name="";
	    habitability="";
	    composition="";
	    ruins="";
	    factions="";
	    backstory="";
	}
	return body;



}

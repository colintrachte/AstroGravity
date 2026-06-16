/// @description spawn child objects if in view and zoomed in enough
//this alarm stops once children are spawned.
if (!spawned_children)
{
    if in_view
    {
        switch type
        {
            case "star":
            {
                if child_count
                {
                    //planets are not spawned until a star is in view of the camera
                    //to prevent all the stars in the galaxy from generating planets at once.
                    var delta,min_radius;
                    delta=global.delta_planet_radius;
                    min_radius=global.min_planet_radius;
                    for (var i=1; i<=child_count; i+=1)
                    {
                        j=i/child_count;
                        create_space_matter(random_squared(delta*j)+min_radius,.05+random_squared(.1),sign(spin)*(10+random(20)),system_spacing*i+random_increase(radius,.5),random(360))
                    }
                }
                spawned_children=1;
            } break;
            
            case "planet":
            {
                if (child_count)
                {
                    //planets will have moons or rings, not both.
                    var moon_type=choose(1,0);
                    for (var i=1; i<child_count; i+=1)
                    {
                        if moon_type
                        {
                            create_space_matter(random_decrease(radius*.5,.5),.1+random(.3),random_decrease(spin,.1),(system_spacing*i)+random_increase(radius,.5),random_halton(i,3,360))
                        }
                        else
                        {
                            repeat (2+random(2))
                            {
                                ring_color[rings]=merge_color(choose(c_black,image_blend),random_color_star(),.2+random(.3));
                                ring_radius[rings]=32+random_decrease(system_spacing*i,.3);
                                ring_width[rings]=5+random(32);
                                rings+=1;
                            }
                        }
                    }
                }
                spawned_children=1;
            } break;
        }
    }
    alarm[1]=3;
}



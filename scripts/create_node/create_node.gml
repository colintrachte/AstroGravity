function create_node() {
	with instance_create(x,y,o_node)
	{
	    direction=other.direction+other.i+random(10)-5;
	    //image_angle=direction;
	    branches=irandom(other.branches-1);
	    radius=16+16*branches;
	    speed=1;
	    friction=.002*sqrt(branches+1);
	    spawnrate=other.spawnrate;
	    alarm[0]=spawnrate;
	    parent_id=other.id;
	    color=random_color();
	    depth=other.depth+1;
	    grab=0;
	    with instance_create(x,y,o_module)
	    {
	        parent_id=other.id;
	    }
	}



}

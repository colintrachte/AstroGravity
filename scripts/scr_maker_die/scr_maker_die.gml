function scr_maker_die() {
	//This function is run by o_pixel and should not be called by the user directly
	//it changes the maker object into whichever object was specified in scr_assemble_pixels
	if (maker.dead==maker.total)
	{
	    with maker
	    {
	        x+=sprite_get_xoffset(sprite_index);
	        y+=sprite_get_yoffset(sprite_index);
	        var obj = object;
        instance_destroy();
        instance_create_layer(x, y, "Instances", obj);
	    }
	    with o_pixel
	    {
	        if (maker==other.maker)
	        {
	            instance_destroy();
	        }
	    }
	}



}

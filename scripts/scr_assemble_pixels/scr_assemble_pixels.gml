function scr_assemble_pixels(arg0, arg1, arg2, arg3, arg4, arg5) {
	//scr_assemble_pixels(x,y,object,sprite,acceleration,pixel size)
	//by Ground Effect Games
	//assembles a sprite from pixels, then creates specified object.

	if (sqr(arg4)<=game_get_speed(gamespeed_fps))
	{
	    with instance_create(arg0-sprite_get_xoffset(arg3),arg1-sprite_get_yoffset(arg3),o_pixelmaker)
	    {
	        object=arg2;
	        sprite_index = arg3;
	        accel = max(1,arg4);
	        size = floor(arg5);
	        ii=0;
	        jj=0;
	        //rate=interval, in seconds, at which individual pixels are created
	        //room speed is the maximum rate. This prevents maxing out the CPU
	        rate=1/sqr(accel);
	        alarm0=rate;
	        sec=delta_time/1000000;
	        total=ceil(sprite_height/size)*ceil(sprite_width/size);
	        dead=0;
	        dist=0;
	        theta=0;
	    }
	}
	else
	{
	    with instance_create(arg0-sprite_get_xoffset(arg3),arg1-sprite_get_yoffset(arg3),o_pixelmaker_fast)
	    {
	        object=arg2;
	        sprite_index = arg3;
	        accel = max(1,arg4);
	        size = floor(arg5);
	        ii=0;
	        jj=0;
	        rate=sprite_height/(sqr(accel)*size);
	        alarm0=rate;
	        sec=delta_time/1000000;
	        total=ceil(sprite_height/size)*ceil(sprite_width/size);
	        dead=0;
	        dist=0;
	        theta=0;
	    }
	}



}

function create_pixel() {
	//create_pixel()
	//This function is called by o_pixelmarker and should not be called by the user directly
	//small changes to this function will drastically impact CPU usage!
	dist=random(sqrt(sprite_width*sprite_height)*2);
	theta=random(2*pi);
	with instance_create(x+dist*cos(theta),y+dist*sin(theta),o_pixel)
	{
	    maker = other.id;
	    sprite_index = maker.sprite_index;
	    image_alpha=0;
	    image_blend=maker.image_blend;
	    left = maker.ii;
	    top = maker.jj;
	    xdest = left+maker.x;
	    ydest = top+maker.y;
	    friction=1/game_get_speed(gamespeed_fps);
	    speed=random(5/maker.accel);
	    direction=point_direction(x,y,xdest,ydest)+random(180)-90;
	    dist=0;
	    dead=0;
	    alarm[0]=1;
	}



}

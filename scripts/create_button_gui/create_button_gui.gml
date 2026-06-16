/// @description create_button_gui(x,y,target x,target y,width,target width,height,target height,sprite_alpha,target sprite_alpha,image_alpha,target image_alpha,loading bar %,target loading bar %,string label,click action #)
/// @param x
/// @param y
/// @param target x
/// @param target y
/// @param width
/// @param target width
/// @param height
/// @param target height
/// @param sprite_alpha
/// @param target sprite_alpha
/// @param image_alpha
/// @param target image_alpha
/// @param loading bar %
/// @param target loading bar %
/// @param string label
/// @param click action #
function create_button_gui(x, y, target, target_3, width, target_5, height, target_7, sprite_alpha, target_9, image_alpha, target_11, loading, target_13, string, click) {
	//creates a default button example
	button=instance_create(x,y,o_button);
	with button
	{
	    parent_id=other.id;
	    selected=0;
	    margin=8;
	    image_speed=0;
    
	    w=width; h=height;
	    tw=target_5; th=target_7;
    
	    x1=x-w; y1=y-h;//top right corner
	    x2=x+w; y2=y+h;//bottom left corner
	    tx=target;   ty=target_3;
    
	    activated=1;//determines whether or not to update
	    touch=0;
	    hover=0;
	    update_speed=3;
	    alarm[0]=update_speed;
    
	    alpha=sprite_alpha;
	    target_alpha=target_9;
	    image_alpha=image_alpha;
	    target_image_alpha=target_11;
    
	    //loading bar
	    q=loading;
	    tq=target_13;
	    color=make_color_hsv(q*64,255*activated,255);
    
	    label=string;
	    click_action=click;
    
	    //after all your other variables are set, initialize the grid
	    holygrid=ds_grid_create(6,7);
	    scr_holygrid_preset(holygrid,0);
	}
	return button;



}

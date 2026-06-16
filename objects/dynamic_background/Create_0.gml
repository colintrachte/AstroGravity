//set up the variables for drawing nebula backgrounds.
//The initial size of the array is the max limit for the number of nebulas, stars, etc.
backstar_detail=0;
backstar_radius = 80;
space_set_nebula(2)
space_set_background_stars(80,backstar_radius,5000)
star_id=instance_nearest(camera.x,camera.y,o_star);
trans_alpha=0;
dir=0;
dist=0;


//intermittent step
update_speed=2;
alarm[0]=update_speed;


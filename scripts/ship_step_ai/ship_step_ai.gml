function ship_step_ai() {
	//if it is possible for the enemy to spot the player
	if instance_exists(p_player)
	{
	    if point_distance(x,y,p_player.x,p_player.y)<(750*p_player.image_alpha)
	    {
	        //if the enemy sees the player
	        if abs(angle_difference(image_angle,point_direction(x,y,p_player.x,p_player.y)))<120
	        {
	            locked_on=1;
	            target=p_player.id;
	            //set an alarm to 5 seconds. if the player is able to escape, weapons lock is reset.
	            //alarm[0]=game_get_speed(gamespeed_fps)*10;
	        }
	    }
	}

	if locked_on && instance_exists(target)
	{
	    if instance_exists(p_player)
	    {
	        if target==p_player.id
	        {
	            locked_on=!target.cloak;
	        }
	    }
    
	    //compensate for the speed and direction of the target
	    target_x=target.x+target.hspeed*30;
	    target_y=target.y+target.vspeed*30;
    
	    //if the weapon is ready to fire, aiming in the right direction, and target is in range, fire a bullet
	    if weapon_ready[0]
	    {
	        if point_distance(x,y,target.x,target.y)<500 && abs(angle_difference(point_direction(x,y,target_x,target_y),image_angle))<20
	        {
	            var drain=3*math_photon_energy(color);
	            if energy>drain/weapon_efficiency[0]
	            {
	                create_bullet(x+lengthdir_x(speed,direction),y+lengthdir_y(speed,direction),speed+15,image_angle,c_orange,2,1,1,weapon_type[0],1,noone,game_get_speed(gamespeed_fps),3)
	                energy-=drain/weapon_efficiency[0];
	                weapon_ready[0]=0;
	                weapon_alarm[0]=0;
	                //weapon kick
	                motion_add(image_angle+180,.1)
	            }
	        }
	    }
	}

	//if bullets fired by the player are getting close, take evasive action
	var dodge_bullet = collision_circle(x,y,200,p_bullet,false,false);
	if (dodge_bullet!=noone)
	{
	    var dir,len;
	    dir=dodge_bullet.direction;
	    len=point_distance(x,y,dodge_bullet.x,dodge_bullet.y);
	    motion_add(dir,len*screen.sec/8)
	}

	//avoid asteroids
	if (collision_circle(x,y,500,p_space_matter,false,false)==noone)
	{
	    antigravity=1;
	}
	else
	{
	    antigravity=-10;
	}



}

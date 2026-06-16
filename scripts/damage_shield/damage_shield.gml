/// @description damage_shield(shield instance id, damage percent)
/// @param shield instance id
/// @param  damage percent
function damage_shield(shield, damage) {
	with shield
	{
	    shields_up=1;
		    //calculate which section of the shield has been hit.
	    damage_dir=point_direction(x,y,other.x,other.y);
	    var i=angle_difference(damage_dir,image_angle+rot_offset);
	    if i<0
	    {
	        i+=360;
	    }
	    //the section numbers start at zero, so we round down.
	    i=floor(i*sections/360);
	    //absorb damage from the outer layer first and work inward
	    for (var j=layers-1;j>=0;j-=1)
	    {
	        if (section_energy[i,j]>damage)
	        {
	            section_energy[i,j]-=damage;
	            exit
	        }
	        else
	        {
	            damage-=section_energy[i,j];
	            section_energy[i,j]=0;
	        }
	    }
	}



}

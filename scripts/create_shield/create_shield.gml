/// @description create_shield(x offset,y offset,rotation offset,layers,sections,inner radius,radius change,spacing,texture,regen rate,color,update_speed)
/// @param x offset
/// @param y offset
/// @param rotation offset
/// @param layers
/// @param sections
/// @param inner radius
/// @param radius change
/// @param spacing
/// @param texture
/// @param regen rate
/// @param color
/// @param update_speed
function create_shield(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {
	//By Ground Effect Games
	//
	var shield=instance_create(x+argument0,y+argument1,o_shield)
	with shield
	{
	    parent_id=other.id;
	    //positioning
	    xoffset=argument0;
	    yoffset=argument1;
	    offset=point_distance(0,0,xoffset,yoffset);
	    offset_angle=point_direction(0,0,xoffset,yoffset);
	    //shield properties
	    rot_offset=argument2;
	    layers=argument3;
	    sections=argument4;
	    inner_radius=argument5;
	    thickness=argument6;
	    spacing=argument7;
	    texture1=argument8;
	    regen=argument9;
	    color=argument10;
	    image_blend=color;
	    update_speed=argument11;
	    mask_index=other.sprite_index;
    
	    //for example, if there are 4 sections, each section is 90 degrees.
	    section_degrees=360/sections;
	    outer_radius=inner_radius+(thickness+spacing)*layers;
	    shields_up=0;
	    damage_dir=0;
    
	    var len,i,j;
	    for (j=0;j<layers;j+=1)
	    {
	        len=inner_radius+(thickness+spacing)*j;
	        path[j]=path_add();
	        path1[j]=path_add();
	        path2[j]=path_add();
	        for (i=0;i<sections;i+=1)
	        {
	            section_energy[i,j]=0;//ranges between 1 and 0
	        }
	    }
    
	    texture=surface_get_texture(application_surface);
	    ready=0;
	    alarm[0]=update_speed;
	    alarm[1]=(update_speed/3)+random(update_speed);
	    weighting=0;
	}
	return shield;



}

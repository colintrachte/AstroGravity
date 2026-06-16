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
function create_shield(x, y, rotation, layers, sections, inner, radius, spacing, texture, regen, color, update_speed) {
	//By Ground Effect Games
	//
	var shield=instance_create(x+x,y+y,o_shield)
	with shield
	{
	    parent_id=other.id;
	    //positioning
	    xoffset=x;
	    yoffset=y;
	    offset=point_distance(0,0,xoffset,yoffset);
	    offset_angle=point_direction(0,0,xoffset,yoffset);
	    //shield properties
	    rot_offset=rotation;
	    layers=layers;
	    sections=sections;
	    inner_radius=inner;
	    thickness=radius;
	    spacing=spacing;
	    texture1=texture;
	    regen=regen;
	    color=color;
	    image_blend=color;
	    update_speed=update_speed;
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
    
	    if (surface_exists(application_surface)) texture=surface_get_texture(application_surface);
	    ready=0;
	    alarm[0]=update_speed;
	    alarm[1]=(update_speed/3)+random(update_speed);
	    weighting=0;
	}
	return shield;



}

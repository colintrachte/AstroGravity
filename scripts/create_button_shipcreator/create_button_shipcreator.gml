/// @description create_button_shipcreator(x,y,radius,color,action #,label,tutorial)
/// @param x
/// @param y
/// @param radius
/// @param color
/// @param action #
/// @param label
/// @param tutorial
function create_button_shipcreator(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	button=instance_create(argument0,argument1,b_ship_creator);
	with button
	{
	    parent_id=other.id;
	    radius=argument2;
	    image_scale(radius/16)
	    image_blend=argument3;
	    action=argument4;
	    label=argument5;
	    selected=0;
	    tutorial=argument6;
	    event[0]=ev_user0;
	    event[1]=ev_user1;
	    event[2]=ev_user2;
	    event[3]=ev_user3;
	    event[4]=ev_user4;
	    event[5]=ev_user5;
	}
	return button;



}

/// @description create_button_shipcreator(x,y,radius,color,action #,label,tutorial)
/// @param x
/// @param y
/// @param radius
/// @param color
/// @param action #
/// @param label
/// @param tutorial
function create_button_shipcreator(x, y, radius, color, action, label, tutorial) {
	button=instance_create(x,y,b_ship_creator);
	with button
	{
	    parent_id=other.id;
	    radius=radius;
	    image_scale(radius/16)
	    image_blend=color;
	    action=action;
	    label=label;
	    selected=0;
	    tutorial=tutorial;
	    event[0]=ev_user0;
	    event[1]=ev_user1;
	    event[2]=ev_user2;
	    event[3]=ev_user3;
	    event[4]=ev_user4;
	    event[5]=ev_user5;
	}
	return button;



}

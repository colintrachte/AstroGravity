/// @description create_ship_point(x,y,radius,material,color)
/// @param x
/// @param y
/// @param radius
/// @param material
/// @param color
function create_ship_point(x, y, radius, material, color) {
	var object=instance_create(x,y,o_ship_point);
	with object
	{
	    parent_id=other.id;
	    radius=radius;
	    material=material;
	    image_blend=color;
	    image_scale(radius/16)
	    friction=.5;
	    dragdrop=1;
	    index=-1;    
	    x1=x;
	    y1=y;
	    x2=device_mouse_x(0);
	    y2=device_mouse_y(0);
	    //vectors for drawing
	    dx=x-o_ship_creator.x;
	    dy=y-o_ship_creator.y;
	    len=0;
	    dir=0;
	    movable=1;
	    margin=o_ship_creator.margin[1]*2.2;
	}
	return object;



}

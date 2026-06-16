/// @description draw_text_blur(x,y,str,distance,angle,quantity)
/// @param x
/// @param y
/// @param str
/// @param distance
/// @param angle
/// @param quantity
function draw_text_blur(x, y, str, distance, angle, quantity) {
	//fragment blur for text
	var q,dir;
	q=360/quantity;
	for(dir=angle-360; dir<0; dir+=q)
	{
	    draw_text(x+lengthdir_x(distance,dir),y+lengthdir_y(distance,dir),string_hash_to_newline(str));
	}



}

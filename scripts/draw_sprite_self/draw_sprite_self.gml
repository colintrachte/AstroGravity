/// @description draw_sprite_self(sprite)
/// @param sprite
function draw_sprite_self(sprite) {
	//draws the given sprite using the same properties as the sprite_index of the object
	draw_sprite_ext(sprite,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);



}

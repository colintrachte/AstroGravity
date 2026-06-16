/// @description create_effect_cloak(alpha mask sprite)
/// @param alpha mask sprite
function create_effect_cloak(alpha) {
	//Intended to be used with draw_, draw_begin_, and destroy_effect cloak scripts.
	//important to use a duplicate of the mask in order for the cloak to work.
	cloak_mask=sprite_duplicate(alpha);
	cloak_distortion=0;
	delete_sprite_after_this=0;
	x1=sprite_get_xoffset(alpha);
	y1=sprite_get_yoffset(alpha);
	w=sprite_get_width(alpha);
	h=sprite_get_height(alpha);



}

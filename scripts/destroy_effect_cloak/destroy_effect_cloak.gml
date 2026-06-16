/// @description destroy_effect_cloak()
function destroy_effect_cloak() {
	//prevent graphics memory overload
	//Intended to be used with create_, draw_begin_, and draw_ cloak scripts.
	sprite_delete(cloak_mask)
	if (delete_sprite_after_this)
	{
	    sprite_delete(temp_sprite)
	    delete_sprite_after_this = 0;
	}
}

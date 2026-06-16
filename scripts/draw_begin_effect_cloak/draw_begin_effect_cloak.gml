/// @description draw_begin_effect_cloak()
function draw_begin_effect_cloak() {
	//prevent graphics memory overload
	//Intended to be used with create_, draw_, and destroy_effect cloak scripts.
	if delete_sprite_after_this
	{
	    sprite_delete(temp_sprite)
	    delete_sprite_after_this=0;
	}



}

/// @description ship_set_type(type)
/// @param type
function ship_set_type(type) {
	switch type
	{
	    case 0: {sprite_index=sp_ship_alpha; create_effect_cloak(sp_ship_alpha_cloak);} break;
	    case 1: {sprite_index=sp_ship_beta; create_effect_cloak(sp_ship_beta_cloak);} break;
	    case 2:  {sprite_index=sp_ship_delta; create_effect_cloak(sp_ship_delta_cloak);} break;
	    default:    {sprite_index=sp_ship_delta; create_effect_cloak(sp_ship_delta_cloak);} break;
	}
	object_set_material(1,1,1)



}

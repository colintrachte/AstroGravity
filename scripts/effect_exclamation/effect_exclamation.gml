/// @description effect_exclamation(x,y,string,scale,scale increase,spin)
/// @param x
/// @param y
/// @param string
/// @param scale
/// @param scale increase
/// @param spin
function effect_exclamation(x, y, string, scale, scale_4, spin) {
	with instance_create(x,y,o_exclamation)
	{
	    s=string;
	    scale=scale;
	    scale_rate=scale_4;
	    spin=spin;
	}



}

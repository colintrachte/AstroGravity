/// @description effect_exclamation(x,y,string,scale,scale increase,spin)
/// @param x
/// @param y
/// @param string
/// @param scale
/// @param scale increase
/// @param spin
function effect_exclamation(argument0, argument1, argument2, argument3, argument4, argument5) {
	with instance_create(argument0,argument1,o_exclamation)
	{
	    s=argument2;
	    scale=argument3;
	    scale_rate=argument4;
	    spin=argument5;
	}



}

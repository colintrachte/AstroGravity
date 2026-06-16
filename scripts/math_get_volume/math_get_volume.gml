/// @description math_get_volume(length,width,shape)
/// @param length
/// @param width
/// @param shape
function math_get_volume(length, width, shape) {
	//calculates the area when given the dimensions and shape of a sprite
	switch shape
	{
	    //cube
	    case 0: {return power(math_magnitude(length,width),3)}
	    //sphere
	    case 1: {return 4*pi*power(math_magnitude(length,width),3)/3}
	}



}

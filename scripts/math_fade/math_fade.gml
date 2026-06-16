/// @description math_fade(input,max input,value)
/// @param input
/// @param max input
/// @param value
function math_fade(input, max, value) {
	//fades between 0 and value depending on the value of input vs max input.
	//if input is (max input)/2, value is returned.
	//if input=0 or input=max input, 0 is returned.
	return (input/max)*(1-(input/max))*2*value;



}

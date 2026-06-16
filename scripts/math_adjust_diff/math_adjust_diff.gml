/// @description math_adjust_diff(current value, target value, adjustment percent)
/// @param current value
/// @param  target value
/// @param  adjustment percent
function math_adjust_diff(current, target, adjustment) {
	//adjusts a given value by some percent of the difference, and returns the result.
	//when used in the step event, this formula causes a differential rate of change.
	//if you are using this script more than once per step,
	//use the grid version instead for a performance increase.

	difference = target-current;
	if (abs(difference) > 0.01)
	{
	   return current+difference*adjustment;
	}
	else 
	{
	   return current;
	}



}

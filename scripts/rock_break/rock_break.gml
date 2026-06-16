/// @description rock_break(number,radius,variance,speed,direction,spin)
/// @param number
/// @param radius
/// @param variance
/// @param speed
/// @param direction
/// @param spin
function rock_break(number, radius, variance, speed, direction, spin) {
	//By Ground Effect Games
	//variance is a very important variable.
	//it is the percentage by which all the other variables are randomized.

	//formula for splitting a circle's area between n smaller spheres. used to determine size and distance
	var r = sqrt(sqr(radius)/number);
	var placeholder = speed;
	//prevents any asteroids smaller than 12 pixels in diameter
	if (r-(r*variance)>6)
	{
	    repeat(number)
	    {
	        create_space_matter(random_decrease(r,variance),variance,spin,radius,direction)
	    }
	}



}

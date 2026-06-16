/// @description random_squared(max value)
/// @param max value
function random_squared(max) {
	/*
	returns a real number between 1% and 100% of a max value,
	where smaller values are the most likely

	This is the key probability formula for:
	- how many arms the galaxy has
	- how many planets are in a solar system
	- what size star/planet/moon is most common
	*/
	return max*(.01+sqr(random(.994)));



}

/// @description random_normal(value)
/// @param value
function random_normal(value) {
	//normal (aka gaussian, aka bell curve) probability distribution.
	//adapted for use with Game Maker by Ground Effect Games.
	//Half of the input value is the most likely result,
	//but anything between 0 and the input value is possible.
	return value*exp(-sqr(random(4)-2))/(.4*sqrt(6.26))



}

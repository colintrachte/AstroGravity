/// @description math_photon_energy(color)//calculates the energy of a photon (ranging between 1/2 and 2/7)
/// @param color
function math_photon_energy(color) {
	//E=(plank's constant)*(speed of light)/wavelength ~=2*10^-19/um
	//a computer display's color range is roughly .4-.7 um
	//For our purposes, we multiply by 10^19 to get Joules
	return (2/(4+(3*color_get_hue(color)/212.5)));



}

/// @description random_halton(seed,prime number,max value)
/// @param seed
/// @param prime number
/// @param max value
function random_halton(seed, prime, max) {
	//Game Maker version by Ground Effect Games
	//Produces random numbers between 0 and max value that are not too close to each other
	//This is a quasirandom function, which means it appears random but isn't.
	//That means you can grow things the same way twice from a "seed" number combo
	//like minecraft maps, trees, star spacing, and other natural-looking things.
	//larger prime numbers produce tighter spacing.
	//for more info, read up about the halton sequence.
	var result,f,i;
	result=0;
	f = 1/prime;
	i = seed+20;
	while (i > 0)
	{
	    result += f*(i mod prime);
	    i = floor(i/prime);
	    f = f/prime;
	}
	return result*max;



}

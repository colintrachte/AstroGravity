function galaxy_check_clear() {
	//Ported from Astro Ninja Legacy level/galaxy system.
	//Clears the galaxy when all enemy-bearing stars are defeated.
	n=instance_number(o_star);
	if n<5
	{
	    //TODO: trunk has no o_gameover object yet. Wire up a game-over screen here.
	    //create(o_gameover)
	}
	else
	{
	    with o_star
	    {
	        if (level_enemies==0)
	        {
	            other.n-=1;
	        }
	    }

	    if !n
	    {
	        room_goto_next()
	    }
	}


}

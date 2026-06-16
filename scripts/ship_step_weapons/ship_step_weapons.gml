function ship_step_weapons() {
	//weapon recoil time
	if (weapon_alarm[0]>=weapon_recoil[0])
	{
	    weapon_ready[0]=1;
	}
	else
	{
	    weapon_alarm[0]+=screen.sec;
	}



}

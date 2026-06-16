function ship_set_physics() {
	max_gravity=5;
	antigravity=1;//normal polarity of gravity affecting the ship
	//engine Stats
	max_speed=50;
	max_spin=6;
	force=0;//force is a dependent variable driven by mass and acceleration
	ke=0;//Kinetic energy (ke=.5*mv^2) used for speed-based abilities like ramming.
	mass=2;
	accel=10;//increase speed by 10 pixels per second, every second
	max_accel=20;
	throttle=1;//what percent of maximum acceleration to run at
	engine_efficiency=.8;//allows room for augmenting current engine instead of replacing it
	ready_to_jump=0;
	//reactor stats
	energy=1000;//energy = your fuel. when empty, you have to get out and push.
	energy_boost=0;
	max_energy=1000;//max energy is the max limit
	percent_energy=energy/max_energy;
	color=make_color_hsv(percent_energy*212.5,255,255);//give the user a visual indicator of how much energy they have.
	recharge_rate=10;//10 units of energy per second
	reactor_efficiency=.8;//allows room for augmenting current reactor instead of replacing it



}

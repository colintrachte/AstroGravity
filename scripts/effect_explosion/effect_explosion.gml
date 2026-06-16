/// @description effect_explosion(x,y,radius,particle quantity)
/// @param x
/// @param y
/// @param radius
/// @param particle quantity
function effect_explosion(x, y, radius, particle) {
	//By Ground Effect Games
	var r,theta,system;

	repeat (particle)
	{
	    theta=random(2*pi);
	    r=random(radius);
	    system=fx.above;
	    part_type_size(fx.flash,.01+r/10,.02+r/10,.01,0);
	    part_particles_create(system,x+r*cos(theta),y+r*sin(theta),fx.flash,1)
	    repeat (2)
	    {
	        theta=random(2*pi);
	        r=random(radius);
	        system=choose(fx.above,fx.below,fx.middle);
	        part_particles_create(system,x+r*cos(theta),y+r*sin(theta),fx.fire,1)
	    }
	}

	repeat (5+sqr(1+particle/2))
	{
	    theta=random(2*pi);
	    r=random(radius);
	    system=choose(fx.above,fx.below,fx.middle);
	    part_particles_create(system,x+r*cos(theta),y+r*sin(theta),fx.fire_s,1)
	    theta=random(2*pi);
	    r=random(radius);
	    system=choose(fx.above,fx.below,fx.middle);
	    part_particles_create(system,x+r*cos(theta),y+r*sin(theta),fx.fire_l,1)
	}



}

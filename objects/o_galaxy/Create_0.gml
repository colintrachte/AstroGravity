/// @description spawns a galaxy
var i,r,delta,delta2,stars;
arms=2+round(random_squared(5));
star_count=math_magnitude(screen.width,screen.height)/(50+tolerance(3));
stars=0;
two_pi=2*pi;
radius=100000;
diameter=radius*2;
star_spacing=radius/6;//7 is roughly equal to exp(2). this ensures all stars are created within the radius of the galaxy.
spin=choose(1,-1)/sqrt(radius);
spin_dir=-sign(spin);
lucky_number=choose(3,5,7);

delta=1.9*arms/star_count;
delta2=two_pi/arms;

//change the angle from center
for (theta=.1; theta<=2; theta+=delta;)
{
    //place one star in each arm
    for (i=0; i<two_pi; i+=delta2)
    {
        r=random_halton(theta,lucky_number,star_spacing);
        if (stars<star_count)
        {
            create_space_matter(random_increase(global.min_star_radius,random_squared(2)),.1,choose(1,-1)*random_increase(5,12),r*exp(theta),spin_dir*(theta+i)*180/pi)
            stars+=1;
        }
    }
}

//this code adjusts the placement of stars so they are not too close to each other.
//it also has a randomizing effect.
with o_star
{
    for (i=.5;i>0;i-=.1)
    {
        math_disperse(o_star,i,system_radius*8)
    }
    orbit_radius=point_distance(other.x,other.y,x,y);
    orbit_angle=point_direction(other.x,other.y,x,y);
}


dist*=.998;
dir=point_direction(x,y,planet_id.x,planet_id.y);
dx=lengthdir_x(length,dir);
dy=lengthdir_y(length,dir);
math_orbit(planet_id.x,planet_id.y,dist,dir)
if dist<planet_id.radius*.7 instance_destroy()


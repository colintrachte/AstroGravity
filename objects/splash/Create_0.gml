/// @description this controller displays a brief image for 2 seconds while loading things
alarm0=2;
create(camera)
create_space_matter(random_increase(global.min_star_radius,random_squared(2)),.1,choose(1,-1)*random_increase(5,12),0,0)


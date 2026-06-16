hp=median(0,1,(x-200)/(room_width-400));
image_angle+=spin;
//path_random_circle(path[0],x,y,80,100,0,15,1,1);
weighting=((current_time/(200)) mod 2) -1;
path_interpolate(path[2],path[3],segments,weighting,path[0])


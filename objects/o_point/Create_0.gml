image_blend=c_aqua;
radius=64;
image_scale(radius*2/sprite_width)
friction=.15;
speed=random(12);
direction=random(360);

//intermittent step
update_speed=10;
alarm[0]=update_speed;
len=0;
dir=0;

//lifespan
alarm[1]=600+random(600);

weighting=0;
width=random_decrease(radius,.5);
seglength=width*2;
for (var i=0;i<2;i+=1)
{
    path[i]=path_add();
    path_set_kind(path[i],1);
    path_set_closed(path[i],0);
}


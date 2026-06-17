ship_set_physics()
throttle=.4;//what percent of maximum acceleration to run at
max_spin=12;
ship_set_weapon(0,0,.2,.1)
ship_set_ai()
image_scale(2);

image_blend=merge_color(c_white,random_color(),.3);
texture=background_get_texture(tx_whitenoise);
up=0;
pcnt=1;
step=0;

maxspeed=36;
image_scale(0.25+random(.1)*720/screen.height);
hp=100;
speed=5;
direction=random(360);
gravity_direction=270;
image_speed=0;
time=0;
combo=0;
width=0;
height=0;
player=0;
not_portaled_recently=1;

path=path_add();
path_set_closed(path,false)
path_add_point(path,x,y,1)
seg[0]=id;
for (i=1;i<8;i+=1)
{
    seg[i]=instance_create(x,y,o_worm_seg);
    path_add_point(path,x,y,1)
    with seg[i]
    {
        _id=other.i;
        worm=other.id;
    }
}

//intermittent step
update_speed=8;
alarm[0]=update_speed;


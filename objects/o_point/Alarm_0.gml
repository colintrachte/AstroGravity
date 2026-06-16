/// @description intermittent step
len=random(radius*4);
dir=random(360);
path_random(x,y,x+lengthdir_x(len,dir),y+lengthdir_y(len,dir),path[0],seglength,60,fx.curl)
if image_alpha<1
{
    image_alpha*=sqrt(image_alpha);
}
if (image_alpha<.01)
{
    instance_destroy()
}
math_astrogravity(o_point,screen.sec*update_speed,1000)
math_astrogravity(o_ship,screen.sec*update_speed,1000)
alarm[0]=random_decrease(update_speed,.5);


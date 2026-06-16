draw_circle(x,y,radius,1)
if branches
{
    for (var i=0;i<360;i+=360/branches)
    {
        draw_circle(x+lengthdir_x(radius,image_angle+i),y+lengthdir_y(radius,image_angle+i),radius/3,0)
    }
}


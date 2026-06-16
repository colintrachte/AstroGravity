if material<3
{
    draw_star_small(x,y,radius+dt*16,image_blend,image_alpha)
}

if dragdrop
{
    var len,dir;
    len=16+random(32);
    dir=random(360);
    draw_lightning_small(x,y,x+lengthdir_x(len,dir),y+lengthdir_y(len,dir),12,merge_color(c_white,image_blend,.5),30,0)
}


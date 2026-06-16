//this alarm substitutes for the step event when activated
//this way, not all the code has to run constantly
if (activated)
{
    math_adjust_grid_step(holygrid,0,6)
    x=ds_grid_get(holygrid,0,0);//x position
    y=ds_grid_get(holygrid,0,1);//y position
    w=ds_grid_get(holygrid,0,2);//current width/2
    h=ds_grid_get(holygrid,0,3);//current height/2
    q=ds_grid_get(holygrid,0,6);//current loading bar percent
    if mouse_over(x1,y1,x2,y2)
    {
        image_alpha=1;
        alpha=1;
        if mouse_check_button(mb_left)
        {activated=0;}
    }
    else
    {
        image_alpha=ds_grid_get(holygrid,0,4);//sprite alpha
        alpha=ds_grid_get(holygrid,0,5);//button alpha
        if mouse_check_button(mb_left) && choose(1,0)
        {
            ds_grid_set(holygrid,1,0,mouse_x);//x target position
            ds_grid_set(holygrid,1,1,mouse_y);//y target position
        }
    }
    x1=x-w; y1=y-h;//top right corner
    x2=x+w; y2=y+h;//bottom left corner
    color=make_color_hsv(q*64,255*activated,255);
    image_blend=color;
    alarm[0]=updatespeed;
}
else
{
    alarm[1]=updatespeed;
}


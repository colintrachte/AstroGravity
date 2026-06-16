//this alarm substitutes for the step event when deactivated
//this way, not all the code has to run constantly
if activated
{
    alarm[0]=updatespeed;
}
else
{
    activated=(mouse_over(x1,y1,x2,y2) && mouse_check_button(mb_left))
    alarm[1]=updatespeed;
}


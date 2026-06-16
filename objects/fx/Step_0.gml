if clouds
{
    alarm0+=screen.sec;
    if (alarm0>=30)//alarm goes off every 30 seconds
    {
        instance_create(random(room_width),random(room_height),o_cloud)
        alarm0=0;
    }
}

//wind
if (wind)
{
    windscale=windspeed/windmax; //ranges from 1 to -1

    if (abs(targetwind-windspeed)>.01)
    {
        windspeed+=(targetwind-windspeed)*screen.sec;
    }
    else
    {
        targetwind=tolerance(windmax);
    }
}


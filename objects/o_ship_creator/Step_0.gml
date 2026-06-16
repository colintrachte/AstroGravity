if page && animate
{
    t=median(0,2*pi,t+.05);
    if t==2*pi
    {
        t=0;
    }
    weighting=.5*(1+sin(t));
}
else
{
    weighting=1;
    t=pi*.5;
}


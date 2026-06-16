click=0;
yy=y;
lx=x;
minlimit=0;
maxlimit=255;
maxtotal=maxlimit-minlimit;
defaultvalue=128;
s=minlimit;
targets=defaultvalue;
image_alpha=.8;
ly=yy+minlimit;
for (var i=0;i<4;i+=1)
{
    w[i]=power(2,i+3)*o_ship_creator.scale;
}

image_blend=make_color_hsv(targets,255,255);


points_list=ds_list_create();
ship_grid=ds_grid_create(7,0);

x=__view_get( e__VW.WPort, 0 )/2;
y=__view_get( e__VW.HPort, 0 )/2;
y1=y;
y2=y;

image_angle=90;

page=0;
material=0;
weighting=1;
connector=0;
animate=0;

//materials
m[0]=2;//spirit
m[1]=5;//biomass
m[2]=5;//metal

header_left="draw on this side"
header_right="mirror image"
footer_left=""
footer_right=""

c[0]=c_aqua;
c[1]=c_lime;
c[2]=c_yellow;
c[3]=c_white;
c[4]=c_white;
c[5]=c_white;

label[0]="spirit";
label[1]="biomass";
label[2]="metal";
label[3]="connect";
label[4]="next";
label[5]="back";

tooltip[0]="drag/drop to enable movement"
tooltip[1]="drag/drop at least 3 points"
tooltip[2]="drag/drop at least 3 points"
tooltip[3]="select to connect the dots"

tutorial_active=0;

//save margin presets
scale=__view_get( e__VW.HPort, 0 )/600;
margin[0]=21*scale;
margin[1]=margin[0]*2;
margin[2]=margin[1]*2;
margin[3]=margin[1]*6;
margin[4]=margin[0]*.5;

//left sidebar
b[0]=create_button_shipcreator(margin[1],margin[2],margin[0],c[0],0,label[0],tooltip[0]);
b[0].visible=0;

for (i=1;i<4;i+=1)
{
    b[i]=create_button_shipcreator(margin[1],margin[2]*i,margin[0],c[i],i,label[i],tooltip[i]);
}

//right sidebar
create_button_shipcreator(__view_get( e__VW.WPort, 0 )-margin[1],margin[3],margin[0],c[4],4,label[4],"")
create_button_shipcreator(__view_get( e__VW.WPort, 0 )-margin[1],margin[2],margin[0],c[5],5,label[5],"")


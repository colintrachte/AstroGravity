alarm[0]=1;
friction=.01;
width=200;
recoil=0;
if (surface_exists(application_surface)) texture=surface_get_texture(application_surface);
segments=width/5;
c1=random_color();
c2=random_color();
image_blend=c1;


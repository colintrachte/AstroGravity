var len,j;
for (j=0;j<layers;j+=1)
{
    len=(inner_radius+(thickness+spacing)*j)/camera.zoom;
    path_random_circle(path1[j],0,0,len-thickness,len,image_angle+rot_offset,len,1,1);
    path_random_circle(path2[j],0,0,len-thickness,len,image_angle+rot_offset,len,1,1);
}
alarm[1]=(update_speed/3)+random(update_speed);


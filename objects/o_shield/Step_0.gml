if instance_exists(parent_id)
{
    image_angle=parent_id.image_angle;
    glue_to(parent_id,offset,image_angle+offset_angle)
    weighting=((current_time/(200)) mod 2) -1;
    
    var len,j;
    if shields_up
    {
        shields_up*=.9;
        for (j=0;j<layers;j+=1)
        {
            len=(inner_radius+(thickness+spacing)*j)/camera.zoom;
            path_interpolate(path1[j],path2[j],len,weighting,path[j])
        }
    }
    else
    {
        for (j=0;j<layers;j+=1)
        {
            len=(inner_radius+(thickness+spacing)*j)/camera.zoom;
            path_random_circle(path[j],0,0,len-thickness,len,image_angle+rot_offset,len,1,1);
            for (var i=0;i<sections;i+=1)
            {
                if (section_energy[i,j]<1)
                {
                    section_energy[i,j]+=regen;
                }
                else
                {
                    section_energy[i,j]=1;
                }
            }
        }
    }
}
else
{
    instance_destroy()
}


path_delete(path)
if in_view && camera.zoom<20
{
    create_shockwave(x,y,radius,radius*10,1,.2,0,spin,random_color(),image_blend,random_color(),1)
    effect_explosion(x,y,radius,1+radius*.1)
    var n=2+random(10);
    var r=sqrt(sqr(radius)/n);
    if r>8
    {
        repeat n
        {
            if choose(1,0)
            {
                create_space_matter(r,.2+random_squared(.5),tolerance(30),3*radius,random(360))
            }
            else
            {
                create(o_point)
            }
        }
    }
    else
    {
        create(o_point)
    }
}


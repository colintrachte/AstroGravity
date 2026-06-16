//create_shockwave(x,y,radius,radius*5,2,.2,45,45,random_color(),image_blend,random_color(),1)
switch image_blend
{
    case c_red: {global.metallic_points+=1;} break;
    case c_lime: {global.organic_points+=1;} break;
    case c_aqua: {global.ectenic_points+=1;} break;
}
other.energy_boost+=100;
instance_destroy()


/// @description intermittent step code
//This code does not need to run every single step
visible=(camera.zoom<radius);
if visible
{
    segments=radius/(camera.zoom+1);
    if orphan
    {
        math_astrogravity(p_space_matter,screen.sec*.03*update_speed,2000)
    }
}
alarm[4]=random_decrease(update_speed,.8);


/// @description cancel button
selected=!selected;
//destroy the layers in order from newest to oldest:
//paint job
//animation
//points placement
//ship name
if (parent_id.page)
{
    ship_creator_prev()
}
else
{
    if ds_list_empty(parent_id.points_list)
    {
        if instance_exists(o_ship_point)
        {
            with o_ship_point
            {
                instance_destroy()
            }
        }
        else
        {
            //go to the previous screen
        }
    }
    else
    {
        with parent_id
        {
            ds_list_destroy(points_list)
            points_list=ds_list_create();
        }
        with o_ship_point
        {
            index=-1;
        }
    }
}


/// @description next button
with parent_id
{
    switch page
    {
        case 0:
        {
            var size=ds_list_size(points_list);
            if size>2
            {
                //create a grid of the right size to hold a list of the ship's points
                ship_grid=ds_grid_create(7,size);
                //import the list into the grid
                ship_list_import_1(points_list,ship_grid)
                ship_list_import_2(points_list,ship_grid)
                //change the ship creator to the next editing mode
                ship_creator_next()
                with o_ship_point
                {
                    if index<0
                    {
                        instance_destroy()
                    }
                }
            }
        }
        break;
        case 1:
        {
            //change the ship creator to the next editing mode
            ship_creator_next()
        }
        break;
    }
}


/// @description ship_creator_next()
function ship_creator_next() {
	//switches to the next GUI page
	with o_ship_creator
	{
	    switch page
	    {
	        //switch from "place and connect points" to "animate and paint"
	        case 0:
	        {
	            b[0].visible=1;
	            b[1].visible=0;
	            b[2].visible=0;
	            b[3].visible=0;
	            b[3].selected=0;
	            ship_list_import_1(points_list,ship_grid)
	            //center the drawing
	            ds_grid_add_column(ship_grid,1,-math_centroid_grid(ship_grid,1))
	            ds_grid_add_column(ship_grid,3,-math_centroid_grid(ship_grid,1))
	            ship_list_recall_1(points_list,ship_grid)
            
	            connector=0;
	            instance_create(margin[1],margin[1]*4,o_ship_colorslider)
	            header_left="drag/drop spirit points to enable movement";
	            footer_left="touch points to color them";
	            with o_ship_point
	            {
	                movable=0;
	            }
	        }
	        break;
	        //switch from animate and paint to start the game
	        case 1:
	        {
	            ship_grid_save()
	            with p_ship_creator
	            instance_destroy()
	            create(o_ship)
	        }
	        break;
	    }
	    page+=1;
	}



}

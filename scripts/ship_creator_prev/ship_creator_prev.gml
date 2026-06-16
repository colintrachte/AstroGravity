/// @description ship_creator_prev()
function ship_creator_prev() {
	//switches to the next GUI page
	with o_ship_creator
	{
	    switch page
	    {
	        //switch from "animate and paint" to "place and connect points"
	        case 1:
	        {
	            b[0].visible=0;
	            b[1].visible=1;
	            b[2].visible=1;
	            b[3].visible=1;
	            with o_ship_colorslider
	            {
	                instance_destroy()
	            }
	            header_left="draw on this side";
	            with o_ship_point
	            {
	                movable=1;
	            }
	            //change the points back to their original positions and colors
	            ship_list_recall_1(points_list,ship_grid)
	            ship_list_import_1(points_list,ship_grid)
	        }
	        break;
	    }
	    page-=1;
	}



}

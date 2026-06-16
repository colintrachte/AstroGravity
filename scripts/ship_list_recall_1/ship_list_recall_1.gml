/// @description ship_list_recall_1(list id,grid id)
/// @param list id
/// @param grid id
function ship_list_recall_1(list, grid) {
	//moves the points on the list back to their original positions and colors

	var grid_height,point;
	grid_height=ds_list_size(list);

	for (var i=0;i<grid_height;i+=1)
	{
	    point=ds_list_find_value(list,i);
	    point.x=o_ship_creator.x+ds_grid_get(grid,0,i);
	    point.y=o_ship_creator.y+ds_grid_get(grid,1,i);
	    point.image_blend=ds_grid_get(grid,4,i)
	    with point
	    {
	        event_perform(ev_other,ev_user0)
	    }
	}



}

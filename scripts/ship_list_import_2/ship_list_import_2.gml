/// @description ship_list_import_2(ds_list,ds_grid)
/// @param ds_list
/// @param ds_grid
function ship_list_import_2(ds_list, ds_grid) {
	//reads the ds_list of dragdrop objects from o_ship_creator,
	//then imports relevant values to a grid

	var grid_height,point;
	grid_height=ds_list_size(ds_list);

	for (var i=0;i<grid_height;i+=1)
	{
	    point=ds_list_find_value(ds_list,i);
	    ship_add_point_2(ds_grid,i,point.dx-ds_grid_get(ds_grid,0,i),point.dy-ds_grid_get(ds_grid,1,i),point.image_blend)    
	}



}

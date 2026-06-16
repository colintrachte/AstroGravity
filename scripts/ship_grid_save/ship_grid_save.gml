/// @description ship_grid_save()
function ship_grid_save() {
	with external
	{
	    ds_grid_destroy(ship_grid[ship_index])
	    ship_grid[ship_index]=ds_grid_create(ds_grid_width(other.ship_grid), ds_grid_height(other.ship_grid));
	    ds_grid_copy(ship_grid[ship_index],other.ship_grid)
	}



}

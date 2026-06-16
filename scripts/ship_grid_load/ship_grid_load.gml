/// @description ship_grid_load()
function ship_grid_load() {
	var external_grid=external.ship_grid[external.ship_index];
	ship_grid=ds_grid_create(ds_grid_width(external_grid), ds_grid_height(external_grid));
	ds_grid_copy(ship_grid,external_grid)



}

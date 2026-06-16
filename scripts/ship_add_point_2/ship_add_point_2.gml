/// @description ship_add_point_2(ds_grid id,grid row #,delta x,delta y,color)
/// @param ds_grid id
/// @param grid row #
/// @param delta x
/// @param delta y
/// @param color
function ship_add_point_2(ds_grid, grid, delta, delta_3, color) {
	//specify how far the points will move and what color they will change to
	ds_grid_set(ds_grid,2,grid,delta)//x
	ds_grid_set(ds_grid,3,grid,delta_3)//y
	ds_grid_set(ds_grid,5,grid,color)//color



}

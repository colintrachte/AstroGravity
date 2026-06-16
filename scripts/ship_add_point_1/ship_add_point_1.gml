/// @description ship_add_point_1(ds_grid id,grid row #,x,y,color,type)
/// @param ds_grid id
/// @param grid row #
/// @param x
/// @param y
/// @param color
/// @param type
function ship_add_point_1(ds_grid, grid, x, y, color, type) {
	//points on a ship are either metal (1) or organic (0) type, and can be painted any color.
	//each point can move between two positions and change color

	//add the new entry
	ds_grid_set(ds_grid,0,grid,x)//x
	ds_grid_set(ds_grid,1,grid,y)//y
	ds_grid_set(ds_grid,4,grid,color)//color
	ds_grid_set(ds_grid,6,grid,type)//type



}

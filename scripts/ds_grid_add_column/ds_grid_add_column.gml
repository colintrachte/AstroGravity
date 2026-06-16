/// @description ds_grid_add_column(grid id, column #,value)
/// @param grid id
/// @param  column #
/// @param value
function ds_grid_add_column(grid, column, value) {
	//by Ground Effect Games
	//adds a given value to every cell in a column of a grid
	ds_grid_add_region(grid,column,0,column,ds_grid_height(grid)-1,value)



}

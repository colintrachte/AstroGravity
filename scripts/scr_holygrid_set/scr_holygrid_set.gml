/// @description scr_holygrid_set(grid id,row index,value,targetvalue,rate,islinear,threshold,endaction)
/// @param grid id
/// @param row index
/// @param value
/// @param targetvalue
/// @param rate
/// @param islinear
/// @param threshold
/// @param endaction
function scr_holygrid_set(grid, row, value, targetvalue, rate, islinear, threshold, endaction) {
	//This script makes it simpler to set initial values for a holy equation
	ds_grid_set(grid,0,row,value);//value
	ds_grid_set(grid,1,row,targetvalue);//targetvalue
	ds_grid_set(grid,2,row,rate);//rate
	ds_grid_set(grid,3,row,islinear);//islinear
	ds_grid_set(grid,4,row,threshold);//threshold
	ds_grid_set(grid,5,row,endaction);//endaction



}

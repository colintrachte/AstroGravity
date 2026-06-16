/// @description scr_holyfinished(grid,row)
/// @param grid
/// @param row
function scr_holyfinished(grid, row) {
	//This script defines what happens when an equation in the a grid has finished running.
	//You may set the endactions in column 6 of the grid.
	switch ds_grid_get(grid,5,row)
	{   
	    //One common choice is to set the current value equal to the target value
	    case 0:{ds_grid_set(grid,0,row,ds_grid_get(grid,1,row))}break;
	}



}

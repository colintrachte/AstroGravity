/// @description this object handles data importing and exporting
if (os_type==os_windows || os_type==os_win8)
{
    load_grid_elements(5,101,working_directory + "\\periodic_table.csv")
    //the last two columns for this grid are numbers, so we convert them from string to real.
    //we skip row 0 because that is where the labels are.
    //remember grids start at zero, so a grid with five columns uses indices 0,1,2,3,4
    //grid_convert(grid_elements,true,1,3,100,4)
	//in GMS 2, grid convert does not work. It is looking at the wrong columns for some reason.
}

//initialize the ship loading and saving system
//ship_index is the in-game ID of the ship model.
//ship_grid is where the ship's geometry and animation is saved.
ship_index=0;
ship_grid[ship_index]=ds_grid_create(7,0);


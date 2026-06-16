/// @description math_adjust_grid_step(grid id,row to process first,row to process last)
/// @param grid id
/// @param row to process first
/// @param row to process last
function math_adjust_grid_step(grid, row, row_2) {
	/*
	The holy equation adjusts a value in linear or differential increments until it matches a target value.
	grid is a ds_grid. This grid has one column for each variable in the equation, like an excel spreadsheet.
	row and row_2 mark which rows of the grid to process first and last.
	row must be less than row_2. Like with an array, you must use positive integers.
	*/

	var i,difference;

	for (i=row; i<=row_2; i+=1)
	{
	    difference=ds_grid_get(grid,1,i)-ds_grid_get(grid,0,i);//difference between value and targetvalue
	    if (difference!=0)
	    {
	        if (abs(difference)>ds_grid_get(grid,4,i))//if the difference is larger than pre-defined threshold,
	        {
	            if ds_grid_get(grid,3,i)//change the value at a constant rate
	            {
	                ds_grid_add(grid,0,i,sign(difference)*ds_grid_get(grid,2,i));
	            }
	            else //change the value quickly at first, slowing down over time
	            {
	                ds_grid_add(grid,0,i,difference*ds_grid_get(grid,2,i));
	            }
	        }
	        else
	        {
	            scr_holyfinished(grid,i);
	        }
	    }
	}



}

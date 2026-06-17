/// @description grid_convert(grid,to_real,row1,column1,row2,column2)
/// @param grid
/// @param to_real
/// @param row1
/// @param column1
/// @param row2
/// @param column2
function grid_convert(grid, to_real, row1, column1, row2, column2) {
	//Converts a rectangular region of a ds_grid between real and string data types.
	//ds_grid_get/ds_grid_set are indexed as (grid, column(x), row(y)),
	//so we iterate columns on the x axis and rows on the y axis.
	//Values already of the desired type are left as is.
	var c, r, value;

	//to_real is true or false. It determines which way to convert.
	if (to_real)
	{
	    for (c=column1; c<=column2; c+=1)
	    {
	        for (r=row1; r<=row2; r+=1)
	        {
	            value=ds_grid_get(grid,c,r);
	            if (is_string(value))
	            {
	                ds_grid_set(grid,c,r,real(value));
	            }
	        }
	    }
	}
	else
	{
	    for (c=column1; c<=column2; c+=1)
	    {
	        for (r=row1; r<=row2; r+=1)
	        {
	            value=ds_grid_get(grid,c,r);
	            if (is_real(value))
	            {
	                ds_grid_set(grid,c,r,string(value));
	            }
	        }
	    }
	}



}

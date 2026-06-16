/// @description ds_grid_convert(grid,stringtoreal,row1,column1,row2,column2)
/// @param grid
/// @param string -> real
/// @param row1
/// @param column1
/// @param row2
/// @param column2
function grid_convert(grid, string, row1, column1, row2, column2) {
	//converts a region of a ds_grid between real and string data types.
	//values that are already the desired type are left as is.
	//values that are mixtures of numbers and letters will be treated as strings.
	var width,height,i,j,value;

	width=ds_grid_width(grid);
	height=ds_grid_height(grid);

	//string is true or false. It determines which way to convert
	if string
	{
	    for(i=row1; i<=row2; i+=1)
	    {
	        for(j=column1; j<=column2; j+=1)
	        {
	            value=ds_grid_get(grid,i,j);
	            if is_string(value)
	            {
	                value=real(value);
	            }
	        }
	    }
	}
	else
	{
	    for(i=row1; i<=row2; i+=1)
	    {
	        for(j=column1; j<=column2; j+=1)
	        {
	            value=ds_grid_get(grid,i,j);
	            if is_real(value)
	            {
	                value=string(value);
	            }
	        }
	    }
	}
	/*
	///ds_grid_stringtoreal(grid,string -> real,row1,column1,row2,column2)
	//converts a region of a ds_grid between real and string data types.
	//when converting string to real, only numbers are kept.
	//"string -> real" is a boolean that determines which way to convert.
	var i,j;

	//string is true or false. It determines which way to convert
	if string
	{
	    for(i=row1; i<=row2; i+=1)
	    {
	        for(j=column1; j<=column2; j+=1)
	        {
	            ds_grid_set(grid,i,j,real(string_digits(ds_grid_get(grid,i,j))))
	        }
	    }
	}
	else
	{
	    for(i=row1; i<=row2; i+=1)
	    {
	        for(j=column1; j<=column2; j+=1)
	        {
	            ds_grid_set(grid,i,j,string(ds_grid_get(grid,i,j)))
	        }
	    }
	}
	*/



}

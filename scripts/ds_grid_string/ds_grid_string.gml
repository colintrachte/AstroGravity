/// @description ds_grid_string(grid_id,row1,column1,row2,column2)
/// @param grid_id
/// @param row1
/// @param column1
/// @param row2
/// @param column2
function ds_grid_string(grid_id, row1, column1, row2, column2) {
	//by Ground Effect Games
	//returns a grid as a string which game maker can draw.
	var s,column,row;
	s="";
	for (row=row1;row<=row2;row+=1)
	{
	    for (column=column1;column<column2;column+=1)
	    {
	        s+=string(ds_grid_get(grid_id,column,row))+ ", ";
	    }
	    //do the last column without a comma at the end, then go to the next line.
	    s+=string(ds_grid_get(grid_id,column,row))+"#";
	}
	return s;



}

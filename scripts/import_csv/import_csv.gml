/// @description import_csv(file path,ds_grid id)
/// @param file path
/// @param ds_grid id
function import_csv(file, ds_grid) {
	//By Ground Effect Games
	//reads a csv file and converts it into an existing ds_grid.
	//all values loaded into the grid are strings. use grid_convert to change to numbers.
	//the grid must be large enough to fit the csv file!
	//file path example: working_directory + "\level.txt"

	//the computer reads the entire file as soon as it is opened.
	var row,column,text;
	file = file_text_open_read(file);
	if (file != -1)
	{

	//we use a loop to process rows of text as the computer reads them automatically.
	row=0;
	while (!file_text_eof(file))
	{
	    //grab a whole line of text as soon as the computer reads it.
	    text=file_text_readln(file);
	    //treat the line of text like a row in an excel spreadsheet.
	    //commas separate one column from the next.
	    column=0;
	    while (string_pos(",",text))
	    {
	        //copy everything before the first comma
	        subtext=string_copy(text,1,string_pos(",",text)-1)
	        //paste into the correct row and column in the ds_grid
	        ds_grid_add(ds_grid,column,row,subtext)
	        //deletes everything before the comma, and deletes the comma too.
	        text=string_delete(text,1,string_pos(",",text));
	        //increase the column number, and repeat until there are no more commas.
	        column+=1;
	    }
	    //add the very last value to the grid
	    ds_grid_add(ds_grid,column,row,text)
	    row+=1;
	}

	file_text_close(file);
	}
	else
	{
		//error handling can go here
	}


}

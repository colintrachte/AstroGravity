/// @description load_grid_elements(columns,rows,file path)
/// @param columns
/// @param rows
/// @param file path
function load_grid_elements(columns, rows, file) {
	//loads the first 100 elements of the periodic table from a .csv file
	grid_elements=ds_grid_create(columns,rows);
	import_csv(file,grid_elements)



}

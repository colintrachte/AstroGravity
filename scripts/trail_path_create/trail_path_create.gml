/// @description trail_path_create(number of points,smooth)
/// @param number of points
/// @param smooth
function trail_path_create(number, smooth) {
	//By Ground Effect Games

	trail_count_max = number;
	trail_path=path_add();
	path_set_closed(trail_path,0)

	//smooth path uses more CPU
	if smooth
	{
	    path_set_kind(trail_path,1)
	    path_set_precision(trail_path,2)
	}
	trail_count=0;



}

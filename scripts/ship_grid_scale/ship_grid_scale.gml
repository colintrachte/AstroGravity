/// @description ship_grid_scale(ds_grid)
/// @param ds_grid
function ship_grid_scale(ds_grid) {
	var grid_height,x1,y1,y2;
	grid_height=ds_grid_height(ds_grid)-1;

	//guard: an empty ship grid (no points built yet) has no min/max, which would
	//divide by an undefined value. Return a safe default scale instead of crashing.
	if (grid_height < 0) return 1;

	//approximate the farthest points from center, factoring in the animation
	x1=ds_grid_get_min(ds_grid,0,0,0,grid_height)+ds_grid_get_min(ds_grid,2,0,2,grid_height)/2;
	y1=ds_grid_get_min(ds_grid,1,0,1,grid_height)+ds_grid_get_min(ds_grid,3,0,3,grid_height)/2;
	y2=ds_grid_get_max(ds_grid,1,0,1,grid_height)+ds_grid_get_max(ds_grid,3,0,3,grid_height)/2;

	return .5*sqrt(__view_get( e__VW.HPort, 0 )/max(x1*2,y2-y1))-.35;



}

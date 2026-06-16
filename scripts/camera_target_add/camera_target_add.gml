/// @description camera_target_add(instance ID, weighting)
/// @param instance ID
/// @param  weighting
function camera_target_add(instance, weighting) {
	//adds an object to the list of objects that the camera must try to keep in view
	//lowest priority is 0, larger numbers are higher priority
	ds_list_add(camera.target_list,instance)
	ds_list_add(camera.target_priorities,weighting)




}

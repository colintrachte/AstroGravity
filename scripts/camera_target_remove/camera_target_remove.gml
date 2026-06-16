/// @description camera_target_remove(instance ID)
/// @param instance ID
function camera_target_remove(instance) {
	//removes an object from the list of objects that the camera must try to keep in view
	var list=camera.target_list;
	var index=ds_list_find_index(list,instance);
	ds_list_delete(list,index)
	ds_list_delete(camera.target_priorities,index)



}

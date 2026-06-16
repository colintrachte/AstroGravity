/// @description camera_target_draw()
function camera_target_draw() {

	target_list_size=ds_list_size(target_list);

	//figure out where to aim the camera next
	for (var i=0;i<target_list_size;i+=1)
	{
	    //retrieve the object id and draw the object name on the screen
	    draw_text(400,200+i*16,string_hash_to_newline(object_get_name(ds_list_find_value(target_list,i).object_index)))
	}



}

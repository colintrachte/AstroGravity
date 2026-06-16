/// @description camera_target_init()
function camera_target_init() {
	//to be called by the camera object only
	//a prioritized list is created to keep track of everything selected by the camera
	target_list=ds_list_create();
	target_priorities=ds_list_create();
	targetx=0;
	targety=0;
	w=1;



}

/// @description camera_follow(object,shake)
/// @param object
/// @param shake
function camera_follow(object, shake) {
	//by Ground Effect Games
	//like camera_watchme, only designed to be called from anywhere.
	//runs slightly slower.
	if (camera.selected<0)
	{
	    camera.xtarget=object.x;
	    camera.ytarget=object.y;
	    camera.shake=shake;
	}



}

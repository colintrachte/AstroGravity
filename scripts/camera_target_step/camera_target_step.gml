/// @description camera_target_step()
function camera_target_step() {
	//to be called only from the camera object
	//calculates where to aim the "camera" so as to keep as many objects in view as possible,
	//taking into account the importance of each object (1 being highest priority)

	target_list_size=ds_list_size(target_list);
	targetx=0;
	targety=0;
	w=1;
	//figure out where to aim the camera next
	var target,target_priority;
	for (var i=0;i<target_list_size;i+=1)
	{
	    //retrieve the object id
	    target=ds_list_find_value(target_list,i);
    
	    if instance_exists(target)
	    {
	        //retrieve the object priority
	        target_priority=ds_list_find_value(target_priorities,i);
	        w+=target_priority;
	        targetx+=(target.x-x)*target_priority;
	        targety+=(target.y-y)*target_priority;
	    }
	    else
	    {
	        camera_target_remove(target)
	    }
	}
	xtarget=x+targetx/w;
	ytarget=y+targety/w;



}

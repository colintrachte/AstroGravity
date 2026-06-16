/// @description touch_button_released(button ID,input ID)
/// @param button ID
/// @param input ID
function touch_button_released(button, input) {
	//multi-touch version of the mouse_button_released event

	if button_active[button]
	{
	    //if the user clicks within the radius of the button
	    if (point_distance(button_x[button],button_y[button],touch_x[input],touch_y[input])<button_radius[button])
	    {
	        switch button_kind[button]
	        {
	            //drag/drop
	            case 2:
	            {
	                event_perform(ev_other,event[button_event[button]])
	            }
	            break;
	        }
	    }
	}



}

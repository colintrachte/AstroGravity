/// @description touch_button_pressed(button ID, input ID)
/// @param button ID
/// @param  input ID
function touch_button_pressed(button, input) {
	//multi-touch version of the mouse_button_pressed event

	if button_active[button]
	{
	    //if the user clicks within the radius of the button
	    if (point_distance(button_x[button],button_y[button],touch_x[input],touch_y[input])<button_radius[button])
	    {
	        button_input[button]=input;
	        switch button_kind[button]
	        {
	            //push button
	            case 0:
	            {
	                button_state[button]=1;
	            }
	            break;
	            //toggle switch
	            case 1:
	            {
	                button_state[button]=!button_state[button];
	            }
	            break;
	            //drag/drop
	            case 2:
	            {
                
	            }
	            break;
	        }
	    }
	}



}

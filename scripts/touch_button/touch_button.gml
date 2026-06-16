/// @description touch_button(button ID,input ID)
/// @param button ID
/// @param input ID
function touch_button(button, input) {
	//multi-touch version of the mouse_button event

	if button_active[button]
	{
	    switch button_kind[button]
	    {
	        //push button
	        case 0:
	        {
	            button_state[button]=(point_distance(button_x[button],button_y[button],touch_x[input],touch_y[input])<button_radius[button])
	        }
	        break;
	        //virtual joystick (vstick)
	        case 3:
	        {
	            touch_len[input]=point_distance(button_x[button],button_y[button],touch_x[input],touch_y[input]);
	            touch_percent[input]=.8*touch_len[input]/button_radius[0];
	            if touch_percent[input]<1
	            {
	                button_input[button]=input;
	                touch_dir[input]=point_direction(button_x[button],button_y[button],touch_x[input],touch_y[input]);
	            }
	            else
	            {
	                touch_percent[input]=0;
	            }
	        }
	        break;
	    }
	}



}

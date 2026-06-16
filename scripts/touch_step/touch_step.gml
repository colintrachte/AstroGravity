function touch_step() {
	//game maker supports up to 5 simultaneous touch inputs, but we are only using 3.
	for (var i=0;i<3;i+=1)
	{
	    if device_mouse_check_button(i,mb_left)
	    {
	        //update the position of the mouse before doing anything else.
	        touch_x[i]=device_mouse_x_to_gui(i);
	        touch_y[i]=device_mouse_y_to_gui(i);
	        //mouse_button_pressed event
	        if !touch[i]
	        {
	            //prevent the mouse_button_pressed event from being repeated
	            touch[i]=1;
	            //perform the mouse_pressed event for all buttons on the list
	            for (var j=0;j<button_count;j+=1)
	            {
	                touch_button_pressed(j,i)
	            }
	        }
	        else
	        {
	            //mouse_button event
	            //perform the mouse_button event for all buttons on the list
	            for (var j=0;j<button_count;j+=1)
	            {
	                touch_button(j,i)
	            }
	        }
	    }
	    else
	    {
	        //mouse_button_pressed(none) event
	        for (var j=0;j<button_count;j+=1)
	        {
	            touch_button_released(j,i)
	        }
        
	        //reset the state of the input currently being analyzed
	        touch[i]=0;
	        touch_len[i]=0;
	        touch_percent[i]=0;
	    }
	}



}

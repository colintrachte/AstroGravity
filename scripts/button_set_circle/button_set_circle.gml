/// @description button_set_circle(index,x,y,radius,label,active,state,kind,button pressed event #,button event #,button released event #)
/// @param index
/// @param x
/// @param y
/// @param radius
/// @param label
/// @param active
/// @param state
/// @param kind
/// @param button pressed event #
/// @param button event #
/// @param button released event #
function button_set_circle(index, x, y, radius, label, active, state, kind, button, button_9, button_10) {
	//initialize all the variables needed for a circular button
	button_x[index]=x;
	button_y[index]=y;
	button_radius[index]=radius;
	//text displayed on the button
	button_label[index]=label;
	//is the button active (visible and usable)?
	button_active[index]=active;
	//some buttons might need more states than just on (1) or off (0)
	button_state[index]=state;
	//There are different kinds of buttons:
	//push button=0, toggle=1, drag/drop=2, virtual joystick=3
	button_kind[index]=kind;
	//each button must be assigned a user-defined event number between 1 and 15.
	button_pressed_action[index]=button;
	button_event[index]=button_9;
	button_released_action[index]=button_10;
	button_input[index]=0;



}

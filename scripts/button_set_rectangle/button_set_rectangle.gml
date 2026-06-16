/// @description button_set_rectangle(x,y,width,height,label,active,state,index)
/// @param x
/// @param y
/// @param width
/// @param height
/// @param label
/// @param active
/// @param state
/// @param index
function button_set_rectangle(x, y, width, height, label, active, state, index) {
	button_x[index]=x;
	button_y[index]=y;
	button_w[index]=width/2;
	button_h[index]=height/2;
	button_label[index]=label;
	button_active[index]=active;
	button_state[index]=state;



}

/// @description menu_button_activate()
function menu_button_activate() {
	selected=1;//selects the button you just clicked on
	image_blend=c_white;
	sound_play(snd_click);
	menu.footer=menu.caption[_id];



}

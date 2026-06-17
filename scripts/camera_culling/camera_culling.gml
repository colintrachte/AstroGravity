function camera_culling() {
	if !instance_exists(o_menu_main)
	{
	    instance_activate_region(__view_get( e__VW.XView, 0 )-400,__view_get( e__VW.YView, 0 )-400,__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+400,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+400,1)
	}


}

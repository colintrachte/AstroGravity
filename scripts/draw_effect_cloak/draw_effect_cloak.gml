/// @description draw_effect_cloak(x,y,sprite mask,camera zoom,distortion,layer spacing,color,alpha)
/// @param x
/// @param y
/// @param sprite mask
/// @param camera zoom
/// @param distortion
/// @param layer spacing
/// @param color
/// @param alpha
function draw_effect_cloak(x, y, sprite, camera, distortion, layer, color, alpha) {
	//By Ground Effect Games
	//Intended to be used with create_, draw_begin_, and destroy_effect cloak scripts.
	//Camera zoom is used to compensate for the ratio between the hview,wview and hport,wport
	//distortion is between 1-0
	//layers spacing is also 1-0
	cloak_distortion=1-distortion;

	temp_sprite=sprite_create_from_surface(application_surface,(x-__view_get( e__VW.XView, 0 )-x1)/camera,(y-__view_get( e__VW.YView, 0 )-y1)/camera,w,h,0,0,x1,y1);
	sprite_set_alpha_from_sprite(temp_sprite,sprite)
	for (var i=1;i>cloak_distortion;i-=layer)
	{
	    draw_sprite_ext(temp_sprite,0,x,y,i*image_yscale,i*image_xscale,image_angle,color,alpha)
	}

	delete_sprite_after_this=1;



}

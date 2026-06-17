/// @description intermittent step code
//some code does not need to run every step, so there is an alarm for that
texture=surface_get_texture(application_surface);
ready=1;
image_blend=color;
alarm[0]=update_speed;


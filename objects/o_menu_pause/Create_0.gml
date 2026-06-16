/// @description this object makes the pause work. create it by typing pause() in the code of any other object
//take a screenshot and use it as this object's sprite
sprite = sprite_create_from_surface(application_surface,0,0,screen.width,screen.height,0,0,0,0);

//pause the particle system
//in your game, replace the first argument with the ID of your particle system.
//repeat for all particle systems you want to pause.
//be sure to do the same thing in the destroy event, to reactivate the particles!
part_system_automatic_update(0,0);

//deactivate all other instances (they will be reactivated on key press)
instance_deactivate_all(true);
instance_activate_object(screen)

instance_deactivate_all(true)
instance_activate_object(screen)

//this variable is used for detecting swiping on touchscreen devices
x1=0;

//the user must swipe across at least 64 pixels, so the game cannot be unpaused by accident.
swipe_distance=64;

//if a swipe is detected right away, the pause object is unpaused as soon as it is created.
//to prevent this, we create a variable that says we are not ready yet.
ready=0;

//A timer is set to tell the computer when we are ready to detect swipes.
alarm[0]=60;


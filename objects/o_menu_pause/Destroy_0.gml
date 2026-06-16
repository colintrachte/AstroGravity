//Activate all the objects
instance_activate_all();

//erase the temporary "screenshot" sprite
sprite_delete(sprite)

//unpause the particle system
//in your game, replace the first argument with the ID of your particle system.
//repeat for all particle systems you want to pause.
//be sure to do the same thing in the create event, to deactivate the particles!
part_system_automatic_update(0,1);


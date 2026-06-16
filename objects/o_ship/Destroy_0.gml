destroy_effect_cloak()
camera_target_clear()
ds_grid_destroy(ship_grid)
if hud.live_s==0
{
    game_restart()
}
else
{
    //instance_create(camera.x,camera.y,o_countdown);
}
hud.live_s-=1;


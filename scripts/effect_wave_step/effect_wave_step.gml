/// @description scr_wave_step()
function effect_wave_step() {
	//place in step event to produce particles that pulse in waves
	//scr_wave_init() must be called first!
	targetsp=sqrt(sprite_width*sprite_height)

	part_type_size(fx.wave,.1,.3,-.01/(1+speed),0)
	part_type_life(fx.wave,15+(30/(1+speed)),15+(30/(1+speed)))

	part_emitter_region(fx.middle,emitter1,x-sp,x+sp,y-sp,y+sp,ps_shape_ellipse,1)
	part_emitter_burst(fx.middle,emitter1,fx.wave,1+sqrt(speed*targetsp))

	if sp<-targetsp
	change=1

	if sp>targetsp
	change=0

	if change=1
	sp+=1
	else
	sp-=1



}

/// @description Draws a background at a given position, with customizable scaling, rotation, blend and alpha.
/// @param back The index of the background to draw.
/// @param x The x coordinate of where to draw the background.
/// @param y The y coordinate of where to draw the background.
/// @param xscale The horizontal scaling of the background.
/// @param yscale The vertical scaling of the background.
/// @param rot The rotation of the background.
/// @param colour The colour with which to blend the background (use -1 or c_white to display it normally).
/// @param alpha  The alpha of the background (from 0 to 1 where 0 is transparent and 1 opaque). 
/// @returns 
function draw_background_ext(back, x, y, xscale, yscale, rot, colour, alpha) {

	draw_sprite_ext(back, 0, x, y, xscale, yscale, rot, colour, alpha);


}

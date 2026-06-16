//this is 10-20% faster than trying to draw some portion of a texture using primitives,
//or copying this portion of a sprite to a surface and then drawing that from the maker object
draw_sprite_part_ext(sprite_index,0,left,top,maker.size,maker.size,x,y,1,1,image_blend,30*image_alpha);


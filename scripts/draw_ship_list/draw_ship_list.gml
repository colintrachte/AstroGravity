/// @description draw_ship_list(list,x,y,alpha)
/// @param list
/// @param x
/// @param y
/// @param alpha
function draw_ship_list(list, x, y, alpha) {
	var list_length,ID;
	list_length=ds_list_size(list);

	draw_primitive_begin(pr_trianglestrip)
	for (var i=0;i<list_length;i+=1)
	{
	    ID=ds_list_find_value(list,i);
	    draw_vertex_color(x-ID.dx,y+ID.dy,ID.image_blend,alpha);
	}
	draw_primitive_end()

	draw_primitive_begin(pr_trianglestrip)
	for (var i=0;i<list_length;i+=1)
	{
	    ID=ds_list_find_value(list,i);
	    draw_vertex_color(x+ID.dx,y+ID.dy,ID.image_blend,alpha);
	    draw_text(ID.x,ID.y-24,string_hash_to_newline(string(i)))
	}
	draw_primitive_end()



}

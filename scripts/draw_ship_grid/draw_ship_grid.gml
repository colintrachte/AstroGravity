/// @description draw_ship_grid(grid id,x,y,scale,angle,color,alpha,left weighting,right weighting,labels)
/// @param grid id
/// @param x
/// @param y
/// @param scale
/// @param angle
/// @param color
/// @param alpha
/// @param left weighting
/// @param right weighting
/// @param labels
function draw_ship_grid(grid, x, y, scale, angle, color, alpha, left, right, labels) {
	var grid_height,xx,yy,len,dir;
	grid_height=ds_grid_height(grid);

	//left half
	draw_primitive_begin(pr_trianglestrip)
	for (var i=0;i<grid_height;i+=1)
	{
	    //vertex location=center point + lengthdir(initial offset + morph distance,dir)
	    xx=ds_grid_get(grid,0,i)+ds_grid_get(grid,2,i)*left;
	    yy=ds_grid_get(grid,1,i)+ds_grid_get(grid,3,i)*left;
	    len=point_distance(0,0,xx,yy)*scale;
	    dir=point_direction(0,0,xx,yy)+angle;
	    color=merge_colour(merge_colour(ds_grid_get(grid,4,i),ds_grid_get(grid,5,i),left),color,.2);
	    draw_vertex_color(x+lengthdir_x(len,dir),y+lengthdir_y(len,dir),color,alpha);
	    if labels
	    {
	        draw_text(xx,yy-24,string_hash_to_newline(string(i)))
	    }
	}
	draw_primitive_end()

	//draw the mirror image (right half)
	draw_primitive_begin(pr_trianglestrip)
	for (var i=0;i<grid_height;i+=1)
	{
	    xx=-ds_grid_get(grid,0,i)-ds_grid_get(grid,2,i)*right;
	    yy=ds_grid_get(grid,1,i)+ds_grid_get(grid,3,i)*right;
	    len=point_distance(0,0,xx,yy)*scale;
	    dir=point_direction(0,0,xx,yy)+angle;
	    color=merge_colour(merge_colour(ds_grid_get(grid,4,i),ds_grid_get(grid,5,i),right),color,.2);
	    draw_vertex_color(x+lengthdir_x(len,dir),y+lengthdir_y(len,dir),color,alpha);
	}
	draw_primitive_end()



}

/// @description draw_trail(path,texture,segments,starting width,ending width,color,alpha)
/// @param path
/// @param texture
/// @param segments
/// @param starting width
/// @param ending width
/// @param color
/// @param alpha
function draw_trail(path, texture, segments, starting, ending, color, alpha) {
	//By Ground Effect Games
	//this trail is centered on the path
	//This draw function can be used for any path, not just trails!
	//It all depends on what sort of path you give this script to work with.
	var pathlength=path_get_length(path);
	if (pathlength>0)
	{
	    var i,seglength,r1,r2,xprev,yprev,xx,yy,wx,wy,dir;
	    seglength = 1/segments;
	    r2 = ending*.5;
	    r1 = starting*.5-r2;
	    xprev = path_get_x(path,0);
	    yprev = path_get_y(path,0);
	    draw_primitive_begin_texture(pr_trianglestrip,texture);
	    for (i=seglength; i<1; i+=seglength;)
	    {
	        xx = path_get_x(path,i);
	        yy = path_get_y(path,i);
	        dir = point_direction(xprev,yprev,xx,yy)+90;
	        r = r2+r1*i;
	        wx = lengthdir_x(r,dir);
	        wy = lengthdir_y(r,dir);
	        draw_vertex_texture_color(xprev+wx,yprev+wy,i-seglength,0,color,alpha);
	        draw_vertex_texture_color(xprev-wx,yprev-wy,i-seglength,1,color,alpha);
	        xprev = xx;
	        yprev = yy;
	    }
	    xx = path_get_x(path,1);
	    yy = path_get_y(path,1);
	    draw_vertex_texture_color(xprev+wx,yprev+wy,1,0,color,alpha);
	    draw_vertex_texture_color(xprev-wx,yprev-wy,1,1,color,alpha);
	    draw_primitive_end();
	}



}

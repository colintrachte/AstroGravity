/// @description draw_lightning_small(x1,y1,x2,y2,segment length,color,angle tolerance,curl)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param segment length
/// @param color
/// @param angle tolerance
/// @param curl
function draw_lightning_small(x1, y1, x2, y2, segment, color, angle, curl) {
	//By Ground Effect Games
	//simple lightning with alpha changing over distance. intended for shorter distances.
	//tolerance is the maximum number of degrees the path may vary from a straight line
	//curl determines how many degrees the lightning's average path will curve.
	var i,xprev,yprev,xx,yy,dir,alpha,pathlength;
	xx=x1;
	yy=y1;
	i=0;
	alpha=1;
	pathlength=point_distance(xx,yy,x2,y2);
	draw_primitive_begin(pr_linestrip)
	while (pathlength>segment)
	{
	    xprev=xx;
	    yprev=yy;
	    dir=point_direction(xprev,yprev,x2,y2)+median(-89,tolerance(angle)+curl,89);
	    xx+=lengthdir_x(segment,dir);
	    yy+=lengthdir_y(segment,dir);
	    pathlength=point_distance(xx,yy,x2,y2);
	    //fades the lightning with distance
	    alpha=.02+(.8/(i+1));
	    draw_vertex_color(xprev,yprev,color,alpha);
	    i+=1;
	}
	//add the last segment manually, so the lightning hits the target pixel exactly
	draw_vertex_color(xx,yy,color,alpha);
	draw_vertex_color(x2,y2,color,alpha);
	draw_primitive_end()



}

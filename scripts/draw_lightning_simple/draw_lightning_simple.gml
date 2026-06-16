/// @description draw_lightning_simple(x1,y1,x2,y2,segment length,angle tolerance)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param segment length
/// @param angle tolerance
function draw_lightning_simple(x1, y1, x2, y2, segment, angle) {
	//by Ground Effect Games
	//slightly faster than creating a lightning path and then drawing it
	//the least CPU intensive version
	var xprev,yprev,xx,yy,dir,t;
	xx=x1;
	yy=y1;
	//larger angle tolerance takes longer to draw. 0-60 degrees recommended.
	t=median(-120,angle,120);
	draw_primitive_begin(pr_linestrip)
	while (point_distance(xx,yy,x2,y2)>segment)
	{
	    xprev=xx;
	    yprev=yy;
	    dir=point_direction(xprev,yprev,x2,y2)+tolerance(t);
	    xx+=lengthdir_x(segment,dir);
	    yy+=lengthdir_y(segment,dir);
	    draw_vertex(xprev,yprev)
	}
	//add the last segment manually, so the lightning hits the target pixel exactly
	draw_vertex(xx,yy);
	draw_vertex(x2,y2)
	draw_primitive_end()



}

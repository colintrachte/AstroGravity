/// @description draw_lightning_simple_lines(x1,y1,x2,y2,segment length,tolerance)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param segment length
/// @param tolerance
function draw_lightning_simple_lines(x1, y1, x2, y2, segment, tolerance) {
	//by Ground Effect Games
	//draws individual line segments instead of a single primitive
	var xprev,yprev,xx,yy,dir,t;
	xx=x1;
	yy=y1;
	//larger angle tolerance takes longer to draw. 0-60 degrees recommended.
	t=median(-120,tolerance,120);
	while (point_distance(xx,yy,x2,y2)>segment)
	{
	    xprev=xx;
	    yprev=yy;
	    dir=point_direction(xprev,yprev,x2,y2)+tolerance(t);
	    xx+=lengthdir_x(segment,dir);
	    yy+=lengthdir_y(segment,dir);
	    draw_line(xprev,yprev,xx,yy);
	}
	//add the last segment manually, so the lightning hits the target pixel exactly
	draw_line(xx,yy,x2,y2);



}

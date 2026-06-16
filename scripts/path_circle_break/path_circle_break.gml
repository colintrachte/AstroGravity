/// @description path_circle_break(path,seglength,tolerance,curl)
/// @param path
/// @param seglength
/// @param tolerance
/// @param curl
function path_circle_break() {
	//takes a circular path and breaks it in two.
	//modify the existing path.
	//return an additional new path.
	/*this script is not finished yet
	var p1,x1,y1,r1,p2,x2,y2,r2,xx,yy,dir,t,curl,path;
	p1=random(1);
	p2=random(1);
	start_point=min(p1,p2);
	end_point=max(p1,p2);
	//choose two random points on the circular path
	x1=path_get_x(argument0,start_point)
	y1=path_get_x(argument0,start_point)
	r1=path_get_x(argument0,start_point)

	x2=path_get_x(argument0,end_point)
	y2=path_get_x(argument0,end_point)
	r2=path_get_x(argument0,end_point)

	xx=x1;
	yy=y1;
	//tolerance is limited in order to make the effect look nice and also use less CPU.
	t=median(-60,argument2,60);
	curl=tolerance(t);
	path=path_add();
	while (point_distance(xx,yy,x2,y2)>argument1)
	{
	    dir=point_direction(xx,yy,x2,y2)+curl+tolerance(t);
	    path_add_point(path,xx,yy,0);
	    xx+=lengthdir_x(argument1,dir);
	    yy+=lengthdir_y(argument1,dir);
	}
	//stop the loop when closer than one segment length to the target
	path_add_point(path,x2,y2,0);
	//add the last point manually, to hit the target pixel exactly*/



}

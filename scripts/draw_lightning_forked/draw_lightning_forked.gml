/// @description draw_lightning_forked(x1,y1,x2,y2,segment length,color,angle tolerance,curl,attractive object)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param segment length
/// @param color
/// @param angle tolerance
/// @param curl
/// @param attractive object
function draw_lightning_forked(x1, y1, x2, y2, segment, color, angle, curl, attractive) {
	//By Ground Effect Games
	//simple lightning with forks and alpha changing over distance
	//tolerance is the maximum number of degrees the path may vary from a straight line
	//curl determines how many degrees the lightning's average path will curve.
	var i,xprev,yprev,xx,yy,dir,forkdist,alpha,pathlength;
	xx=x1;
	yy=y1;
	i=0;
	alpha=1;
	forkdist=0;
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
	    alpha=.02+(9.8/(i+10));
	    draw_vertex_color(xprev,yprev,color,alpha);
    
	    //The code below handles forking the lightning.
	    //Don't fork the lightning if a fork has already occured
	    if (!forkdist)
	    {
	        //forks are less likely when lightning alpha (charge) is low
	        if random_dice(25/alpha)
	        {
	            //capture the starting x and y of the fork
	            x1=xx;
	            y1=yy;
	            //the fork length is limited by the remaining path length
	            forkdist=segment*3+random(pathlength);
	            //half of all forks will go after the nearest piece of metal
	            var metal=collision_circle(xx,yy,forkdist,attractive,0,1);
	            if (metal!=noone && choose(1,0))
	            {
	                x2=metal.x;
	                y2=metal.y;
	            }
	            else
	            {
	                //the fork will come off the main lightning at an angle that looks natural
	                dir+=tolerance(60);
	                x2=xx+lengthdir_x(forkdist,dir);
	                y2=yy+lengthdir_y(forkdist,dir);
	            }
	        }
	    }
	    i+=1;
	}
	//add the last segment manually, so the lightning hits the target pixel exactly
	draw_vertex_color(xx,yy,color,alpha);
	draw_vertex_color(x2,y2,color,alpha);
	draw_primitive_end()

	if forkdist
	{
	    draw_lightning_forked(x1,y1,x2,y2,segment,color,angle,curl,attractive)
	}



}

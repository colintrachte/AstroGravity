/// @description draw_lightning_flat(path,segment length,segment width,color,alpha,fork path,attractive object,particles,weighting)
/// @param path
/// @param segment length
/// @param segment width
/// @param color
/// @param alpha
/// @param fork path
/// @param attractive object
/// @param particles
/// @param weighting
function draw_lightning_flat(path, segment, segment_2, color, alpha, fork, attractive, particles, weighting) {
	/*
	By Ground Effect Games
	Path lightning with a single flat color.
	the fx controller object (or some equivalent) is necessary to do particles efficiently!
	segment length: distance between one point and the next.
	segment width: width of the segment at each point.
	alpha is at the center of the path, color is on the edges (bilinear gradient)
	set fork path to -1 if you are not using it.
	*/
	var pathlength=path_get_length(path);
	//It won't look like lightning unless you have more than one segment!
	if (pathlength>segment)
	{
	    var seglength,width,xprev,yprev,xx,yy,x1,y1,x2,y2,dir,dir2,forkwidth,forkalpha,i,i2,wx,wy;
	    //returns a percentage of the path which makes up one segment of the lightning.
	    seglength = segment/pathlength;
	    forkwidth=0;
	    xprev=path_get_x(path,1);
	    yprev=path_get_y(path,1);
	    draw_primitive_begin(pr_trianglestrip)
	    for (i=1; i>0; i-=seglength;)
	    {
	        i2 = i-seglength;
	        xx = path_get_x(path,i2);
	        yy = path_get_y(path,i2);
	        //width decreases with distance
	        width = .5+(segment_2 - i*segment_2)*.5;
	        //calculate direction
	        dir2=point_direction(xx,yy,xprev,yprev);
	        dir=dir2+90;
	        //adjust x and y depending on weighting
	        xx+=lengthdir_x(path_get_speed(path,i2)*weighting,dir);
	        yy+=lengthdir_y(path_get_speed(path,i2)*weighting,dir);
	        //set the width
	        wx = lengthdir_x(width,dir);
	        wy = lengthdir_y(width,dir);
	        alpha=alpha*(1-i/4);
	        //create a vertex at width/2 from center at the path, then another at center
	        draw_vertex_colour(xprev+wx,yprev+wy,color,alpha);
	        draw_vertex_colour(xprev-wx,yprev-wy,color,alpha);
	        xprev=xx;
	        yprev=yy;
	        //The code below handles particles
	        //if particles are enabled, some chance to throw a spark
	        if (particles)
	        {
	            effect_blocksparks(xx,yy,dir2,30,10+(10*i/alpha),i,color,alpha)
	        }
	        //The code below handles forking the lightning.
	        //Don't fork the lightning if a fork has already occured,
	        if (!forkwidth)
	        {
	            //don't fork unless there is a path for it
	            if (path_exists(fork))
	            {
	                //odds are 1 fork per lightning
	                if random_dice(pathlength/segment)
	                {
	                    //capture the starting x and y of the fork
	                    x1=xx;
	                    y1=yy;
	                    //the ending x and y depends on whether there is metal nearby
	                    var metal=collision_circle(xx,yy,pathlength,attractive,0,1);
	                    //half of all forks will hit the metal
	                    if (metal!=noone && choose(1,0))
	                    {
	                        x2=metal.x;
	                        y2=metal.y;
	                    }
	                    else
	                    {
	                        dir2+=tolerance(60);
	                        var dist = segment*3+random(pathlength*(1-i));
	                        x2=xx+lengthdir_x(dist,dir2);
	                        y2=yy+lengthdir_y(dist,dir2);
	                    }
	                    forkwidth=width*2;
	                    forkalpha=alpha;
	                }
	            }
	        }
	    }
	    //add the last point. no need to go through the full loop.
	    draw_vertex_colour(xx+wx,yy+wy,color,alpha);
	    draw_vertex_colour(xx-wx,yy-wy,color,alpha);
	    draw_vertex_colour(xx-lengthdir_x(width,dir2),yy-lengthdir_y(width,dir2),color,0);
	    draw_primitive_end()
	    //draw the fork AFTER finished with primitives in the current script
	    //this is important because nested primitives cause errors
	    if (forkwidth)
	    {
	        //don't waste memory drawing a path fork if it is really small
	        if (forkwidth>6)
	        {
	            path_random(x1,y1,x2,y2,fork,segment,30+random(30),fx.curl);
	            draw_lightning_flat(fork,segment,forkwidth,color,forkalpha,-1,-1,particles*(forkwidth>12),0);
	        }
	        else
	        {
	            draw_lightning_forked(x1,y1,x2,y2,segment,color,30+random(30),fx.curl,particles);
	        }
	    }
	}



}

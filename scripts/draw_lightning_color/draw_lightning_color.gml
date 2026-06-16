/// @description draw_lightning_color(path,segment length,width,color1,color2,alpha,fork path,attractive object, enable particles,weighting)
/// @param path
/// @param segment length
/// @param width
/// @param color1
/// @param color2
/// @param alpha
/// @param fork path
/// @param attractive object
/// @param  enable particles
/// @param weighting
function draw_lightning_color(path, segment, width, color1, color2, alpha, fork, attractive, enable, weighting) {
	/*
	By Ground Effect Games
	basically the same as path lightning but with the ability to choose a color range.
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
	    var seglength,xprev,yprev,xx,yy,x1,y1,x2,y2,offset,dir,dir2,forkwidth,forkcolor,forkalpha,i,i2,color;
	    //returns a percentage of the path which makes up one segment of the lightning.
	    seglength = segment/pathlength;
	    offset=90;
	    forkwidth=0;
	    //we have to draw the lightning in two halves in order to get the gradient we want, and not a flat color.
	    repeat(2)
	    {
	        xprev=path_get_x(path,1);
	        yprev=path_get_y(path,1);
	        draw_primitive_begin(pr_trianglestrip)
	        for (i=1; i>0; i-=seglength;)
	        {
	            i2=i-seglength;
	            color=merge_color(color1,color2,i);
	            alpha=alpha*(1-i/4);
	            xx = path_get_x(path,i2);
	            yy = path_get_y(path,i2);
	            //width decreases with distance
	            width = .5+(width - i*width)*.5;
	            //calculate direction
	            dir2=point_direction(xx,yy,xprev,yprev);
	            dir=dir2+offset;
	            //adjust x and y depending on weighting
	            xx+=lengthdir_x(path_get_speed(path,i2)*weighting,dir2-90);
	            yy+=lengthdir_y(path_get_speed(path,i2)*weighting,dir2-90);
	            //create a vertex at width/2 from center at the path, then another at center
	            draw_vertex_colour(xprev+lengthdir_x(width,dir),yprev+lengthdir_y(width,dir),color,0);
	            draw_vertex_colour(xprev,yprev,c_white,alpha);
	            xprev=xx;
	            yprev=yy;
            
	            //The code below handles particles.
	            //if particles are enabled, some chance to throw a spark
	            if (enable)
	            {
	                effect_lsparks(xx,yy,dir2,30,10+(10*i/alpha),i,color,alpha)
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
	                        forkcolor=color;
	                        forkalpha=alpha;
	                    }
	                }
	            }
	        }
	        //add the last point. no need to go through the full loop.
	        draw_vertex_colour(xx+lengthdir_x(width,dir),yy+lengthdir_y(width,dir),color,0);
	        draw_vertex_colour(xx-lengthdir_x(width,dir2),yy-lengthdir_y(width,dir2),c_white,0);
	        draw_primitive_end()
	        offset=-90;
	    }
    
	    //draw the fork AFTER finished with primitives in the current script
	    //this is important because nested primitives cause errors
	    if (forkwidth)
	    {
	        if (forkwidth>6)
	        {
	            path_random(x1,y1,x2,y2,fork,segment,30+random(30),fx.curl);
	            draw_lightning_color(fork,segment,forkwidth,forkcolor,color2,forkalpha,-1,-1,enable*(forkwidth>12),0);
	        }
	        else
	        {
	            draw_lightning_forked(x1,y1,x2,y2,segment,merge_color(c_white,forkcolor,.3),30+random(30),fx.curl,attractive);
	        }
	    }
	}



}

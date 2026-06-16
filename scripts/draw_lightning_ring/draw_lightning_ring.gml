/// @description draw_lightning_ring(x,y,path,start,end,# polygons,width,angle,color,alpha,fork path,attractive object, enable particles)
/// @param x
/// @param y
/// @param path
/// @param start
/// @param end
/// @param # polygons
/// @param width
/// @param angle
/// @param color
/// @param alpha
/// @param fork path
/// @param attractive object
/// @param  enable particles
function draw_lightning_ring(x, y, path, start, path_end, width, angle, color, alpha, fork, attractive, enable, arg12) {
	/*
	By Ground Effect Games
	the fx controller object (or some equivalent) is necessary to do particles efficiently!
	the script "path_random_circle" should be used to create the path for this script.
	If you want to create your own circular path, use draw_path_ring to draw it instead.
	the drawing is centered at x,y
	the path is assumed to be a circle centered at 0,0 with the beginning of the path at 0 degrees.
	absolute coordinates from the path are used to map the texture to the path.
	start and end are path positions between 1 and 0.

	By assuming that the path is a circle, we can take shortcuts to save CPU.
	*/
	if (width && (path_end>start))
	{
	    var seglength,pathlength,xx,yy,x1,y1,x2,y2,r,dir,forkwidth,i;
	    pathlength=6.3*path_get_speed(path,0);
	    //seglength is a percentage of the path which makes up one segment.
	    seglength = (path_end-start)/round(width);
	    width=angle*.5;
	    forkwidth=0;
	    //we have to draw the path in two halves to get the gradient we want, and not a flat color.
	    repeat(2)
	    {
	        draw_primitive_begin(pr_trianglestrip)
	        for (i=start; i<=path_end; i+=seglength;)
	        {
	            r=path_get_speed(path,i);
	            dir=i*360+color;
	            xx=x+lengthdir_x(r,dir);
	            yy=y+lengthdir_y(r,dir);
	            draw_vertex_colour(xx,yy,c_white,fork);
            
	            //The code below handles particles
	            //if particles are enabled, some chance to throw a spark
	            if (arg12)
	            {
	                effect_lsparks(xx,yy,dir+90*sign(width),0,width,0,alpha,fork)
	            }
            
	            r+=width;
	            draw_vertex_colour(x+lengthdir_x(r,dir),y+lengthdir_y(r,dir),alpha,0);

	            //The code below handles forking the lightning.
	            //Don't fork the lightning if a fork has already occured,
	            if (!forkwidth)
	            {
	                //don't fork unless there is a path for it
	                if (path_exists(attractive))
	                {
	                    //odds are 1 fork per lightning
	                    if random_dice(width)
	                    {
	                        //capture the starting x and y of the fork
	                        x1=xx;
	                        y1=yy;
	                        //the ending x and y depends on whether there is metal nearby
	                        var metal=collision_circle(x1,y1,pathlength,enable,0,1);
	                        //half of all forks will hit the metal
	                        if (metal!=noone && choose(1,0))
	                        {
	                            x2=metal.x;
	                            y2=metal.y;
	                        }
	                        else
	                        {
	                            dir += 90-random(30);
	                            var dist = random(pathlength);
	                            x2=x1+lengthdir_x(dist,dir);
	                            y2=y1+lengthdir_y(dist,dir);
	                        }
	                        forkwidth=width*2;
	                    }
	                }
	            }
	        }
	        draw_primitive_end()
	        width*=-1;
	    }
	    //draw the fork AFTER finished with primitives in the current script
	    //this is important because nested primitives cause errors
	    if (forkwidth)
	    {
	        //don't waste memory drawing a path fork if it is really small.
	        //particles are only enabled for forks that are larger than 12 pixels wide.
	        seglength*=6*r;
	        if (forkwidth>6)
	        {
	            path_random(x1,y1,x2,y2,attractive,seglength,30+random(30),fx.curl);
	            draw_lightning_path(attractive,seglength,forkwidth,alpha,fork,-1,-1,arg12*(forkwidth>12),0);
	        }
	        else
	        {
	            draw_lightning_forked(x1,y1,x2,y2,seglength,merge_color(c_white,alpha,.3),30+random(30),fx.curl,enable);
	        }
	    }
	}



}

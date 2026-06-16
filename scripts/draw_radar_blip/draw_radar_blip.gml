/// @description draw_radar_blip(x,y,maxradius,maxdistance,instance id,color,alpha,#polygon sides,boolean hollow,rotation)
/// @param x
/// @param y
/// @param maxradius
/// @param maxdistance
/// @param instance id
/// @param color
/// @param alpha
/// @param #polygon sides
/// @param boolean hollow
/// @param rotation
function draw_radar_blip(radar_x, radar_y, maxradius, maxdistance, instance, color, alpha, polygon, boolean, rotation) {
	if instance_exists(instance)
	{
	    with instance
	    {
	        adist=point_distance(radar_x,radar_y,x,y);
	        if (adist<=maxdistance)
	        {
	            adist=min(adist/__view_get( e__VW.WPort, 0 ),1)*maxradius;
	            adir=point_direction(radar_x,radar_y,x,y);
	            arad=sqrt(adist);
	            if boolean
	            {
	                draw_ring_ext(radar_x+lengthdir_x(adist,adir),radar_y+lengthdir_y(adist,adir),arad/1.9,arad*1.1,polygon,rotation,rotation+360,color,color,alpha/2,alpha/2)
	                draw_ring_ext(radar_x+lengthdir_x(adist,adir),radar_y+lengthdir_y(adist,adir),arad/2,arad,polygon,rotation,rotation+360,color,color,alpha,alpha)
	            }
	            else
	            {
	                draw_polygon(radar_x+lengthdir_x(adist,adir),radar_y+lengthdir_y(adist,adir),sqrt(adist),polygon,rotation,color,color,alpha,alpha/2)
	                draw_polygon(radar_x+lengthdir_x(adist,adir),radar_y+lengthdir_y(adist,adir),sqrt(adist),polygon,rotation,color,color,alpha,alpha)
	            }
	        }
	    }
	}



}

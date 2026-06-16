/// @description selected_get_nearest(x,y)
/// @param x
/// @param y
function selected_get_nearest(x, y) {
	//returns the nearest selected object to x,y
	with camera
	{
	    if target_list_size>1
	    {
	        var dist,target,result;
	        //retrieve the object id
	        target=ds_list_find_value(target_list,1);
	        result=target;
            
	        if instance_exists(target)
	        {
	            dist=point_distance(x,y,target.x,target.y)
	        }
	        for (var i=2;i<target_list_size;i+=1)
	        {
	            //retrieve the object id
	            target=ds_list_find_value(target_list,i);
            
	            if instance_exists(target)
	            {
	                if point_distance(x,y,target.x,target.y)<dist
	                {
	                    result=target;
	                }
	            }
	        }
	        return result;
	    }
	    else
	    {
	        return noone;
	    }
	}



}

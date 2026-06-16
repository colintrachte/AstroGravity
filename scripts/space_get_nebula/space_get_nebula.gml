/// @description space_get_nebula(instance id to retrieve from)
/// @param instance id to retrieve from
function space_get_nebula(instance) {
	//retrieves the nebula background
	for (var i=0;i<instance.nebula_count;i+=1)
	{
	    nebula_x[i]=instance.nebula_x[i];
	    nebula_y[i]=instance.nebula_y[i];
	    nebula_r[i]=instance.nebula_r[i];
	    nebula_scale[i]=instance.nebula_scale[i];
	    nebula_color[i]=instance.nebula_color[i];
	}



}

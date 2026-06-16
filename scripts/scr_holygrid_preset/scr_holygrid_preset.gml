/// @description scr_holyrid_preset(grid id, preset id)
/// @param grid id
/// @param  preset id
function scr_holygrid_preset(grid, preset) {
	/*
	By Ground Effect Games
	This is a storage script for preset values that you may customize to fit your needs.
	You can edit this script to set up your grid however you want.
	I recommend using a separate preset script like this one for each grid,
	to keep track of which grid the presets are for.
	You will need an initializing preset(like case 0 below) for each holygrid you run.

	the grid works like a primitive excel spreadsheet.
	Each column represents a variable.
	Each row represents a copy of the holy equation that is calculated at intervals using scr_holygrid_step()
	A ds_grid is a fast 2D array. columns and rows use positive integers for indices (coordinates).
	*/

	switch preset
	{
	    case 0:{//case zero is what I use to initialize the grid
	    //scr_holygrid_set(grid id,row index,value,targetvalue,rate,islinear,threshold,endaction)
	    //                               0  1  2  3 4 //columns
	    scr_holygrid_set(grid,0,x,200,.08,0,2,0)//x position
	    scr_holygrid_set(grid,1,y,200,.08,0,2,0)//y position
	    scr_holygrid_set(grid,2,w,32,.08,0,2,0)//width
	    scr_holygrid_set(grid,3,h,32,.08,0,2,0)//height
	    scr_holygrid_set(grid,4,image_alpha,1,.01,0,.02,0)//image_alpha  (master alpha control)
	    scr_holygrid_set(grid,5,alpha,1,.01,0,.02,0)//icon alpha   (alpha control for the sprite only)
	    scr_holygrid_set(grid,6,q,1,.01,1,.02,0)//loading bar value
	        }break;
	    case 1:{//This sets all target values to a random number
	    //ds_grid_set(id,column,row,value) is a game maker function. you can use any ds_grid function.
	        ds_grid_set(grid,1,0,irandom(room_width));
	        ds_grid_set(grid,1,1,irandom(room_height));
	        ds_grid_set(grid,1,2,32+irandom(64));
	        ds_grid_set(grid,1,3,16+irandom(32));
	        ds_grid_set(grid,1,4,random(1));
	        ds_grid_set(grid,1,5,random(1));
	        ds_grid_set(grid,1,6,random(1));
	        }break;
	}



}

draw_spectrum_y(x-w[2]+1,ly,w[3],maxtotal,0,255,1,0)

draw_set_alpha(image_alpha)
draw_set_halign(fa_middle)
draw_set_valign(fa_middle)
draw_set_blend_mode(bm_add)

//draw the slider
draw_circle_colour(x+w[3],y,w[2],image_blend,c_black,0)
//draw the trail effect when the slider is moving to the left
var difference = s-targets;
if difference>0
{
    draw_line_width_colour(x,y,x,y+min(maxtotal-s,difference),w[3],image_blend,c_black)
    if abs(difference)>w[2]
    {
        draw_lightning_small(x+tolerance(w[2]),y,x+tolerance(w[1]*3),y+random_decrease(min(maxtotal-s,difference),.5),w[2],merge_color(image_blend,c_white,.5),30,0)
    }
}
//draw the trail effect when the slider is moving to the right
if difference<0
{
    draw_line_width_colour(x,y,x,y+max(minlimit-s,difference),w[3],image_blend,c_black)
    if abs(difference)>w[2]
    {
        draw_lightning_small(x+tolerance(w[2]),y,x+tolerance(w[1]*3),y+random_decrease(max(minlimit-s,difference),.5),w[2],merge_color(image_blend,c_white,.5),30,0)
    }
}

draw_set_blend_mode(bm_normal)
draw_set_color(c_black)
draw_triangle(x+w[0],y,x+w[2]+1,y-w[1],x+w[2]+1,y+w[1],0)
draw_set_alpha(.5)
draw_lightning_small(x-w[2]+1,y-1,x+w[0],y-1,w[1],image_blend,5,0)
draw_triangle(x+w[0]-1,y,x+w[2]+1,y-w[1]+1,x+w[2]+1,y+w[1]+1,0)
draw_set_color(image_blend)
draw_circle(x+w[3],y,w[1],0)
draw_circle(x+w[3],y,w[1]+1,0)
draw_set_alpha(1)
draw_set_color(c_white)


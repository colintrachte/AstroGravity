//It matters what order you place these drawing commands! They stack on top of each other.
//draw a rectangle
draw_set_alpha(alpha)
draw_set_color(c_white)
draw_rectangle(x1,y1,x2,y2,0)
//draw the loading bar horizontally along the top
draw_set_color(color);
draw_rectangle(x1,y1,x1+q*w*2,y1+4,0)
//draw a border around the button
draw_set_color(c_black)
draw_rectangle(x1,y1,x2,y2,1)
//draw the sprite for the button
draw_self()
//label the button and display the loading bar value
draw_text(x,y-margin,string_hash_to_newline(string(round(q*100))+"%"))
draw_reset()





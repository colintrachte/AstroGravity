//draw the label
draw_text(x,y-radius-12,string_hash_to_newline(label))

if action<3
{
    draw_radio_button(x,y,radius,parent_id.m[action]>0)
    draw_set_color(c_black)
    draw_set_valign(fa_middle)
    //for the drag/drop buttons, draw how many points you have left
    draw_text(x,y,string_hash_to_newline(string(parent_id.m[action])))
    draw_set_valign(fa_top)
    draw_set_color(c_white)
    
    //draw the tutorial text
    if parent_id.tutorial_active<3
    {
        draw_set_halign(fa_left)
        draw_text(x+parent_id.margin[1],y,string_hash_to_newline(tutorial))
        draw_set_halign(fa_middle)
    }
}

switch action
{
    case 3:
    {
        if parent_id.tutorial_active==action
        {
            draw_set_halign(fa_left)
            draw_text(x+parent_id.margin[1],y,string_hash_to_newline(tutorial))
            draw_set_halign(fa_middle)
        }
        
        var x1,y1,x2,y2,x3,y3;
        x1=x;
        y1=y+radius;
        x2=x+lengthdir_x(radius,30);
        y2=y+lengthdir_y(radius,30);
        x3=x+lengthdir_x(radius,150);
        y3=y+lengthdir_y(radius,150);
        
        draw_radio_button(x1,y1,12,selected)
        draw_radio_button(x2,y2,12,selected)
        draw_radio_button(x3,y3,12,selected)
        
        if selected
        {
            draw_set_alpha(.5)
            draw_line_width(x1,y1,x2,y2,3)
            draw_line_width(x2,y2,x3,y3,3)
            draw_line_width(x3,y3,x1,y1,3)
            draw_line_width(x1,y1,x2,y2,5)
            draw_line_width(x2,y2,x3,y3,5)
            draw_line_width(x3,y3,x1,y1,5)
            draw_set_alpha(1)
        }
    }
    break;
    
    case 4:
    {
        draw_radio_button(x,y,radius,0)
        if ds_list_size(parent_id.points_list)>2
        {
            draw_set_color(c_lime)
        }
        else
        {
            draw_set_color(c_black)
        }
        draw_checkmark(x,y+8,.25)
        draw_set_alpha(.5)
        draw_checkmark(x,y+8,.26)
        draw_set_alpha(1)
        draw_set_color(c_white)
    }
    break;
    
    case 5:
    {
        var r=radius/2.4;
        draw_radio_button(x,y,radius,0)
        draw_set_color(c_red)
        draw_line_width(x-lengthdir_x(r,45),y-lengthdir_y(r,45),x+lengthdir_x(r,45),y+lengthdir_y(r,45),3)
        draw_line_width(x-lengthdir_x(r,-45),y-lengthdir_y(r,-45),x+lengthdir_x(r,-45),y+lengthdir_y(r,-45),3)
        draw_set_color(c_white)
    }
    break;
}


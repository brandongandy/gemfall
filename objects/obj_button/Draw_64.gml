/// @description Insert description here
// You can write your code in this editor
//draw_set_color(merge_color(c_black, c_dkgrey, hover));

scr_nine_slice_box_stretched(
	spr_textbox_bg, 
	x - padding, 
	y - padding, 
	x + width + padding, 
	y + height + padding, 
	background);
//draw_rectangle(x, y, x + width, y + height, 0);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + width / 2, y + height / 2, text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//draw_set_color(c_white);
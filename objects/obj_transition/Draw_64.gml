if (transition_type == TRANSITION_TYPE.SLIDE)
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, width, percent * height_half, false);
	draw_rectangle(0, height, width, height - (percent * height_half), false);
}

if (transition_type == TRANSITION_TYPE.FADE)
{
	draw_set_color(c_black);
	draw_set_alpha(percent);
	draw_rectangle(0, 0, width, height, false)
	draw_set_alpha(1);
	
}
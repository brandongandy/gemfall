/// @description Draw Textbox
scr_nine_slice_box_stretched(spr_textbox_bg, x1, y1, x2, y2, background);

// remembder to call these ebfore drawing text
draw_set_font(font_text);
// draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _print = string_copy(text_message, 1, text_progress);

if (responses[0] != -1) && (text_progress >= string_length(text_message))
{
	for (var i = 0; i < array_length(responses); i++)
	{
		_print += "\n";
		if (i == response_selected)
		{
			_print += "> ";
		}
		else 
		{
			_print += "  ";
		}
		
		_print += responses[i];
		
		if (i == response_selected)
		{
			_print += " <";
		}
	}
}

draw_text_ext(x1 + 8, y1 + 8, _print, 12, RESOLUTION_W - (TILE_SIZE * 4) - 16);
draw_set_color(c_white);
draw_text_ext(x1 + 8, y1 + 7, _print, 12, RESOLUTION_W - (TILE_SIZE * 4) - 16);
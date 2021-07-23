/// @description Insert description here
// You can write your code in this editor
if (!global.i_journal.show_journal)
{
	exit;
}


if (point_in_rectangle(global.i_ui.mouse_pos_x,
	global.i_ui.mouse_pos_y,
	bbox_left,
	bbox_top,
	bbox_right,
	bbox_bottom))
{
	hover = true;
		
	if (mouse_check_button_released(mb_left))
	{
		with (obj_journal_item)
		{
			selected = false;
		}
			
		selected = true;
	}
	else
	{
		selected = false;
	}
}
else
{
	hover = false;
}

if (hover)
{
	depth = -10001;
	if (found)
	{
		image_index = 3;
	}
	else
	{
		image_index = 1;
	}
}
else
{
	depth = -10000;
	if (found)
	{
		image_index = 2;
	}
	else
	{
		image_index = 0;
	}
}

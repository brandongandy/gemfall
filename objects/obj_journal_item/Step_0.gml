/// @description Insert description here
// You can write your code in this editor
if (!global.i_journal.show_journal)
{
	exit;
}

if (journal_id != -1 && !set_vars)
{
	journal_name = global.i_inv.journal[# journal_id, JOURNAL_STAT.NAME];
	found = global.i_inv.journal[# journal_id, JOURNAL_STAT.FOUND];
	turned_in = global.i_inv.journal[# journal_id, JOURNAL_STAT.TURNED_IN];
	text = global.i_inv.journal[# journal_id, JOURNAL_STAT.TEXT];
	
	// only do once per instance, and skip to prevent too much work
	set_vars = true;
}

if (point_in_rectangle(global.i_mouse.pos_x,
	global.i_mouse.pos_y,
	bbox_left,
	bbox_top,
	bbox_right,
	bbox_bottom))
{
	hover = true;
		
	if (mouse_check_button_released(mb_left))
	{
		if (found)
		{
			obj_journal.selected_journal_text = text;
			obj_journal.selected_journal_turned_in = turned_in;
			obj_journal.selected_journal_name = journal_name;
		}
		else
		{
			obj_journal.selected_journal_text = "";
			obj_journal.selected_journal_turned_in = false;
			obj_journal.selected_journal_name = "???";
		}
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

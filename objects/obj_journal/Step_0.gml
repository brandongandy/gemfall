/// @description Insert description here
// You can write your code in this editor
if (room == rm_start_screen)
{
	exit;
}

if (!show_journal)
{
	if (!deactivated)
	{
		instance_deactivate_object(obj_journal_item);
		deactivated = true;
		global.i_mouse.draw_hand = false;
	}
}
else
{
	if (deactivated)
	{
		with (obj_journal_item)
		{
			set_vars = false;
		}
		instance_activate_object(obj_journal_item);
		deactivated = false;
		global.i_mouse.draw_hand = true;
	}
}

if (global.input.button_l2)
{
	if (global.i_ui.game_state = "IN_GAME")
	{
		show_journal = !show_journal;
		global.i_ui.draw_gui = !global.i_ui.draw_gui;
	}
	
	if (!show_journal)
	{
		current_page = 0;
		deactivated = false;
	}
}
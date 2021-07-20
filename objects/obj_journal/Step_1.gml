/// @description Insert description here
// You can write your code in this editor
if (room == rm_start_screen)
{
	exit;
}

if (global.input.button_l2)
{
	if (global.i_ui.game_state = "IN_GAME")
	{
		show_journal = !show_journal;
		global.i_ui.draw_gui = !global.i_ui.draw_gui;
	}
}
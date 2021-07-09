/// @description Insert description here
// You can write your code in this editor
with (obj_ui)
{
	draw_gui = true;
	if (game_state == "PAUSE")
	{
		pause_menu = false;
		with(obj_button)
		{
			instance_destroy();
		}
		scr_toggle_pause_game(false);
		game_state = "IN_GAME";
	}
	else
	{
		game_state = "IN_GAME";
	}
}

scr_toggle_pause_game(false);
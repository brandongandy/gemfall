/// @description Insert description here
// You can write your code in this editor
//show_debug_message("starting room");
switch (room)
{
	case rm_debug:
		{
			if (time_paused)
			{
				time_paused = false;
			}
			draw_daylight = false;
		}
		break;
	case rm_player_house:
		draw_daylight = false;
		break;
	default:
		{
			draw_daylight = false;
		}
		break;
}
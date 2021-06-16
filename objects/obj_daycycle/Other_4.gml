/// @description Insert description here
// You can write your code in this editor
//show_debug_message("starting room");
switch (room)
{
	case rm_village_outskirts_upper:
		{
			if (global.quest_status[? "MainQuest"] == 0)
			{
				seconds = 0;
				hours = 1;
				time_paused = true;
			}
			else
			{
				if (time_paused)
				{
					time_paused = false;
				}
			}
			draw_daylight = true;
		}
		break;
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
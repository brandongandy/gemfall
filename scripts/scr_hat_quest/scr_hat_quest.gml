// Scrip
function scr_hat_quest()
{
	var _has_hat = (global.i_lifted != noone) && (global.i_lifted.object_index == obj_hat)
	{
		switch (global.quest_status[? "TheHatQuest"])
		{
			case 0:
			{
				if (_has_hat)
				{
					// complete
					scr_new_textbox("Wow, you found my hat without me even asking you to!", 2);
					scr_new_textbox("You are a true hero indeed!", 2);
					global.quest_status[? "TheHatQuest"] = 2;
					with (obj_quest_npc)
					{
						sprite_index = spr_questy_hat;
					}
					with (obj_hat)
					{
						instance_destroy();
					}
					global.i_lifted = noone;
					with (obj_player)
					{
						sprite_idle = spr_player;
						sprite_run = spr_player_run;
					}
				}
				else
				{
					scr_new_textbox("Hello there! You look like a brave adventurer.", 2);
					scr_new_textbox_response("Could you help me find my missing hat?", 2, ["4:Yes", "5:No"]);
				}
			}
			break;
			case 1: // in progress
			{
				if (_has_hat)
				{
					// complete
					scr_new_textbox("Wow, you found my hat!", 2);
					scr_new_textbox("You are a true hero indeed!", 2);
					global.quest_status[? "TheHatQuest"] = 2;
					with (obj_quest_npc)
					{
						sprite_index = spr_questy_hat;
					}
					with (obj_hat)
					{
						instance_destroy();
					}
					global.i_lifted = noone;
					with (obj_player)
					{
						sprite_idle = spr_player;
						sprite_run = spr_player_run;
					}
				}
				else
				{
					// clue reminder
					scr_new_textbox("I think I left my hat in that scary cave\nto the north-east.", 2);
					scr_new_textbox("You might need some items to get there...", 2);
				}
			}
			break;
			case 2:
			{
				// thank
				scr_new_textbox("Thank you again for your help.", 2);
			}
			break;
		}
	}
}
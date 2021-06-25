// Scrip
//function scr_dungeon_01_quest()
//{
//	switch (global.quest_status[? "Dungeon01"])
//	{
//		case 0: // begin game
//		{
//			scr_new_textbox("You're finally awake. When you washed up on the riverbank we weren't sure if you would make it.", 1);
//			scr_new_textbox("It seems that was just the beginning. A strange cave has opened up in the hills and now monsters are pouring out.", 2);
//			scr_new_textbox("Please. Our village is in danger. We can't make it to the south bank because of the rocks.", 1);
//			scr_new_textbox_response("Can you investigate for us?", 1, ["7:Yes", "6:Another time."]);
//		}
//		break;
//		case 1: // refused to help
//		{
//			scr_new_textbox_response("Can you investigate for us?", 1, ["7:Yes", "6:Another time."]);
//		}
//		break;
//		case 2: // offered to help
//		{
//			scr_new_textbox("The cave is to the north, through the hills. Please, be careful.", 1);
//		}
//		break;
//		case 10:
//		{
//			scr_new_textbox("This must be part of the comet that fell from the sky the night before you washed ashore.", 1);
//			scr_new_textbox("It's teeming with a strange energy. This must be what created those monsters coming from the caves.", 1);
//			scr_new_textbox("Thank you for freeing us from the clutches of those creatures! This village owes you a great debt.", 1);
//			scr_set_quest_status("Dungeon01", 11);
//		}
//		break;
//		case 11:
//		{
//			scr_new_textbox("Hello, adventurer.", 1);
//		}
//		break;
//	}

//}

function scr_door_01()
{
	var _startx = 256;
	var _starty = 224;
	var _endx = 496;
	var _endy = 432;
	
	var _entity = collision_rectangle(_startx, _starty, _endx, _endy,
		obj_p_mob,
		false,
		true);
	
	if (_entity == noone)
	{
		open = true;
	}
}
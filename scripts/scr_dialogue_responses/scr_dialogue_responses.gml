/// @function scr_dialogue_responses( 
/// @param {string}	response	The ressonse to get
function scr_dialogue_responses(_response)
{
	switch (_response)
	{
		case 0:
			break;
		case 1:
			scr_new_textbox("I know!", 2);
			break;
		case 2:
			scr_new_textbox_response("Neither did I!", 2, ["0:I am truly vexed.", "3:Then we should free each other."]);
			break;
		case 3:
			scr_new_textbox("Another day, perhaps.", 2);
			break;
		case 4:
			{
				scr_new_textbox("Thanks!", 2);
				scr_new_textbox("I think I left it in that scary cave to\nthe north-east!", 2);
				global.quest_status[? "TheHatQuest"] = 1;
			}
			break;
		case 5:
			{
				scr_new_textbox("Aw, beans...", 1);
			}
			break;
		case 6:
			{
				scr_new_textbox("None of us can use a sword. Please help us.", 1);
				global.quest_status[? "Dungeon01"] = 1;
			}
			break;
		case 7:
		{
			scr_new_textbox("Thank you! When we regain access to the south village, we will be sure to repay you.", 1);
			global.quest_status[? "Dungeon01"] = 2;
		}
		break;
		default:
			break;
	}
}
// Scrip
function scr_player_use_equipped()
{
	switch (obj_inventory.equipped)
	{
		case ITEM.BOMB:
			scr_use_bomb();
		break;
		case ITEM.BOW:
			{
				state = scr_player_state_bow;
			}
		default:
		break;
	}
}

// Scrip
function scr_player_use_equipped()
{
	switch (obj_inventory.equipped)
	{
		case INVENTORY_ITEM.BOMB:
			scr_use_bomb();
		break;
		default:
		break;
	}
}

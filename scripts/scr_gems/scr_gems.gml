// Scrip
function scr_gems(){

}

/// 
function scr_is_gem_equipped()
{
	if (global.i_inv.equipped_gem == -1)
	{
		return false;
	}
	else
	{
		return true;
	}
}

function scr_use_equipped_gem()
{
	if (global.i_inv.equipped_gem == -1)
	{
		return;
	}
	
	switch (global.i_inv.equipped_gem)
	{
		case GEM.EXEMPLAR:
		{
			if (global.i_inv.g_mana > 0)
			{
				global.i_inv.g_mana--;
				state = scr_player_state_roll;
				move_distance_remaining = roll_distance;
			}
			break;
		}
		default:
			break;
	}
}
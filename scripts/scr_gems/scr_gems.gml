// Scrip
function scr_player_has_gem(_gem)
{
	if (_gem == undefined)
	{
		return false;
	}
	
	if (_gem >= GEM.TOTAL) || (_gem < 0)
	{
		return false;
	}
	
	return global.i_inv.inv_gems[# _gem, INVENTORY_STAT.OWNED];
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
	if (!scr_is_gem_equipped())
	{
		return;
	}
	
	switch (global.i_inv.equipped_gem)
	{
		case GEM.EXEMPLAR:
		{
			if (scr_spend_mana(MANA_TYPE.EMERALD, 1))
			{
				state = scr_player_state_roll;
				move_distance_remaining = roll_distance;
			}
			break;
		}
		case GEM.STRENGTH:
		{
			break;
		}
		case GEM.STAMINA:
		{
			break;
		}
		case GEM.SKYRIDER:
		{
			state = scr_player_state_float;
			break;
		}
		default:
			break;
	}
}
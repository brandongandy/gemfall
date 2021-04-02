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
			start_x = x;
			start_y = y;
			state = scr_player_state_float;
			break;
		}
		case GEM.TRAVELER:
		{
			var centerX = x - sprite_get_xoffset(sprite_index) + sprite_width / 2;
			var centerY = y - sprite_get_yoffset(sprite_index) + sprite_height / 2;
			// check for an entity to activate/use
			var _activateX = centerX + lengthdir_x(TILE_SIZE, direction);
			var _activateY = centerY + lengthdir_y(TILE_SIZE, direction);
			instance_create_layer(_activateX, _activateY, "Instances",
				obj_tile_selector);
			start_x = x;
			start_y = y;
			state = scr_player_state_teleport;
			break;
		}
		default:
			break;
	}
}
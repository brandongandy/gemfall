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
		case GEM.SCREAMING:
		{
			state = scr_player_state_screaming;
			break;
		}
		case GEM.SIREN:
		{
			state = scr_player_state_siren;
			break;
		}
		default:
			break;
	}
}

function scr_get_sprite_for_gem(_gem)
{
	switch (_gem)
	{
		case GEM.ARCANE_STEEL:
			// TODO
			break;
		case GEM.EXEMPLAR:
			return spr_gem_exemplar;
			break;
		case GEM.SCREAMING:
			return spr_gem_screaming;
			break;
		case GEM.SIREN:
			return spr_gem_siren;
			break;
		case GEM.SKYRIDER:
			return spr_gem_skyrider;
			break;
		case GEM.SPELLGUARD:
			// TODO
			break;
		case GEM.SPELLSLINGER:
			// TODO
			break;
		case GEM.STAMINA:
			// TODO
			break;
		case GEM.STONEHEART:
			// TODO
			break;
		case GEM.TRAVELER:
			return spr_gem_traveler;
			break;
		case GEM.VERDIGRIS:
			// TODO
			break;
		case GEM.VOIDSTEEL:
			// TODO
			break;
		default:
			return -1;
			break;
	}
}

// Used only for getting specific gems by a fake index, for instance in
// obj_inv_item
function scr_get_equippable_gem_by_index(_index)
{
	switch (_index)
	{
		case 0:
			return GEM.EXEMPLAR;
			break;
		case 1:
			return GEM.SCREAMING;
			break;
		case 2:
			return GEM.SIREN;
			break;
		case 3:
			return GEM.SKYRIDER;
			break;
		case 4:
			return GEM.TRAVELER;
			break;
		default:
			return -1;
			break;
	}
}
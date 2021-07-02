function Gem(_item_index) constructor
{
	item_index = _item_index;
	owned = false;
	mana_type = -1;
	mana_cost = 0;
	gem_name = "";
	description = "";
	
	Use = function()
	{
		return false;
	}
	
	Equip = function()
	{
		if (owned)
		{
			obj_inventory.equipped_gem = self;
			return true;
		}
		else
		{
			return false;
		}
	}
}

function Verdigris(_item_index) : Gem(_item_index) constructor
{
	gem_name = "Verdigris";
	description = "You feel a special power emanating from this oddly-hued gem. Just holding it lets you use the magic in other gems.";
}

function Exemplar(_item_index) : Gem(_item_index) constructor
{owned = true;
	mana_type = MANA_TYPE.EMERALD;
	mana_cost = 1;
	gem_name = "Exemplar";
	description = "Generates a burst of speed and agility, allowing you to dash through your enemies.";
	
	Use = function()
	{
		if (obj_inventory.mana[mana_type].Use(1))
		{
			with (obj_player)
			{
				state = scr_player_state_roll;
				move_distance_remaining = roll_distance;
			}
		}
	}
}

function Strength(_item_index) : Gem(_item_index) constructor
{
	mana_type = MANA_TYPE.RUBY;
	mana_cost = 1;
	gem_name = "Strength";
	description = "This gem fills you with strength. You can lift heavy objects and hit enemies harder.";

	Equip = function() { return false; }
}

function Stamina(_item_index) : Gem(_item_index) constructor
{
	mana_type = MANA_TYPE.SAPPHIRE;
	mana_cost = 1;
	gem_name = "Stamina";
	description = "This gem greatly enhances your stamina, allowing you to brave deep waters and fast currents.";
	
	Equip = function() { return false; }
}

function Screaming(_item_index) : Gem(_item_index) constructor
{
	mana_type = MANA_TYPE.RUBY;
	mana_cost = 5;
	gem_name = "Screaming";
	description = "Compresses the air around you and sends it out in a forceful shockwave, knocking back your enemies.";
	
	Use = function()
	{
		with (obj_player)
		{
			state = scr_player_state_screaming;
		}
	}
}

function Siren(_item_index) : Gem(_item_index) constructor
{
	mana_type = MANA_TYPE.EMERALD;
	mana_cost = 1;
	gem_name = "Siren";
	description = "Creates a vortex of air that pulls enemies and other objects toward you.";
	
	Use = function()
	{
		with (obj_player)
		{
			state = scr_player_state_siren;
		}
	}
}

function Skyrider(_item_index) : Gem(_item_index) constructor
{
	mana_type = MANA_TYPE.SAPPHIRE;
	mana_cost = 10;
	gem_name = "Skyrider";
	description = "Lifts you gently into the air and lets you walk through the sky.";
	
	Use = function()
	{
		with (obj_player)
		{
			start_x = x;
			start_y = y;
			state = scr_player_state_float;
		}
	}
}

function Traveler(_item_index) : Gem(_item_index) constructor
{
	mana_type = MANA_TYPE.SAPPHIRE;
	mana_cost = 1;
	gem_name = "Traveler";
	description = "Opens a gateway between two points in reality, allowing you to teleport to any place within sight.";
	
	Use = function()
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
	}
}

function Spellslinger(_item_index) : Gem(_item_index) constructor
{
	gem_name = "Spellslinger";
	description = "With the power of this gem, your mana sources fuse, allowing you to use any mana for any other gem.";
	
	Equip = function() { return false; }
}

function ArcaneSteel(_item_index) : Gem(_item_index) constructor
{
	gem_name = "Arcane Steel";
	description = "Empowers your attacks so they cleave through monsters more easily, dealing much greater damage than before. (Attack+)";

	Equip = function() { return false; }
}

function Voidsteel(_item_index) : Gem(_item_index) constructor
{
	gem_name = "Voidsteel";
	description = "With the power of this gem it feels like your weapon can cut through anything. (Attack++)";
	
	Equip = function() { return false; }
}

function Spellguard(_item_index) : Gem(_item_index) constructor
{
	gem_name = "Spellguard";
	description = "Surrounds you in a protective aura that softens the blows of your enemies. (Defense+);";
	
	Equip = function() { return false; }
}

function Stoneheart(_item_index) : Gem(_item_index) constructor
{
	gem_name = "Stoneheart";
	description = "You can withstand even the harshest blows now, thanks to the invisible hard shell created by this gem. (Defense++)";
	
	Equip = function() { return false; }
}

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
	
	return obj_inventory.gems[_gem].owned;
}

/// 
//function scr_is_gem_equipped()
//{
//	if (obj_inventory.equipped_gem == -1)
//	{
//		return false;
//	}
//	else
//	{
//		return true;
//	}
//}

//function scr_use_equipped_gem()
//{
//	if (!scr_is_gem_equipped())
//	{
//		return;
//	}
//	else
//	{
//		with (obj_inventory)
//		{
//			gems[equipped_gem].Use();
//		}
//	}
	
//	//switch (global.i_inv.equipped_gem)
//	//{
//	//	case GEM.EXEMPLAR:
//	//	{
//	//		if (scr_spend_mana(MANA_TYPE.EMERALD, 1))
//	//		{
//	//			state = scr_player_state_roll;
//	//			move_distance_remaining = roll_distance;
//	//		}
//	//		break;
//	//	}
//	//	case GEM.STRENGTH:
//	//	{
//	//		break;
//	//	}
//	//	case GEM.STAMINA:
//	//	{
//	//		break;
//	//	}
//	//	case GEM.SKYRIDER:
//	//	{
//	//		start_x = x;
//	//		start_y = y;
//	//		state = scr_player_state_float;
//	//		break;
//	//	}
//	//	case GEM.TRAVELER:
//	//	{
//	//		var centerX = x - sprite_get_xoffset(sprite_index) + sprite_width / 2;
//	//		var centerY = y - sprite_get_yoffset(sprite_index) + sprite_height / 2;
//	//		// check for an entity to activate/use
//	//		var _activateX = centerX + lengthdir_x(TILE_SIZE, direction);
//	//		var _activateY = centerY + lengthdir_y(TILE_SIZE, direction);
//	//		instance_create_layer(_activateX, _activateY, "Instances",
//	//			obj_tile_selector);
//	//		start_x = x;
//	//		start_y = y;
//	//		state = scr_player_state_teleport;
//	//		break;
//	//	}
//	//	case GEM.SCREAMING:
//	//	{
//	//		state = scr_player_state_screaming;
//	//		break;
//	//	}
//	//	case GEM.SIREN:
//	//	{
//	//		state = scr_player_state_siren;
//	//		break;
//	//	}
//	//	default:
//	//		break;
//	//}
//}

//function scr_get_sprite_for_gem(_gem)
//{
//	switch (_gem)
//	{
//		case GEM.ARCANE_STEEL:
//			// TODO
//			break;
//		case GEM.EXEMPLAR:
//			return spr_gem_exemplar;
//			break;
//		case GEM.SCREAMING:
//			return spr_gem_screaming;
//			break;
//		case GEM.SIREN:
//			return spr_gem_siren;
//			break;
//		case GEM.SKYRIDER:
//			return spr_gem_skyrider;
//			break;
//		case GEM.SPELLGUARD:
//			// TODO
//			break;
//		case GEM.SPELLSLINGER:
//			// TODO
//			break;
//		case GEM.STAMINA:
//			// TODO
//			break;
//		case GEM.STONEHEART:
//			// TODO
//			break;
//		case GEM.TRAVELER:
//			return spr_gem_traveler;
//			break;
//		case GEM.VERDIGRIS:
//			// TODO
//			break;
//		case GEM.VOIDSTEEL:
//			// TODO
//			break;
//		default:
//			return -1;
//			break;
//	}
//}

//// Used only for getting specific gems by a fake index, for instance in
//// obj_inv_item
//function scr_get_equippable_gem_by_index(_index)
//{
//	switch (_index)
//	{
//		case 0:
//			return GEM.EXEMPLAR;
//			break;
//		case 1:
//			return GEM.SCREAMING;
//			break;
//		case 2:
//			return GEM.SIREN;
//			break;
//		case 3:
//			return GEM.SKYRIDER;
//			break;
//		case 4:
//			return GEM.TRAVELER;
//			break;
//		default:
//			return -1;
//			break;
//	}
//}
// Scrip
function scr_add_item(_item)
{
	if (_item == undefined)
	{
		return;
	}
	
	switch (_item)
	{
		case obj_heart_container:
			scr_increase_max_hearts();
			break;
		case obj_bomb:
			scr_pickup_bomb(1);
			break;
		case obj_emerald_small:
			break;
	}
}

function scr_add_key(_dungeon)
{
	if (_dungeon != -1)
	{
		global.i_inv.keys[? _dungeon]++;
	}
}

function scr_use_key(_dungeon)
{
	if (global.i_inv.keys[? _dungeon] > 0)
	{
		global.i_inv.keys[? _dungeon]--;
		return true;
	}
	else
	{
		return false;
	}
}

/// @function			scr_get_sprite_for_item(_item)
/// @param {INVENTORY_ITEM} _item 
function scr_get_sprite_for_item(_item)
{
	switch (_item)
	{
		case INVENTORY_ITEM.BOMB:
			return spr_bomb;
		break;
		default:
		break;
	}
}

function scr_get_ammo(_item)
{
	switch (_item)
	{
		case INVENTORY_ITEM.BOMB:
			return obj_inventory.inv_items[# INVENTORY_ITEM.BOMB, INVENTORY_STAT.AMMO];
		break;
		default:
			return -1;
		break;
	}
}
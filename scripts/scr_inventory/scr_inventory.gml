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
/// @param {ITEM} _item 
function scr_get_sprite_for_item(_item)
{
	switch (_item)
	{
		case ITEM.BOMB:
			return spr_bomb;
		break;
		case ITEM.BOW:
			return spr_bow_inv;
		default:
			return spr_bomb;
		break;
	}
}

function scr_get_ammo(_item)
{
	switch (_item)
	{
		case ITEM.BOMB:
			return obj_inventory.inv_items[# ITEM.BOMB, INVENTORY_STAT.AMMO];
		break;
		case ITEM.BOW:
			return obj_inventory.inv_items[# ITEM.BOW, INVENTORY_STAT.AMMO];
		default:
			return -1;
		break;
	}
}

function scr_spend_ammo(_item_type, _amount)
{
	if (_item_type == undefined)
	{
		return false;
	}
	
	if (global.i_inv.inv_items[# _item_type, INVENTORY_STAT.USES_AMMO] == false)
	{
		// just let us use it if it doesn't use ammo
		return true;
	}
	
	if (global.i_inv.inv_items[# _item_type, INVENTORY_STAT.AMMO] - _amount >= 0)
	{
		global.i_inv.inv_items[# _item_type, INVENTORY_STAT.AMMO] -= _amount;
		return true;
	}
	else
	{
		return false;
	}
}

function scr_spend_mana(_mana_type, _amount)
{
	if (_mana_type == undefined)
	{
		return false;
	}
	
	if (_mana_type >= MANA_TYPE.TOTAL) || (_mana_type < 0)
	{
		return false;
	}
	
	if (global.i_inv.inv_mana[# _mana_type, MANA_STAT.CURRENT_MANA] - _amount >= 0)
	{
		global.i_inv.inv_mana[# _mana_type, MANA_STAT.CURRENT_MANA] -= _amount;
		return true;
	}
	else
	{
		return false;
	}
}

function scr_add_mana(_mana_type, _amount)
{
	if (_mana_type == undefined)
	{
		return false;
	}
	
	if (_mana_type >= MANA_TYPE.TOTAL) || (_mana_type < 0)
	{
		return false;
	}
	
	global.i_inv.inv_mana[# _mana_type, MANA_STAT.CURRENT_MANA] += _amount;

	global.i_inv.inv_mana[# _mana_type, MANA_STAT.CURRENT_MANA] =
		clamp(global.i_inv.inv_mana[# _mana_type, MANA_STAT.CURRENT_MANA], 0,
			global.i_inv.inv_mana[# _mana_type, MANA_STAT.MAX_MANA]);
}
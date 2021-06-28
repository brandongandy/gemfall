// Scrip
function scr_add_item(_item)
{
	// TODO: use built in item Add() functions instead
	// of this switch statement.
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
			obj_inventory.items[ITEM.BOMB].PickUp(1);
			break;
		case obj_sword:
			obj_inventory.items[ITEM.SWORD].owned = true;
			obj_player.equipped_weapon = obj_inventory.items[ITEM.SWORD];
			break;
		case obj_emerald_small:
			break;
	}
}

function scr_add_key(_dungeon)
{
	if (_dungeon == undefined)
	{
		_dungeon = global.i_inv.current_quest.quest_index;
	}
	
	if (_dungeon != -1)
	{
		global.i_inv.quests[_dungeon].keys++;
	}
}

function scr_use_key(_dungeon)
{
	if (global.i_inv.quests[_dungeon].keys > 0)
	{
		global.i_inv.quests[_dungeon].keys--;
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
	
	return obj_inventory.mana[_mana_type].Use(_amount);
}

/// Called by in-design elements such as obj_ruby_drop
function scr_add_mana(_mana_type, _amount)
{
	if (_mana_type == undefined)
	{
		return false;
	}
	
	return obj_inventory.mana[_mana_type].Recharge(_amount);
}
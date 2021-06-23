// Scrip
function scr_open_chest(_item, _count, _message, _quest, _quest_level)
{
	if (_item == undefined || _item == -1)
	{
		return;
	}
	
	if (activate.chest_state == CHEST_STATE.OPEN)
	{
		return;
	}
	
	if (global.i_lifted == noone)
	{
		if (activate.is_locked)
		{
			// check for locked state and make sure player has key
			if (_quest != undefined && !scr_use_key(_quest))
			{
				scr_new_textbox("You need a key to open this chest.", 1);
				return;
			}
		}
	
		activate.chest_state = CHEST_STATE.OPEN;
	
		//var _item_instance = instance_create_layer(obj_player.x, obj_player.y - 16, "Instances",
		//	_item);
		
		//scr_activate_chest_item(_item_instance.id, _message);
		
		scr_show_chest_item(obj_player.x, obj_player.y, _item, _message);
	
		if (_item == obj_key) && (_quest != undefined)
		{
			scr_add_key(_quest);
		}
		else
		{		
			for (var i = 0; i < _count; i++)
			{
				scr_add_item(_item);
			}
		}
		
		if (_quest != undefined)
		{
			global.i_inv.quests[_quest].SetProgressLevel(_quest_level);
		}
	}
}

function scr_pickup_and_hold(_item, _message, _quest, _quest_level)
{
	scr_show_chest_item(obj_player.x, obj_player.y, _item, _message);
	
	scr_add_item(_item);

	if (_quest != undefined)
	{
		global.i_inv.quests[_quest].SetProgressLevel(_quest_level);
	}
	
	with (activate)
	{
		instance_destroy();
	}
}
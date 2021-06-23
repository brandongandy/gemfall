// Scrip
function scr_door_trigger(_trigger_id)
{
	if (_trigger_id <= 0)
	{
		return;
	}
	
	var _opened = false;
	for (i = 0; i < instance_number(obj_door); i++)
	{
		var _door = instance_find(obj_door, i);
		if (_door != noone) && (_door.door_id == _trigger_id)
		{
			_door.open = true;
			_opened = true;
			break;
		}
	}
	instance_destroy();
}

function scr_door_unlock(_quest_name, _quest_level)
{
	var _quest = global.i_inv.quests[_quest_name];
	
	if (_quest.keys > 0)
	{
		_quest.keys--;
		
		_quest.SetProgressLevel(_quest_level);
		
		activate.open = true;
	}
	else
	{
		scr_new_textbox("You need a key to open this door.", 1);
	}
}
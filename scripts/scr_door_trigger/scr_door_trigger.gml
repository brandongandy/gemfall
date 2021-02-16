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
	if (global.i_inv.keys[? _quest_name] > 0)
	{
		global.i_inv.keys[? _quest_name]--;
		
		scr_set_quest_status(_quest_name, _quest_level);
		
		activate.open = true;
	}
	else
	{
		scr_new_textbox("You need a key to open this door.", 1);
	}
}
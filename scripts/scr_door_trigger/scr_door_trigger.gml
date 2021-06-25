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

/// @desc Checks within the given coordinate rect to see if any entityies are left.
/// If so, sets the calling door to be Open.
function scr_door_open_on_last_entity(_startx, _starty, _endx, _endy)
{
	var _entity = collision_rectangle(_startx, _starty, _endx, _endy,
		obj_p_mob,
		false,
		true);
	
	if (_entity == noone)
	{
		open = true;
	}
}
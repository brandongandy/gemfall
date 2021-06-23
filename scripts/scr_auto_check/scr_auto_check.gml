// Scrip
//function scr_check_all_slimes(_new_level)
//{
//	if (instance_number(obj_slime) <= 0)
//	{
//		open = true;
	
//		if (_new_level > 0)
//		{
//			scr_set_quest_status("Dungeon01", _new_level);
//		}
//	}
//}

/// @function												scr_check_dungeon_status(_dungeon_name, _value)
/// @param _dungeon_name (int)			The name of the dungeon to check, from the QUEST enum
/// @param _value (int)							The minimum level of progress to check
/// @description										Checks the progress of the given dungeon and returns true if it meets the desired value.
function scr_check_dungeon_status(_dungeon_name, _value)
{
	if (_dungeon_name == undefined)
	{
		return false;
	}
	
	var _quest = global.i_inv.quests[_dungeon_name];
		
	return _quest.progress >= _value;
}
/// @function												scr_check_dungeon_status(_value)
/// @param _value (int)							The minimum level of progress to check
/// @description										Checks the progress of the current dungeon and returns true if it meets the desired value.
function scr_check_current_dungeon_progress(_value)
{
	if (global.i_inv.current_quest == -1)
	{
		return;
	}
	
	if (global.i_inv.current_quest.progress >= _value)
	{
		for (i = 0; i < instance_number(obj_door); i++)
		{
			var _door = instance_find(obj_door, i);
			if (_door != noone) && (_door.door_level != -1)
			{
				if (_door.door_level <= _value)
				{
					_door.open = true;
				}
			}
		}
	}
}
/// @function												scr_check_dungeon_status(_dungeon_name, _value)
/// @param _dungeon_name (int)			The name of the dungeon to check, from the QUEST enum
/// @param _value (int)							The minimum level of progress to check
/// @description										Loops through all the doors in a room to open them if you've already done this part of the quest.
function scr_open_doors(_dungeon_name, _value)
{
	if (_dungeon_name == undefined)
	{
		return;
	}
	
	var _quest = global.i_inv.quests[_dungeon_name];
	
	if (_quest.progress >= _value)
	{
		for (i = 0; i < instance_number(obj_door); i++)
		{
			var _door = instance_find(obj_door, i);
			if (_door != noone) && (_door.door_level != -1)
			{
				if (_door.door_level <= _value)
				{
					_door.open = true;
				}
			}
		}
	}
}
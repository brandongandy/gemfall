// Scrip
function scr_check_all_slimes(_new_level)
{
	if (instance_number(obj_slime) <= 0)
	{
		open = true;
	
		if (_new_level > 0)
		{
			scr_set_quest_status("Dungeon01", _new_level);
		}
	}
}

/// @function												scr_check_dungeon_status(_dungeon_name, _value)
/// @param _dungeon_name (string)		The name of the dungeon to check
/// @param _value (int)							The minimum level of progress to check
/// @description										Loops through all the doors in a room to open them if you've already done this part of the quest.
function scr_check_dungeon_status(_dungeon_name, _value)
{
	if (global.quest_status[? _dungeon_name] == undefined)
	{
		return;
	}
	
	if (global.quest_status[? _dungeon_name] >= _value)
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
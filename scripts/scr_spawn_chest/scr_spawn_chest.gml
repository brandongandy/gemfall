// Scrip
function scr_spawn_chest(_x, _y, _item, _count, _message, _quest, _quest_level)
{
	with (instance_create_layer(_x, _y, "Instances", obj_chest))
	{
		entity_activate_args = [_item, _count, _message, _quest, _quest_level];
		if (_quest != -1) && (_quest_level > 0)
		{
			chest_level = [_quest, _quest_level];
		}
	}
	
	if (other.object_index == obj_door_trigger)
	{
		instance_destroy();
	}
}
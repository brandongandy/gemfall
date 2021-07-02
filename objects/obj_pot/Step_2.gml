/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (global.i_lifted != noone && global.i_lifted = self)
{
	if (show_shadow)
	{
		image_index++;
		show_shadow = false;
	}
}

if (thrown)
{
	var _hit_by_attack = ds_list_create();
	
	// get list of collided entities
	var _hits = instance_place_list(x, y, obj_p_entity, _hit_by_attack, false);
	
	if (_hits > 0)
	{
		// got a hit
		for (var i = 0; i < _hits; i++)
		{
			// if this hasn't been hit yet by this attack, then do it
			// pipe refers to ordinal inside ds_list
			var _hit_id = _hit_by_attack[| i];
			
			with (_hit_id)
			{
				if (object_is_ancestor(object_index, obj_p_mob))
				{
					hurt_mob(id, 15, other.id, 10);
				}
				else if (entity_hit_script != -1)
				{
					script_execute(entity_hit_script);
				}
			}
				
			instance_destroy();	
		}
	}
	
	ds_list_destroy(_hit_by_attack);
}
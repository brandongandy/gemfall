/// @description Insert description here
// You can write your code in this editor
if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number * .75)
{
	harmful = false;
}

if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number)
{
	instance_destroy();
}

if (harmful)
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
			
			// check to make sure it's not already in our main list
			if (ds_list_find_index(entities_hit_by_attack, _hit_id) == -1)
			{
				ds_list_add(entities_hit_by_attack, _hit_id);
				with (_hit_id)
				{	
						if (entity_hit_script != -1)
						{
							// first check the hit script no matter what
							// so mobs can determine their own hits
							script_execute(entity_hit_script);
						}
						else if (object_is_ancestor(object_index, obj_p_mob))
						{
							// if nothing, hit them with a default attack
							hurt_mob(id, 15, other.id, 32);
						}
				}
			}
		}
	}

	var _hit_player = place_meeting(x, y, obj_player);
	if (_hit_player) 
	{
		if (ds_list_find_index(entities_hit_by_attack, _hit_player) == -1)
		{
				ds_list_add(entities_hit_by_attack, _hit_player);
				scr_hurt_player(point_direction(x, y, obj_player.x, obj_player.y), TILE_SIZE, 1.5);
		}
	}
	
	ds_list_destroy(_hit_by_attack);
}

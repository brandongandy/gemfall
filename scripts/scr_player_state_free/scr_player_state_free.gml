// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_state_free()
{
	h_speed = lengthdir_x(input_magnitude * walk_speed, input_direction);
	v_speed = lengthdir_y(input_magnitude * walk_speed, input_direction);

	if (scr_player_collision())
	{
		time_to_push--;
	}
	else
	{
		time_to_push = 60;
	}
	
	if (time_to_push <= 0)
	{
		state = scr_player_state_push;
	}

	// Sprite update
	var old_sprite = sprite_index;
	if (input_magnitude != 0)
	{
		direction = input_direction;
		sprite_index = sprite_run;
	}
	else
	{
		sprite_index = sprite_idle;
	}

	if (old_sprite != sprite_index)
	{
		local_frame = 0;
	}

	// update image index
	scr_player_animate_sprite();
	
	// Attack logic
	if (key_attack)
	{
		if (equipped_weapon != -1)
		{
			state = scr_player_state_attack;
			state_attack = attack_slash;
		}
	}
	
	// "Use" key logic
	if (key_activate)
	{
		var centerX = x - sprite_get_xoffset(sprite_index) + sprite_width / 2;
		var centerY = y - sprite_get_yoffset(sprite_index) + sprite_height / 2;
		// check for an entity to activate/use
		var _activateX = centerX + lengthdir_x(10, direction);
		var _activateY = centerY + lengthdir_y(10, direction);
		// rect size for activation check
		var _activate_size = 4;
		var _activate_list = ds_list_create();
		activate = noone;
		var _entities_found = collision_rectangle_list(
			_activateX - _activate_size,
			_activateY - _activate_size,
			_activateX + _activate_size,
			_activateY + _activate_size,
			obj_p_entity,
			false,
			true,
			_activate_list,
			true
		);
		
		// if the first instance we find is "lifted", or no script, keep trying
		while (_entities_found > 0)
		{
			var _entity_check = _activate_list[| --_entities_found];
			if (_entity_check != global.i_lifted) &&
				(_entity_check.entity_activate_script != -1)
			{
				activate = _entity_check;
				break;
			}
		}
		
		ds_list_destroy(_activate_list);
		
		// if nothing, or something but no script
		if (activate == noone)
		{
			// if we're carrying something, throw it
			// or else use gem ability
			if (global.i_lifted != noone)
			{
				scr_player_throw();
			}
		}
		else
		{
			if (activate == obj_door) && (activate.auto_check_script)
			{
				// don't try to activate doors that activate themselves
				return;
			}
			// if script on entity, activate
			scr_execute_array(activate.entity_activate_script, activate.entity_activate_args);
			
			// if activated is npc, make it face Player
			if (activate.entity_npc)
			{
				with (activate)
				{
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
	}
	
	if (key_item)
	{
		if (global.i_lifted != noone)
		{
			scr_player_throw();	
		}
		else if (obj_inventory.equipped != -1)
		{
			with (obj_inventory)
			{
				equipped.Use();
			}
		}
	}
	
	if (key_gem)
	{
		with (obj_inventory)
		{
			if (equipped_gem != -1)
			{
				equipped_gem.Use();
			}
		}
	}
}
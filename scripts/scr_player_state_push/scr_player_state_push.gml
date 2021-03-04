// Scrip
function scr_player_state_push()
{
	sprite_idle = spr_player_carry;
	sprite_run = spr_player_carry_run;
	
	h_speed = lengthdir_x(input_magnitude * walk_speed, input_direction);
	v_speed = lengthdir_y(input_magnitude * walk_speed, input_direction);
	
	if (scr_player_collision())
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
			if (_entity_check.pushed != undefined) &&
				 (!_entity_check.pushed)
			{
				var _push_dir = point_direction(x, y, _entity_check.x, _entity_check.y);
				_push_dir = round(_push_dir / 90) * 90;
				scr_execute_array(_entity_check.entity_push_script, [_entity_check.id, _push_dir, 16]);
				break;
			}
		}
		
		ds_list_destroy(_activate_list);
	}
	else
	{
		sprite_idle = spr_player;
		sprite_run = spr_player_run;
		state = scr_player_state_free;
	}
}
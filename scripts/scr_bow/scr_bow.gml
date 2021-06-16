// we put the player in this state, instead of just calling the attack script
// in order to prevent user input from working while animating and shooting
function scr_player_state_bow() 
{
	scr_use_bow();
}

function scr_use_bow()
{
	attacking = true;
	// TODO: create bow anim
	if (sprite_index != spr_player_attack_slash)
	{
		sprite_index = spr_player_attack_slash;
		local_frame = 0;
		image_index = 0;
	}
	
	scr_player_animate_sprite();
	
	if (animation_end)
	{
		var _item = obj_inventory.items[ITEM.BOW];
		if (_item.SpendAmmo(1))
		{
			var centerX = x - sprite_get_xoffset(sprite_index) + sprite_width / 2;
			var centerY = y - sprite_get_yoffset(sprite_index) + sprite_height / 2;
			var _arrowX = centerX + lengthdir_x(16, direction);
			var _arrowY = centerY + lengthdir_y(16, direction);
			with (instance_create_layer(_arrowX, _arrowY, "Instances", obj_arrow))
			{
				direction = other.direction;
			}
		}
		state = scr_player_state_free;
		animation_end = false;
		attacking = false;
	}
}
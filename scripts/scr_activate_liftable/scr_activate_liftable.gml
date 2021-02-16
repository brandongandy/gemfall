/// @function
/// @desc
function scr_activate_liftable(_id)
{
	// don't try to lift if we already have lifted
	if (global.i_lifted == noone)
	{
		scr_player_act_animation(spr_player_lift, undefined);
		sprite_idle = spr_player_carry;
		sprite_run = spr_player_carry_run;
		global.i_lifted = _id;
		
		with (global.i_lifted)
		{
			lifted = true;
			// lets us carry objects between rooms
			persistent = true;
			entity_collides = false;
		}
	}
}

function scr_activate_liftable_with_message(_id, _message)
{
	var _item = _id.object_index;
	with (_id)
	{
		entity_shadow = false;
		instance_destroy();
	}
	scr_show_chest_item(x, y, _item, _message);
}

function scr_activate_quest_liftable(_id, _message, _quest, _quest_level)
{
	scr_activate_liftable_with_message(_id, _message);
	scr_add_item(_id.object_index);
	
	if (_quest != undefined)
	{
		scr_set_quest_status(_quest, _quest_level);
	}
}

function scr_activate_chest_item(_id, _message)
{
	if (global.i_lifted == noone)
	{
		obj_player.direction = 270;
		obj_player.last_state = state;
		obj_player.next_state = scr_player_state_hold_item;
		scr_player_act_animation(spr_player_lift, scr_new_textbox(_message, 2));
		sprite_idle = spr_player_carry;
		sprite_index = sprite_idle;
		global.i_lifted = _id;
		
		with (global.i_lifted)
		{
			lifted = true;
			entity_collides = false;
		}
	}
}

function scr_show_chest_item(_x, _y, _item, _message)
{
	if (global.i_lifted == noone)
	{
		obj_player.direction = 270;
		obj_player.last_state = scr_player_state_free;
		obj_player.next_state = scr_player_state_hold_item;
		scr_player_act_animation(spr_player_lift, undefined);
		scr_new_textbox(_message, 2);
		obj_player.sprite_idle = spr_player_carry;
		obj_player.sprite_index = obj_player.sprite_idle;
		global.held_item = instance_create_layer(_x, _y - 13, "Instances", obj_p_entity);
		with (global.held_item)
		{
			entity_shadow = false;
			sprite_index = object_get_sprite(_item);
			image_speed = 0;
			image_index = 0;
		}
	}
}
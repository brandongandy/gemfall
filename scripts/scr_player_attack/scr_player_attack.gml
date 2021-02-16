// hit detection used by various attacks
// use attack hitbox to check for hits
function calc_attack(_attack_hitbox)
{
	// temporaily use collision mask of htbox sprite
	mask_index = _attack_hitbox;
	
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
						hurt_mob(id, other.base_damage, other.id, other.base_knockback);
					}
				}
			}
		}
	}
	
	ds_list_destroy(_hit_by_attack);
	
	// set mask back to player sprite
	mask_index = spr_player;
}

function hurt_mob(_mob_id, _damage, _source, _knockback)
{
	with(_mob_id)
	{
		// if not already dying...
		if (state != MOB_STATE.DIE)
		{
			mob_hp -= _damage;
			flash = 1;
			
			// hurt or kill
			if (mob_hp <= 0)
			{
				state = MOB_STATE.DIE;
			}
			else
			{
				if (state != MOB_STATE.HURT)
				{
					state_previous = state;
				}
				state = MOB_STATE.HURT;
			}
				
			image_index = 0;
			if (_knockback != 0)
			{
				var _knock_dir = point_direction(x, y, (_source).x, (_source).y);
				// subtracting moves away from the source
				x_to = x - lengthdir_x(_knockback, _knock_dir);
				y_to = y - lengthdir_y(_knockback, _knock_dir);
			}
		}
	}
}

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack_slash()
{
	attacking = true;
	// start attack
	if (sprite_index != spr_player_attack_slash)
	{
		// set up animation
		sprite_index = spr_player_attack_slash;
		local_frame = 0;
		image_index = 0;
		
		// clear list of entities hit by this attack
		if (!ds_exists(entities_hit_by_attack, ds_type_list))
		{
			entities_hit_by_attack = ds_list_create();
		}
		
		ds_list_clear(entities_hit_by_attack);
		
	}
	
	calc_attack(spr_player_attack_slash_hb);
	
	// update sprite
	scr_player_animate_sprite();
	
	if (animation_end)
	{
		state = scr_player_state_free;
		animation_end = false;
		attacking = false;
	}
}

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_attack_spin()
{

}
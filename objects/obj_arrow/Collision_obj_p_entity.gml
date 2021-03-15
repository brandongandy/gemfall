/// @description Insert description here
// You can write your code in this editor
with (other)
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

instance_destroy();
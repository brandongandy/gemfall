/// @description Determine Drops
/// Need to determine if the player is hurt, or if we just want to drop money

// flip a coin twice - first to see if we check for heart drop or money
var _drop_chance = choose(0, 1);
if (global.i_inv.player_health < global.i_inv.player_health_max) &&
	 (_drop_chance)
{
	// then to see if we actually do drop a heart
	_drop_chance = choose(0, 1);
	if (_drop_chance)
	{
		entity_drop_list = [obj_heart];
		scr_drop_items(x, y, entity_drop_list);
	}
}
else
{
	if (entity_drop_list != -1)
	{
		_drop_chance = random_range(0.0, 1.0);
		if (_drop_chance < entity_drop_chance)
		{
			var _item = entity_drop_list[irandom(array_length(entity_drop_list) - 1)];
			scr_drop_items(x, y, [_item]);
		}
	}
}
// Scrip
function scr_player_state_teleport()
{
	if (key_attack)
	{
		if (instance_exists(obj_tile_selector))
		{
			with (obj_tile_selector)
			{
				instance_destroy();
			}
		}
		state = scr_player_state_free;
	}
}
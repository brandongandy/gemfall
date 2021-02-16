/// @description Entity Loop

if (!global.game_paused)
{
	depth = -(bbox_bottom - elevation);

	if (lifted) && (instance_exists(obj_player))
	{
		// make sure we're not in the process of lifting still
		if (obj_player.sprite_index != spr_player_lift)
		{
			x = obj_player.x;
			y = obj_player.y;
			z = 13;
			depth = obj_player.depth - 1;
		}
	}
	
	if (!lifted) 
	{
		if (thrown)
		{
			instance_destroy();
		}
	}
}
flash = max(flash - 0.08, 0);

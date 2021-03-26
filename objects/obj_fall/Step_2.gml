/// @description Check for Collision
if (!global.game_paused) && (active)
{
	if (player_entered) && (!fallen)
	{
		fallen = true;
		global.target_room = target_room;
		global.target_x = target_x;
		global.target_y = target_y;
		if (target_dir != -1)
		{
			global.target_dir = target_dir;
		}
		else
		{
			global.target_dir = obj_player.direction;
		}
			
		if (is_pit)
		{
			with (obj_player)
			{
				scr_player_act_animation(spr_player_fall, scr_fall_and_respawn);
			}
		}
	}
	else if (!position_meeting(obj_player.x, obj_player.y, id))
	{
		fallen = false;
		player_entered = false;
	}
}
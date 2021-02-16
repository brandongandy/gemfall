/// @description Insert description here
// You can write your code in this editor
if (trap_timer >= trap_timer_interval)
{
	trap_timer = 0;
	spikes_out = !spikes_out;
}
else
{
	trap_timer++;
}

image_index = spikes_out;

if (spikes_out)
{
	if (instance_place(x, y, obj_player))
	{
		if (obj_player.state != scr_player_state_roll)
		{
			scr_hurt_player(point_direction(x, y, obj_player.x, obj_player.y), 16, 0.5, 5, 0.5);
		}
	}
}
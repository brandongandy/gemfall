// Scrip
function player_poisoned()
{
	if (++status_counter >= room_speed)
	{
		status_counter = 0;
		status_duration--;
		
		if (status_duration <= 0)
		{
			status_effect = -1;
			exit;
		}
		else
		{
			scr_hurt_player(direction, 0.25, 1);
		}
	}
}
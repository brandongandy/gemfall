// Scrip
function scr_increase_max_hearts()
{
	with (global.i_inv)
	{
		player_heart_pieces++;
		player_health_max += 2;
		player_health += 2;
	}
}

function scr_heal_player(_amount)
{
	with (global.i_inv)
	{
		player_health = min(player_health + _amount, player_health_max);
	}
}
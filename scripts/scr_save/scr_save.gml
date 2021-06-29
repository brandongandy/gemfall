// Scrip
function save_game()
{
	var _save_data = array_create(0);
	
	var _daycycle = new DayData();
	_daycycle.seconds = global.i_daycycle.seconds;
	_daycycle.minutes = global.i_daycycle.minutes;
	_daycycle.hours = global.i_daycycle.hours;
	_daycycle.day = global.i_daycycle.day;
	_daycycle.season = global.i_daycycle.season;
	_daycycle.year = global.i_daycycle.year;
	
	with (obj_inventory)
	{
		var _save =
		{
			player_heart_pieces : player_heart_pieces,
			player_health : player_health,
			mana : mana,
			player_money : player_money,
			current_quest : current_quest,
			quests : quests,
			equipped : equipped,
			items : items,
			equipped_gem : equipped_gem,
			gems : gems,
			inventory : inventory,
			gem_inventory : gem_inventory,
			daycycle: _daycycle
		}
		array_push(_save_data, _save);
	}
	
	var _json = json_stringify(_save_data);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, "sav01.sav");
	buffer_delete(_buffer);
	
	show_debug_message("Game saved: " + _json);
}
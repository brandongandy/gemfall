// Scrip
function save_game()
{
	var _save_data = array_create(0);
	var _save_date = date_current_datetime();
	
	var _daycycle = new DayData();
	_daycycle.seconds = global.i_daycycle.seconds;
	_daycycle.minutes = global.i_daycycle.minutes;
	_daycycle.hours = global.i_daycycle.hours;
	_daycycle.day = global.i_daycycle.day;
	_daycycle.season = global.i_daycycle.season;
	_daycycle.year = global.i_daycycle.year;
	
	with (obj_inventory)
	{
		var _jrnl = ds_grid_create(100, JOURNAL_STAT.TOTAL);
		for (i = 0; i < 100; i++)
		{
			_jrnl[# i, JOURNAL_STAT.FOUND] = journal[# i, JOURNAL_STAT.FOUND];
			_jrnl[# i, JOURNAL_STAT.TURNED_IN] = journal[# i, JOURNAL_STAT.TURNED_IN];
		}
		var _save =
		{
			save_date : _save_date,
			save_id : save_id,
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
			mana_inventory : mana_inventory,
			daycycle: _daycycle,
			journal: ds_grid_write(_jrnl)
		}
		array_push(_save_data, _save);
	}
	
	var _json = json_stringify(_save_data);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, "gemfall_" + string(obj_inventory.save_id) + ".sav");
	buffer_delete(_buffer);
	
	show_debug_message("Game saved: " + _json);
	ds_grid_destroy(_jrnl);
}

function load_game_data(_save_id)
{
	var _sav = "gemfall_" + string(_save_id) + ".sav";
	if (file_exists(_sav))
	{
		var _buffer = buffer_load(_sav);
		var _str = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);

		var _load_data = json_parse(_str);
		return _load_data;
	}
	else
	{
		return -1;
	}
}

function load_game(_save_data)
{
	//var _sav = array_pop(_save_data);
	with (obj_inventory)
	{
		save_id = _save_data.save_id;
		player_heart_pieces = _save_data.player_heart_pieces;
		player_health_max = 6 + (2 * player_heart_pieces);
		player_health = _save_data.player_health;
		
		// iterating through the array should be sufficient for this
		// since the values of the structs are initialized originally based on
		// enum index, and this index matches the index inside the array
		// unless someone manually changes the save file......
		for (i = 0; i < array_length(mana); i++)
		{
			mana[i].can_use = _save_data.mana[i].can_use;
			mana[i].mana = _save_data.mana[i].mana;
		}
		
		//while (array_length(_save_data.mana) > 0)
		//{
		//	var _mana = array_pop(_save_data.mana);
		//	switch (_mana.mana_type)
		//	{
		//		case MANA_TYPE.RUBY:
		//			mana[MANA_TYPE.RUBY].can_use = _mana.can_use;
		//			mana[MANA_TYPE.RUBY].mana = _mana.mana;
		//			break;
		//		case MANA_TYPE.SAPPHIRE:
		//			mana[MANA_TYPE.SAPPHIRE].can_use = _mana.can_use;
		//			mana[MANA_TYPE.SAPPHIRE].mana = _mana.mana;
		//			break;
		//		case MANA_TYPE.EMERALD:
		//			mana[MANA_TYPE.EMERALD].can_use = _mana.can_use;
		//			mana[MANA_TYPE.EMERALD].mana = _mana.mana;
		//			break;
		//		default:
		//			break;
		//	}
		//}
		//mana = _save_data.mana;
		player_money = _save_data.player_money;
		
		for (i = 0; i < array_length(quests); i++)
		{
			quests[i].keys = _save_data.quests[i].keys;
			quests[i].progress = _save_data.quests[i].progress;
		}
		current_quest = _save_data.current_quest;
		
		for (i = 0; i < array_length(items); i++)
		{
			items[i].ammo = _save_data.items[i].ammo;
			items[i].max_ammo = _save_data.items[i].max_ammo;
			items[i].owned = _save_data.items[i].owned;
		}
		if (_save_data.equipped != -1)
		{
			equipped = items[_save_data.equipped.item_index];
		}
		else
		{
			equipped = -1;
		}
		
		for (i = 0; i < array_length(gems); i++)
		{
			gems[i].owned = _save_data.gems[i].owned;
		}
		if (_save_data.equipped_gem != -1)
		{
			equipped_gem = gems[_save_data.equipped_gem.item_index];
		}
		else
		{
			equipped_gem = -1;
		}
		
		for (i = 0; i < array_length(inventory); i++)
		{
			inventory[i] = _save_data.inventory[i];
		}
		
		for (i = 0; i < array_length(gem_inventory); i++)
		{
			gem_inventory[i] = _save_data.gem_inventory[i];
		}
		
		var _jrnl = ds_grid_read(_save_data.journal);
		for (i = 0; i < 100; i++)
		{
			journal[# i, JOURNAL_STAT.FOUND] = _jrnl[# i, JOURNAL_STAT.FOUND];
			journal[# i, JOURNAL_STAT.TURNED_IN] = _jrnl[# i, JOURNAL_STAT.TURNED_IN];
		}
	}
	
	with (obj_daycycle)
	{
		seconds = _save_data.daycycle.seconds;
		minutes = _save_data.daycycle.minutes;
		hours = _save_data.daycycle.hours;
		day = _save_data.daycycle.day;
		season = _save_data.daycycle.season;
		year = _save_data.daycycle.year;
	}
	
	
	//obj_ui.draw_gui = true;
	//scr_toggle_pause_game(false);
	room_goto(rm_player_house);
}
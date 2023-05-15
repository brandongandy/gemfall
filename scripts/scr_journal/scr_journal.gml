enum JOURNAL_STAT
{
	NAME,
	FOUND,
	TURNED_IN,
	TEXT,
	TOTAL
}

function init_journal()
{
	journal = ds_grid_create(100, JOURNAL_STAT.TOTAL);
	
	// for now, just init default values
	for (i = 0; i < 100; i++)
	{
		journal[# i, JOURNAL_STAT.NAME] = "??";
		journal[# i, JOURNAL_STAT.FOUND] = false;
		journal[# i, JOURNAL_STAT.TURNED_IN] = false;
		journal[# i, JOURNAL_STAT.TEXT] = "??";
	}
	
	journal[# 0, JOURNAL_STAT.NAME] = "Maru's Journal";
	journal[# 0, JOURNAL_STAT.FOUND] = false;
	journal[# 0, JOURNAL_STAT.TURNED_IN] = false;
	journal[# 0, JOURNAL_STAT.TEXT] = 
		"A strange comet just shot across the night sky. " + 
		"It glowed in every color and popped and sparked " + 
		"like a giant ember. Pieces of it fell to the earth. " + 
		"One of them landed not far from here, to the East " + 
		"toward Elder Yuchiq's home. I'm going to investigate " + 
		"and make sure he is safe. If I'm still gone and you find this " + 
		"note, sister, then it may not be safe outside. " + 
		"Please wait for daylight before you come looking for me.";
	
	
	return journal;
}

function pickup_journal(_journal_id)
{
	if (_journal_id < 0 || _journal_id > 100)
	{
		exit;
	}
	
	global.i_inv.journal[# _journal_id, JOURNAL_STAT.FOUND] = true;
	
	global.found_journal_id = _journal_id;
	scr_new_textbox_response("You found a piece of someone's journal! Press TAB to open "
		+ "the journal screen. Would you like to read it now?",
		1,
		["1:Yes", "2:No"]);
	
	with (activate)
	{
		instance_destroy();
	}
	
}
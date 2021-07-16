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
	
	return journal;
}

function scr_journal() constructor
{
	journal_id = 0;
	found = false;
	name = "";
	text = "";
}
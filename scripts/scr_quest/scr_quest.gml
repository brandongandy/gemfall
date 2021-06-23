function Quest(_quest_index) constructor
{
	// a Quest struct holds data used to determine and store
	// dungeon and overworld progression.
	// areas will be locked away; items spawned or despawned;
	// creatures spawned or despawned; etc., depending on these
	// quest statuses.
	
	// the index of the quest in the QUEST enum
	// used for Inventory and getter purposes
	quest_index = _quest_index;
	
	// the name of the quest - for display purposes
	name = "";
	
	// how many keys have been collected for this dungeon or quest
	keys = 0;
	
	// the overall status - an integer representing progression
	progress = 0;
	
	IncrementProgress = function()
	{
		progress++;
	}
	
	SetProgressLevel = function(_level)
	{
		progress = _level;
	}
}

function MainQuest() : Quest(QUEST.MAINQUEST) constructor
{
	name = "Main Quest";
}
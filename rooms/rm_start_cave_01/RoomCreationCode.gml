global.i_inv.current_quest = global.i_inv.quests[QUEST.DUNGEON00];
global.current_room = "Gemfall Caverns";

if (global.i_inv.current_quest.progress <= 0)
{
	instance_create_layer(128, 584, "Instances", obj_sword);
}
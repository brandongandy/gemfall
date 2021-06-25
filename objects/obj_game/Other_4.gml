/// @desc Layer Management, Quest Setup   
/// Make sure the collision layer is invisible, just in case
/// Then, on certain rooms, add or remove objects based on main quest progression
/// for instance, at start of game we want some objects to block player movement
/// past the starting area
layer_set_visible("ColHeight", false);

// force to false - set in a room if needed
obj_daycycle.force_draw = false;

switch (room)
{
	case rm_start_screen:
	{
		create_button(10, 10,
			56,
			16,
			"Start New Game",
			btn_new_game);
	}
	break;
	case rm_village_outskirts_upper:
	{
		if (global.i_inv.quests[QUEST.MAINQUEST].progress == 0)
		{
			// create stones - blocking
			instance_create_layer(256, 216, "Instances", obj_stone_01);
			instance_create_layer(752, 48, "Instances", obj_stone_01);
			instance_create_layer(768, 48, "Instances", obj_stone_01);
			instance_create_layer(776, 408, "Instances", obj_stone_01);
			instance_create_layer(792, 408, "Instances", obj_stone_01);
			instance_create_layer(1352, 384, "Instances", obj_stone_01);
			instance_create_layer(1352, 400, "Instances", obj_stone_01);
			instance_create_layer(1528, 184, "Instances", obj_stone_01);
			instance_create_layer(1528, 200, "Instances", obj_stone_01);
				
			// create stones - for appearance
			instance_create_layer(1232, 328, "Instances", obj_stone_01);
			instance_create_layer(1056, 360, "Instances", obj_stone_01);
			instance_create_layer(920, 136, "Instances", obj_stone_01);
			instance_create_layer(528, 336, "Instances", obj_stone_01);
			instance_create_layer(336, 112, "Instances", obj_stone_01);
			
			obj_daycycle.force_draw = true;
		}
	}
	break;
	case rm_start_cave_01:
	{
		if (!global.i_inv.items[ITEM.SWORD].owned)
		{
			instance_create_layer(392, 584, "Instances", obj_sword);
		}
	}
	break;
	default:
		break;
}
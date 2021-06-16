//function scr_use_bomb()
//{
//	if (global.i_lifted == noone)
//	{
//		if (obj_inventory.inv_items[# ITEM.BOMB, INVENTORY_STAT.AMMO] > 0)
//		{
//			show_debug_message("making bomb");
//			var _bomb = instance_create_layer(x, y, "Instances", obj_bomb);
//			scr_activate_liftable(_bomb);
			
//			obj_inventory.inv_items[# ITEM.BOMB, INVENTORY_STAT.AMMO]--;
//		}
//	}
//}

function scr_pickup_bomb(_amount)
{
	obj_inventory.items[ITEM.BOMB].PickUp(_amount);
}
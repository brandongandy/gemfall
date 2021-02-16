function scr_use_bomb()
{
	if (global.i_lifted == noone)
	{
		if (obj_inventory.inv_items[# INVENTORY_ITEM.BOMB, INVENTORY_STAT.AMMO] > 0)
		{
			var _bomb = instance_create_layer(x, y, "Instances", obj_bomb);
			scr_activate_liftable(_bomb);
			
			obj_inventory.inv_items[# INVENTORY_ITEM.BOMB, INVENTORY_STAT.AMMO]--;
		}
	}
}

function scr_pickup_bomb(_amount)
{
	if (!obj_inventory.inv_items[# INVENTORY_ITEM.BOMB, INVENTORY_STAT.OWNED])
	{
		obj_inventory.inv_items[# INVENTORY_ITEM.BOMB, INVENTORY_STAT.OWNED] = true;
	}
	
	obj_inventory.inv_items[# INVENTORY_ITEM.BOMB, INVENTORY_STAT.AMMO] += _amount;
}
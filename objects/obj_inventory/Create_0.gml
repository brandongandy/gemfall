/// @description Insert description here
// You can write your code in this editor

// player health modifiers
player_heart_pieces = 0;

// player health
player_health_max = 3.0 + (1 * player_heart_pieces);
player_health = player_health_max;

// moneys
player_money = 0;

// keys, per dungeon
keys = ds_map_create();
keys[? "Dungeon01"] = 0;

// inventory items
equipped = INVENTORY_ITEM.BOMB;

inv_items = ds_grid_create(INVENTORY_ITEM.TOTAL, INVENTORY_STAT.TOTAL);

inv_items[# INVENTORY_ITEM.BOMB, INVENTORY_STAT.DAMAGE] = 5;
inv_items[# INVENTORY_ITEM.BOMB, INVENTORY_STAT.USES_AMMO] = true;
inv_items[# INVENTORY_ITEM.BOMB, INVENTORY_STAT.AMMO] = 1;
inv_items[# INVENTORY_ITEM.BOMB, INVENTORY_STAT.OWNED] = false;

inv_items[# INVENTORY_ITEM.BOW, INVENTORY_STAT.DAMAGE] = 5;
inv_items[# INVENTORY_ITEM.BOW, INVENTORY_STAT.USES_AMMO] = true;
inv_items[# INVENTORY_ITEM.BOW, INVENTORY_STAT.AMMO] = 0;
inv_items[# INVENTORY_ITEM.BOW, INVENTORY_STAT.OWNED] = false;
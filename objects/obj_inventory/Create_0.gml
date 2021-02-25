/// @description Insert description here
// You can write your code in this editor

// player health modifiers
player_heart_pieces = 0;

// player health
player_health_max = 3.0 + (1 * player_heart_pieces);
player_health = player_health_max;

// mana
inv_mana = ds_grid_create(MANA_TYPE.TOTAL, MANA_STAT.TOTAL);
inv_mana[# MANA_TYPE.RUBY, MANA_STAT.MAX_MANA] = 100;
inv_mana[# MANA_TYPE.RUBY, MANA_STAT.CURRENT_MANA] = 100;
inv_mana[# MANA_TYPE.SAPPHIRE, MANA_STAT.MAX_MANA] = 100;
inv_mana[# MANA_TYPE.SAPPHIRE, MANA_STAT.CURRENT_MANA] = 100;
inv_mana[# MANA_TYPE.EMERALD, MANA_STAT.MAX_MANA] = 100;
inv_mana[# MANA_TYPE.EMERALD, MANA_STAT.CURRENT_MANA] = 100;


// moneys
player_money = 0;

// keys, per dungeon
keys = ds_map_create();
keys[? "Dungeon01"] = 0;

// inventory items
equipped = ITEM.BOMB;

inv_items = ds_grid_create(ITEM.TOTAL, INVENTORY_STAT.TOTAL);

inv_items[# ITEM.BOMB, INVENTORY_STAT.DAMAGE] = 5;
inv_items[# ITEM.BOMB, INVENTORY_STAT.USES_AMMO] = true;
inv_items[# ITEM.BOMB, INVENTORY_STAT.AMMO] = 1;
inv_items[# ITEM.BOMB, INVENTORY_STAT.OWNED] = true;
inv_items[# ITEM.BOMB, INVENTORY_STAT.MANA_TYPE] = -1;
inv_items[# ITEM.BOMB, INVENTORY_STAT.MANA_COST] = -1;

inv_items[# ITEM.BOW, INVENTORY_STAT.DAMAGE] = 5;
inv_items[# ITEM.BOW, INVENTORY_STAT.USES_AMMO] = true;
inv_items[# ITEM.BOW, INVENTORY_STAT.AMMO] = 0;
inv_items[# ITEM.BOW, INVENTORY_STAT.OWNED] = false;
inv_items[# ITEM.BOW, INVENTORY_STAT.MANA_TYPE] = -1;
inv_items[# ITEM.BOW, INVENTORY_STAT.MANA_COST] = -1;

// gems
equipped_gem = -1;

inv_gems = ds_grid_create(GEM.TOTAL, INVENTORY_STAT.TOTAL);

inv_gems[# GEM.EXEMPLAR, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.EXEMPLAR, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.EXEMPLAR, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.EXEMPLAR, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.EXEMPLAR, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_gems[# GEM.EXEMPLAR, INVENTORY_STAT.MANA_COST] = 1;

inv_gems[# GEM.STRENGTH, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.STRENGTH, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.STRENGTH, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.STRENGTH, INVENTORY_STAT.OWNED] = true;
inv_gems[# GEM.STRENGTH, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_gems[# GEM.STRENGTH, INVENTORY_STAT.MANA_COST] = 1;
		
inv_gems[# GEM.STAMINA, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.MANA_COST] = 1;

inv_items[# GEM.SKYRIDER, INVENTORY_STAT.DAMAGE] = -1;
inv_items[# GEM.SKYRIDER, INVENTORY_STAT.USES_AMMO] = false;
inv_items[# GEM.SKYRIDER, INVENTORY_STAT.AMMO] = -1;
inv_items[# GEM.SKYRIDER, INVENTORY_STAT.OWNED] = false;
inv_items[# GEM.SKYRIDER, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_items[# GEM.SKYRIDER, INVENTORY_STAT.MANA_COST] = 1;

inv_items[# GEM.SCREAMING, INVENTORY_STAT.DAMAGE] = -1;
inv_items[# GEM.SCREAMING, INVENTORY_STAT.USES_AMMO] = false;
inv_items[# GEM.SCREAMING, INVENTORY_STAT.AMMO] = -1;
inv_items[# GEM.SCREAMING, INVENTORY_STAT.OWNED] = false;
inv_items[# GEM.SCREAMING, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_items[# GEM.SCREAMING, INVENTORY_STAT.MANA_COST] = 1;
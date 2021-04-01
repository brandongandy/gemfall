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
inv_mana[# MANA_TYPE.RUBY, MANA_STAT.CURRENT_MANA] = 50;
inv_mana[# MANA_TYPE.SAPPHIRE, MANA_STAT.MAX_MANA] = 100;
inv_mana[# MANA_TYPE.SAPPHIRE, MANA_STAT.CURRENT_MANA] = 50;
inv_mana[# MANA_TYPE.EMERALD, MANA_STAT.MAX_MANA] = 100;
inv_mana[# MANA_TYPE.EMERALD, MANA_STAT.CURRENT_MANA] = 50;

// moneys
player_money = 0;

// keys, per dungeon
keys = ds_map_create();
keys[? "Dungeon01"] = 0;

// inventory items
equipped = ITEM.BOW;

inv_items = ds_grid_create(ITEM.TOTAL, INVENTORY_STAT.TOTAL);

inv_items[# ITEM.BOMB, INVENTORY_STAT.DAMAGE] = 5;
inv_items[# ITEM.BOMB, INVENTORY_STAT.USES_AMMO] = true;
inv_items[# ITEM.BOMB, INVENTORY_STAT.AMMO] = 1;
inv_items[# ITEM.BOMB, INVENTORY_STAT.MAX_AMMO] = 10;
inv_items[# ITEM.BOMB, INVENTORY_STAT.OWNED] = true;
inv_items[# ITEM.BOMB, INVENTORY_STAT.MANA_TYPE] = -1;
inv_items[# ITEM.BOMB, INVENTORY_STAT.MANA_COST] = -1;

inv_items[# ITEM.BOW, INVENTORY_STAT.DAMAGE] = 5;
inv_items[# ITEM.BOW, INVENTORY_STAT.USES_AMMO] = true;
inv_items[# ITEM.BOW, INVENTORY_STAT.AMMO] = 20;
inv_items[# ITEM.BOW, INVENTORY_STAT.MAX_AMMO] = 20;
inv_items[# ITEM.BOW, INVENTORY_STAT.OWNED] = true;
inv_items[# ITEM.BOW, INVENTORY_STAT.MANA_TYPE] = -1;
inv_items[# ITEM.BOW, INVENTORY_STAT.MANA_COST] = -1;

// This one works a little differently than the ones above
// Its ammo is a Mana type, and its actions are based on the
// "Equipped" ammo.
inv_items[# ITEM.FOCUS, INVENTORY_STAT.DAMAGE] = 0;
inv_items[# ITEM.FOCUS, INVENTORY_STAT.USES_AMMO] = true;
inv_items[# ITEM.FOCUS, INVENTORY_STAT.AMMO] = 0;
inv_items[# ITEM.FOCUS, INVENTORY_STAT.MAX_AMMO] = 0;
inv_items[# ITEM.FOCUS, INVENTORY_STAT.OWNED] = true;
inv_items[# ITEM.FOCUS, INVENTORY_STAT.MANA_TYPE] = -1;
inv_items[# ITEM.FOCUS, INVENTORY_STAT.MANA_COST] = -1;

// gems
equipped_gem = -1;

inv_gems = ds_grid_create(GEM.TOTAL, INVENTORY_STAT.TOTAL);

// Verdigris - not equippable, but "allows" Hero to use other gems
inv_gems[# GEM.VERDIGRIS, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.VERDIGRIS, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.VERDIGRIS, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.VERDIGRIS, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.VERDIGRIS, INVENTORY_STAT.MANA_TYPE] = -1;
inv_gems[# GEM.VERDIGRIS, INVENTORY_STAT.MANA_COST] = 1;

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
inv_gems[# GEM.STRENGTH, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.RUBY;
inv_gems[# GEM.STRENGTH, INVENTORY_STAT.MANA_COST] = 1;
		
inv_gems[# GEM.STAMINA, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.SAPPHIRE;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.MANA_COST] = 1;

inv_items[# GEM.SCREAMING, INVENTORY_STAT.DAMAGE] = -1;
inv_items[# GEM.SCREAMING, INVENTORY_STAT.USES_AMMO] = false;
inv_items[# GEM.SCREAMING, INVENTORY_STAT.AMMO] = -1;
inv_items[# GEM.SCREAMING, INVENTORY_STAT.OWNED] = false;
inv_items[# GEM.SCREAMING, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.RUBY;
inv_items[# GEM.SCREAMING, INVENTORY_STAT.MANA_COST] = 1;

inv_items[# GEM.SIREN, INVENTORY_STAT.DAMAGE] = -1;
inv_items[# GEM.SIREN, INVENTORY_STAT.USES_AMMO] = false;
inv_items[# GEM.SIREN, INVENTORY_STAT.AMMO] = -1;
inv_items[# GEM.SIREN, INVENTORY_STAT.OWNED] = false;
inv_items[# GEM.SIREN, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_items[# GEM.SIREN, INVENTORY_STAT.MANA_COST] = 1;

inv_items[# GEM.SKYRIDER, INVENTORY_STAT.DAMAGE] = -1;
inv_items[# GEM.SKYRIDER, INVENTORY_STAT.USES_AMMO] = false;
inv_items[# GEM.SKYRIDER, INVENTORY_STAT.AMMO] = -1;
inv_items[# GEM.SKYRIDER, INVENTORY_STAT.OWNED] = false;
inv_items[# GEM.SKYRIDER, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.SAPPHIRE;
inv_items[# GEM.SKYRIDER, INVENTORY_STAT.MANA_COST] = 1;

inv_items[# GEM.TRAVELER, INVENTORY_STAT.DAMAGE] = -1;
inv_items[# GEM.TRAVELER, INVENTORY_STAT.USES_AMMO] = false;
inv_items[# GEM.TRAVELER, INVENTORY_STAT.AMMO] = -1;
inv_items[# GEM.TRAVELER, INVENTORY_STAT.OWNED] = false;
inv_items[# GEM.TRAVELER, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.SAPPHIRE;
inv_items[# GEM.TRAVELER, INVENTORY_STAT.MANA_COST] = 1;

// The following are stat modifiers, and are not equippable
// They modify base attack/defense
inv_items[# GEM.SPELLSLINGER, INVENTORY_STAT.DAMAGE] = -1;
inv_items[# GEM.SPELLSLINGER, INVENTORY_STAT.USES_AMMO] = false;
inv_items[# GEM.SPELLSLINGER, INVENTORY_STAT.AMMO] = -1;
inv_items[# GEM.SPELLSLINGER, INVENTORY_STAT.OWNED] = false;
inv_items[# GEM.SPELLSLINGER, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_items[# GEM.SPELLSLINGER, INVENTORY_STAT.MANA_COST] = 1;

inv_items[# GEM.ARCANE_STEEL, INVENTORY_STAT.DAMAGE] = -1;
inv_items[# GEM.ARCANE_STEEL, INVENTORY_STAT.USES_AMMO] = false;
inv_items[# GEM.ARCANE_STEEL, INVENTORY_STAT.AMMO] = -1;
inv_items[# GEM.ARCANE_STEEL, INVENTORY_STAT.OWNED] = false;
inv_items[# GEM.ARCANE_STEEL, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_items[# GEM.ARCANE_STEEL, INVENTORY_STAT.MANA_COST] = 1;

inv_items[# GEM.VOIDSTEEL, INVENTORY_STAT.DAMAGE] = -1;
inv_items[# GEM.VOIDSTEEL, INVENTORY_STAT.USES_AMMO] = false;
inv_items[# GEM.VOIDSTEEL, INVENTORY_STAT.AMMO] = -1;
inv_items[# GEM.VOIDSTEEL, INVENTORY_STAT.OWNED] = false;
inv_items[# GEM.VOIDSTEEL, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_items[# GEM.VOIDSTEEL, INVENTORY_STAT.MANA_COST] = 1;

inv_items[# GEM.SPELLGUARD, INVENTORY_STAT.DAMAGE] = -1;
inv_items[# GEM.SPELLGUARD, INVENTORY_STAT.USES_AMMO] = false;
inv_items[# GEM.SPELLGUARD, INVENTORY_STAT.AMMO] = -1;
inv_items[# GEM.SPELLGUARD, INVENTORY_STAT.OWNED] = false;
inv_items[# GEM.SPELLGUARD, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_items[# GEM.SPELLGUARD, INVENTORY_STAT.MANA_COST] = 1;

inv_items[# GEM.STONEHEART, INVENTORY_STAT.DAMAGE] = -1;
inv_items[# GEM.STONEHEART, INVENTORY_STAT.USES_AMMO] = false;
inv_items[# GEM.STONEHEART, INVENTORY_STAT.AMMO] = -1;
inv_items[# GEM.STONEHEART, INVENTORY_STAT.OWNED] = false;
inv_items[# GEM.STONEHEART, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_items[# GEM.STONEHEART, INVENTORY_STAT.MANA_COST] = 1;
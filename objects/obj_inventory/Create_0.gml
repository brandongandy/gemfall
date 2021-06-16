/// @description Insert description here
// You can write your code in this editor

// player health modifiers
player_heart_pieces = 0;

// player health - num hearts * 2
player_health_max = 6 + (2 * player_heart_pieces);
player_health = player_health_max;

// mana
inv_mana = ds_grid_create(MANA_TYPE.TOTAL, MANA_STAT.TOTAL);
inv_mana[# MANA_TYPE.RUBY, MANA_STAT.MAX_MANA] = 100;
inv_mana[# MANA_TYPE.RUBY, MANA_STAT.CURRENT_MANA] = 0;
inv_mana[# MANA_TYPE.SAPPHIRE, MANA_STAT.MAX_MANA] = 100;
inv_mana[# MANA_TYPE.SAPPHIRE, MANA_STAT.CURRENT_MANA] = 0;
inv_mana[# MANA_TYPE.EMERALD, MANA_STAT.MAX_MANA] = 100;
inv_mana[# MANA_TYPE.EMERALD, MANA_STAT.CURRENT_MANA] = 42;

// moneys
player_money = 42;

// keys, per dungeon
keys = ds_map_create();
keys[? "Dungeon01"] = 0;

#region Inventory Items
equipped = ITEM.BOW;

// initialize the item classes first
items = array_create(ITEM.TOTAL);
items[ITEM.NONE] = new Item(ITEM.NONE);
items[ITEM.BOMB] = new Bomb(ITEM.BOMB);
items[ITEM.BOW] = new Bow(ITEM.BOW);
items[ITEM.FOCUS] = new Focus(ITEM.FOCUS);
items[ITEM.POTION_EMPTY] = new PotionEmpty(ITEM.POTION_EMPTY);
items[ITEM.POTION_HEALTH] = new PotionHealth(ITEM.POTION_HEALTH);
items[ITEM.POTION_ANTIVENOM] = new PotionAntivenom(ITEM.POTION_ANTIVENOM);
items[ITEM.POTION_SPEED] = new PotionSpeed(ITEM.POTION_SPEED);
items[ITEM.POTION_SIGHT] = new PotionSight(ITEM.POTION_SIGHT);
items[ITEM.POTION_CHARGE] = new PotionCharge(ITEM.POTION_CHARGE);

// now, initialize the inventory for the player
inventory = array_create(9);

for (i = 0; i < 9; i++)
{
	inventory[i] = instance_create_layer(0, 0, "Instances", obj_inv_item);
	inventory[i].persistent = true;
}

// TODO: Load from save.
inventory[0].item_index = ITEM.BOMB;
inventory[1].item_index = ITEM.BOW;
inventory[2].item_index = ITEM.NONE;
inventory[3].item_index = ITEM.NONE;
inventory[4].item_index = ITEM.NONE;
inventory[5].item_index = ITEM.NONE;
inventory[6].item_index = ITEM.NONE;
inventory[7].item_index = ITEM.NONE;
inventory[8].item_index = ITEM.POTION_HEALTH;

#endregion

#region Gems
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
inv_gems[# GEM.STRENGTH, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.STRENGTH, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.RUBY;
inv_gems[# GEM.STRENGTH, INVENTORY_STAT.MANA_COST] = 1;
		
inv_gems[# GEM.STAMINA, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.SAPPHIRE;
inv_gems[# GEM.STAMINA, INVENTORY_STAT.MANA_COST] = 1;

inv_gems[# GEM.SCREAMING, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.SCREAMING, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.SCREAMING, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.SCREAMING, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.SCREAMING, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.RUBY;
inv_gems[# GEM.SCREAMING, INVENTORY_STAT.MANA_COST] = 5;

inv_gems[# GEM.SIREN, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.SIREN, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.SIREN, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.SIREN, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.SIREN, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_gems[# GEM.SIREN, INVENTORY_STAT.MANA_COST] = 1;

// scr_player_float
inv_gems[# GEM.SKYRIDER, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.SKYRIDER, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.SKYRIDER, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.SKYRIDER, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.SKYRIDER, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.SAPPHIRE;
inv_gems[# GEM.SKYRIDER, INVENTORY_STAT.MANA_COST] = 10;

inv_gems[# GEM.TRAVELER, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.TRAVELER, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.TRAVELER, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.TRAVELER, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.TRAVELER, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.SAPPHIRE;
inv_gems[# GEM.TRAVELER, INVENTORY_STAT.MANA_COST] = 1;

// The following are stat modifiers, and are not equippable
// They modify base attack/defense
inv_gems[# GEM.SPELLSLINGER, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.SPELLSLINGER, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.SPELLSLINGER, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.SPELLSLINGER, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.SPELLSLINGER, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_gems[# GEM.SPELLSLINGER, INVENTORY_STAT.MANA_COST] = 1;

inv_gems[# GEM.ARCANE_STEEL, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.ARCANE_STEEL, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.ARCANE_STEEL, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.ARCANE_STEEL, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.ARCANE_STEEL, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_gems[# GEM.ARCANE_STEEL, INVENTORY_STAT.MANA_COST] = 1;

inv_gems[# GEM.VOIDSTEEL, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.VOIDSTEEL, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.VOIDSTEEL, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.VOIDSTEEL, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.VOIDSTEEL, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_gems[# GEM.VOIDSTEEL, INVENTORY_STAT.MANA_COST] = 1;

inv_gems[# GEM.SPELLGUARD, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.SPELLGUARD, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.SPELLGUARD, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.SPELLGUARD, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.SPELLGUARD, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_gems[# GEM.SPELLGUARD, INVENTORY_STAT.MANA_COST] = 1;

inv_gems[# GEM.STONEHEART, INVENTORY_STAT.DAMAGE] = -1;
inv_gems[# GEM.STONEHEART, INVENTORY_STAT.USES_AMMO] = false;
inv_gems[# GEM.STONEHEART, INVENTORY_STAT.AMMO] = -1;
inv_gems[# GEM.STONEHEART, INVENTORY_STAT.OWNED] = false;
inv_gems[# GEM.STONEHEART, INVENTORY_STAT.MANA_TYPE] = MANA_TYPE.EMERALD;
inv_gems[# GEM.STONEHEART, INVENTORY_STAT.MANA_COST] = 1;

#endregion
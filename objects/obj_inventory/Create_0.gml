/// @description Insert description here
// You can write your code in this editor

// player health modifiers
player_heart_pieces = 0;

// player health - num hearts * 2
player_health_max = 6 + (2 * player_heart_pieces);
player_health = player_health_max;

#region Mana
equipped_mana = -1;
mana = array_create(MANA_TYPE.TOTAL);
mana[MANA_TYPE.RUBY] = new Ruby(MANA_TYPE.RUBY);
mana[MANA_TYPE.SAPPHIRE] = new Sapphire(MANA_TYPE.SAPPHIRE);
mana[MANA_TYPE.EMERALD] = new Emerald(MANA_TYPE.EMERALD);

mana_inventory = array_create(3);

for (i = 0; i < 3; i++)
{
	mana_inventory[i] = instance_create_depth(-16, -16, -10000, obj_inv_mana);
	mana_inventory[i].persistent = true;
}

// TODO: Load from save.
mana_inventory[0].gem = mana[MANA_TYPE.RUBY];
mana_inventory[1].gem = mana[MANA_TYPE.SAPPHIRE];
mana_inventory[2].gem = mana[MANA_TYPE.EMERALD];

#endregion

// moneys
player_money = 42;

#region Quests
current_quest = -1;
quests = array_create(QUEST.TOTAL);
quests[QUEST.MAINQUEST] = new MainQuest();
quests[QUEST.DUNGEON00] = new GemshardCaverns();

#endregion

#region Inventory Items
equipped = -1;

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
items[ITEM.SWORD] = new Sword(ITEM.SWORD);

#endregion

#region Gems
equipped_gem = -1;
gems = array_create(GEM.TOTAL);
gems[GEM.VERDIGRIS] = new Verdigris(GEM.VERDIGRIS);
gems[GEM.EXEMPLAR] = new Exemplar(GEM.EXEMPLAR);
gems[GEM.STRENGTH] = new Strength(GEM.STRENGTH);
gems[GEM.STAMINA] = new Stamina(GEM.STAMINA);
gems[GEM.SKYRIDER] = new Skyrider(GEM.SKYRIDER);
gems[GEM.SCREAMING] = new Screaming(GEM.SCREAMING);
gems[GEM.SIREN] = new Siren(GEM.SIREN);
gems[GEM.TRAVELER] = new Traveler(GEM.TRAVELER);
gems[GEM.SPELLSLINGER] = new Spellslinger(GEM.SPELLSLINGER);
gems[GEM.ARCANE_STEEL] = new ArcaneSteel(GEM.ARCANE_STEEL);
gems[GEM.VOIDSTEEL] = new Voidsteel(GEM.VOIDSTEEL);
gems[GEM.SPELLGUARD] = new Spellguard(GEM.SPELLGUARD);
gems[GEM.STONEHEART] = new Stoneheart(GEM.STONEHEART);

#endregion

#region Inventory Items

// now, initialize the inventory for the player
inventory = array_create(9);

for (i = 0; i < 9; i++)
{
	inventory[i] = instance_create_depth(-16, -16, -10000, obj_inv_item);
	inventory[i].persistent = true;
}

// TODO: Load from save.
inventory[0].item = items[ITEM.BOMB];
inventory[1].item = items[ITEM.BOW];
inventory[2].item = items[ITEM.FOCUS];
inventory[3].item = items[ITEM.NONE];
inventory[4].item = items[ITEM.NONE];
inventory[5].item = new PotionHealth(ITEM.POTION_HEALTH);
inventory[6].item = items[ITEM.NONE];
inventory[7].item = items[ITEM.NONE];
inventory[8].item = items[ITEM.POTION_HEALTH];

gem_inventory = array_create(5);

for (i = 0; i < 10; i++)
{
	gem_inventory[i] = instance_create_depth(-16, -16, -9999, obj_inv_gem);
	gem_inventory[i].persistent = true;
}

gem_inventory[0].gem = gems[GEM.EXEMPLAR];
gem_inventory[1].gem = gems[GEM.SCREAMING];
gem_inventory[2].gem = gems[GEM.SIREN];
gem_inventory[3].gem = gems[GEM.SKYRIDER];
gem_inventory[4].gem = gems[GEM.TRAVELER];

gem_inventory[5].gem = gems[GEM.STRENGTH];
gem_inventory[6].gem = gems[GEM.STAMINA];
gem_inventory[7].gem = gems[GEM.SPELLSLINGER];

gem_inventory[8].gem = gems[GEM.ARCANE_STEEL];
if (gems[GEM.VOIDSTEEL].owned)
{
	gem_inventory[8].gem = gems[GEM.VOIDSTEEL];
}

gem_inventory[9].gem = gems[GEM.SPELLGUARD];
if (gems[GEM.STONEHEART].owned)
{
	gem_inventory[9].gem = gems[GEM.STONEHEART];
}

#endregion

#region Day Cycle

daycycle = new DayData();

#endregion
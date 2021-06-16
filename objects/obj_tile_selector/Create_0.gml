/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

x = (x div TILE_SIZE) * TILE_SIZE + (TILE_SIZE / 2);
y = (y div TILE_SIZE) * TILE_SIZE + (TILE_SIZE / 2);

// cost per tile of traversal
base_cost = obj_inventory.gems[GEM.TRAVELER].mana_cost;
base_mana = obj_inventory.gems[GEM.TRAVELER].mana_type;
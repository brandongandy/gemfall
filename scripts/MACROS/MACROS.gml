#macro FRAME_RATE 60
#macro TILE_SIZE 16
#macro COL_TILE 8
#macro CARDINAL_DIR round(direction / 90)

#macro RESOLUTION_W 256
#macro RESOLUTION_H 224

#macro TRANSITION_SPEED 0.04
#macro TRANSITION_OUT 0
#macro TRANSITION_IN 1

enum ITEM
{
	NONE,
	BOMB,
	BOW,
	FOCUS,
	POTION_EMPTY,
	POTION_HEALTH,
	POTION_ANTIVENOM,
	POTION_SPEED,
	POTION_SIGHT,
	POTION_CHARGE,
	SWORD,
	TOTAL // not used as an item, but used for counting enum size
}

enum GEM
{
	VERDIGRIS,
	EXEMPLAR,
	STRENGTH,
	STAMINA,
	SKYRIDER,
	SCREAMING,
	SIREN,
	TRAVELER,
	SPELLSLINGER,
	ARCANE_STEEL,
	VOIDSTEEL,
	SPELLGUARD,
	STONEHEART,
	TOTAL // not used except to count enum size
}

enum INVENTORY_STAT
{
	DAMAGE,
	USES_AMMO,
	AMMO,
	MAX_AMMO,
	OWNED,
	MANA_TYPE,
	MANA_COST,
	TOTAL // not used as an item, but used for counting enum size
}

enum MANA_TYPE
{
	RUBY,
	SAPPHIRE,
	EMERALD,
	TOTAL
}

enum MOB_STATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT,
	SPECIAL_01, // special attacks, used mostly by bosses
	SPECIAL_02,
	SPECIAL_03
}

enum CHEST_STATE
{
	CLOSED,
	OPEN
}

enum QUEST
{
	MAINQUEST,
	DUNGEON00,
	DUNGEON01,
	DUNGEON02,
	TOTAL
}

#macro GET_HEART_CONTAINER "You got a heart container! Your maximum hearts have increased by 1!"
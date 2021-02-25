#macro FRAME_RATE 60
#macro TILE_SIZE 16
#macro COL_TILE 8
#macro CARDINAL_DIR round(direction / 90)

#macro RESOLUTION_W 320
#macro RESOLUTION_H 192

#macro TRANSITION_SPEED 0.04
#macro TRANSITION_OUT 0
#macro TRANSITION_IN 1

enum ITEM
{
	BOMB,
	BOW,
	FOCUS,
	TOTAL // not used as an item, but used for counting enum size
}

enum GEM
{
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

#macro GET_HEART_CONTAINER "You got a heart container! Your maximum hearts have increased by 1!"
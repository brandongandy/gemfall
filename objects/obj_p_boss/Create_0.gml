/// @description Boss Vars
/// Right now nothing is here -- but we want a special parent for
/// certain collision and effect checks
// Inherit the parent event
event_inherited();

boss_stage = 0;

mob_script[MOB_STATE.SPECIAL_01] = -1;
mob_script[MOB_STATE.SPECIAL_02] = -1;
mob_script[MOB_STATE.SPECIAL_03] = -1;
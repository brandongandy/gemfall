/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

sprite_move = spr_crystal_slime;

state = MOB_STATE.IDLE;
state_wait_duration = 60;
has_fired = false;
boss_stage = 0;

mob_script[MOB_STATE.IDLE] = scr_crystal_slime_idle;
mob_script[MOB_STATE.WANDER] = -1;
mob_script[MOB_STATE.CHASE] = -1;
mob_script[MOB_STATE.ATTACK] = scr_crystal_slime_attack;
mob_script[MOB_STATE.HURT] = -1;
mob_script[MOB_STATE.DIE] = scr_crystal_slime_die;
mob_script[MOB_STATE.WAIT] = scr_crystal_slime_wait;
mob_script[MOB_STATE.SPECIAL_01] = scr_crystal_slime_special01;
mob_script[MOB_STATE.SPECIAL_02] = scr_crystal_slime_special02;
mob_script[MOB_STATE.SPECIAL_03] = -1;
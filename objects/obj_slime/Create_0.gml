/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = MOB_STATE.WANDER;

// sprites
sprite_move = spr_slime;
sprite_attack = spr_slime_attack;
sprite_die = spr_slime_die;
sprite_hurt = spr_slime_hurt;

state_wait_duration = 60;

// scripts
mob_script[MOB_STATE.WANDER] = scr_slime_wander;
mob_script[MOB_STATE.CHASE] = scr_slime_chase;
mob_script[MOB_STATE.ATTACK] = scr_slime_attack;
mob_script[MOB_STATE.HURT] = slime_hurt;
mob_script[MOB_STATE.DIE] = slime_die;
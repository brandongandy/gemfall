// first off, inherit
event_inherited();

// basic variables
state = MOB_STATE.IDLE;
h_speed = 0;
v_speed = 0;
x_to = xstart;
y_to = ystart;
dir = 0;
aggro_check_elapsed = 0;
aggro_check_duration = 5;
state_target = state;
state_previous = state;
state_wait_elapsed = 0;
state_wait_duration = 0;

target = noone;

// state variables
// used to determine give up time when trying to move
time_passed = 0;
// wait period between certain actions
wait_duration = 60;
wait = 0;

// sprites
sprite_move = spr_slime;

// mob functions
mob_script[MOB_STATE.IDLE] = -1;
mob_script[MOB_STATE.WANDER] = -1;
mob_script[MOB_STATE.CHASE] = -1;
mob_script[MOB_STATE.ATTACK] = -1;
mob_script[MOB_STATE.HURT] = -1;
mob_script[MOB_STATE.DIE] = -1;
mob_script[MOB_STATE.WAIT] = scr_mob_wait;

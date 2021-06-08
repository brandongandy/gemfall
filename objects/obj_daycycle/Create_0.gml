/// @description Insert description here
// You can write your code in this editor
depth = 0;
seconds = 0;
minutes = 0;
hours = 0;

day = 1;
season = 1;
year = 1;

// seconds per step
time_increment = 24;
time_paused = false;

max_darkness = 0.99;
darkness = 0;
light_color = c_black;
draw_daylight = false;

phase_start = phase.daytime;
phase_end = phase.sunset;

enum phase
{
	sunrise = 6,
	daytime = 8.5,
	sunset = 18,
	nighttime = 22
}

// surface
daycycle_surf = surface_create(RESOLUTION_W + 16, RESOLUTION_H + 16);
daycycle_buffer = buffer_create(4 * room_width * room_height, buffer_grow, 1);

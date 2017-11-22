zoom_level = 10.5;
zoom_speed = 0.1;
zoom_rate = 0.015;
rate = 0.2;
res = 6;
zoom_max = 4.12;

original_cam_x = 0;
original_cam_y = 0;
zoom_min = 0.12;
fullscreen = 0;
saved_rel_pos_x = 0;
saved_rel_pos_y = 0;
pan_level_x = 1;
pan_level_y = 1;
mouse_pos_x = 1;
mouse_pos_y = 1;
click_x = 0;
click_y = 0;
mouse_clicked_x = 0;
mouse_clicked_y = 0;
rel_pos_x = 0;
rel_pos_y = 0;
save_shift_x = 0;
save_shift_y = 0;
target_x = 0;
target_y = 0
adjust_x = 0;
adjust_y = 0;
tracking = 0;
panning  = 0;
vpos_x = 0;
vpos_y = 0;
vpos_w = 0;
vpos_h = 0;
new_h = 0;
new_w = 0;
on_start = 1;
landed = 0;
special = 0;
camera_lock = 0;
previous_camera_lock = 0;
previous_x = 0;
previous_y = 0;
light_surface = noone;
current_star= noone;
window_w = window_get_width();
window_h = window_get_height();
audio_dist = 0;
weapon_name = "no";
planet_name = "no"
h = 1;
limit = 1400;
s = "";
//damage = 0;


//draw_texture_flush();
a_out = 1;
a_in = 3;
fps_count = 0;
fps_average = 0;
star = 0;
map_start = 1;
once = 1;
once2 = 0;
surface2 = noone; 
count = 0;
h = 1;

//Get the starting view size to be used for interpolation later
default_zoom_width = camera_get_view_width(view_camera[0]);
default_zoom_height = camera_get_view_height(view_camera[0]);

//Camera creation
//view_set_xport(0,0);
//view_set_yport(0,0);
//view_set_wport(0,1920);
//view_set_hport(0,1080) ;
//Build a camera at (0,0), with size 640x480, 0 degrees of angle, no target instance, instant-jupming hspeed and vspeed, with a 32 pixel border
camera = camera_create_view(1500, 1500 , 1280, 720, 0, -1, -1, -1, 32, 32);
view_set_camera(0, camera);

/*
var height = 0;
var width = 0;
var flip = 1;
for (var i=1; i<=10; i++;) {
	if ((i mod 3) == 0) {
		height += 1;
		width -= 3;
		flip *= -1;
	}
	var inst = instance_create_layer(sprite_get_width(spr_background1)*width,
	sprite_get_height(spr_background1)*height,"back",obj_background1);
	with(inst) {
		if (flip == 1) {
			image_angle = 0;
		} else {
			image_angle = 180;
		}
	}
	width ++;
}*/




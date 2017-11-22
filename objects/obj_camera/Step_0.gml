if (on_start == 1) {
	//application_surface_draw_enable(false);
	camera = camera_create_view(save_shift_x, save_shift_y , 1920, 1080, 0, -1, -1, -1, 32, 32);
	view_set_camera(0, camera);
	default_zoom_width = camera_get_view_width(view_camera[0]);
	default_zoom_height = camera_get_view_height(view_camera[0]);
	limit = 1400;
	//audio_play_sound(amb2,1,1);
	zoom_level = 1.9;
	rate = 0;
	zoom_rate = 0;
	zoom_speed = 0;
	//save_shift_x = 0;
	//save_shift_y = 0;
} 


//Move the zoom level based on mouse scrolling. Clamp the value so stuff doesn't get too silly.
zoom_level = clamp(zoom_level + (((mouse_wheel_down() - mouse_wheel_up())) * zoom_speed), zoom_min, zoom_max);
if (star == 0) {
	clamp(zoom_level,2.5,zoom_max)
}
mouse_pos_x = ((window_mouse_get_x() - (window_w / 2)) / (window_w / 64));
mouse_pos_y = ((window_mouse_get_y() - (window_h / 2)) / (window_h / 64));

pan_level_x = mouse_pos_x / 3;
pan_level_y = mouse_pos_y / 3;

//Get current size
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

//Set the rate of interpolation                
//zoom_rate = 0.6; //0.2

//Get new sizes by interpolating current and target zoomed size

new_w = lerp(view_w, zoom_level * default_zoom_width, zoom_rate);
new_h = lerp(view_h, zoom_level * default_zoom_height, zoom_rate);
 
//Apply the new sizez
camera_set_view_size(view_camera[0], new_w, new_h);

//Get the shift necessary to re-align the view.

var shift_x = (camera_get_view_x(view_camera[0]) - ((new_w - view_w) * 0.5));
var shift_y = (camera_get_view_y(view_camera[0]) - ((new_h - view_h) * 0.5));

//Update the view position
camera_set_view_pos(view_camera[0],shift_x, shift_y);
/*
if (panning == 0) {
if(mouse_wheel_up()) {
	tracking = 0;
    click_x += (mouse_pos_x * 0);//4
    click_y += (mouse_pos_y * 0);
}

if(mouse_wheel_down()) {
	tracking = 0;
    click_x -= (mouse_pos_x * 0);
    click_y -= (mouse_pos_y * 0);
}
}*/

vpos_x = camera_get_view_x(view_camera[0]);
vpos_y = camera_get_view_y(view_camera[0]);
vpos_w = camera_get_view_width(view_camera[0]) * 0.5;
vpos_h = camera_get_view_height(view_camera[0]) * 0.5;

if (mouse_check_button_pressed(mb_middle)) {
	rate = 0.2;
	tracking = 0;
	panning = 0;
	mouse_clicked_x = device_mouse_x_to_gui(0)-960;
	mouse_clicked_y = device_mouse_y_to_gui(0)-540;
	original_cam_x = vpos_x//camera_get_view_x(view_camera[0]);
	original_cam_y = vpos_y//camera_get_view_y(view_camera[0]);
	rel_pos_x = 0;
	rel_pos_y = 0;
}
 
//}

if (tracking == 0 &&  mouse_button == mb_middle) {
	rel_pos_x = (mouse_clicked_x - ((device_mouse_x_to_gui(0))-960)) * (zoom_level);
	rel_pos_y = (mouse_clicked_y - ((device_mouse_y_to_gui(0))-540)) * (zoom_level);
		
	saved_rel_pos_x = rel_pos_x;
	saved_rel_pos_y = rel_pos_y;
	//obj_clicks.object = "";	
	//adjust_x = (((mouse_clicked_x) - (mouse_x)) / 2);
	//adjust_y = (((mouse_clicked_y) - (mouse_y)) / 2);
	
}
//var new_x = lerp(vpos_x, click_x - vpos_w, rate);
//var new_y = lerp(vpos_y, click_y - vpos_h, rate);

if (tracking != undefined && tracking != 0 && instance_exists(tracking)) {
	camera_lock = 1;
	target_x = tracking.true_x;
	target_y = tracking.true_y;
	if (special == 1) {
		save_shift_x = target_x;
		save_shift_y = target_y;
	}
} else {
	camera_lock = 0;
}

if (previous_camera_lock = 0 && camera_lock == 1) {
	adjust_x = (target_x - vpos_w) - vpos_x;
	adjust_y = (target_y - vpos_h) - vpos_y;
}

if (previous_camera_lock = 1 && camera_lock == 0) {
	//rel_pos_x += (adjust_x / 5);
	//rel_pos_y += (adjust_y / 5);
	//save_shift_x = save_shift_x+rel_pos_x;
	//save_shift_y = save_shift_x+rel_pos_y;

}

//middle mouse drag
//if (2 == 3) {
//	var m_x = 95*(((mouse_x-vpos_x)/vpos_w)-1);
//	var m_y = 95*(((mouse_y-vpos_y)/vpos_h)-1);
//}// else {
	var m_x = 0;
	var m_y = 0;
		panning = 0;
		/*if ((mouse_x-vpos_x)/vpos_w >= 1.98) {
			//var dir = point_direction(vpos_x+vpos_w,vpos_y+vpos_h,mouse_x,mouse_y);
			//save_shift_x += lengthdir_x((6*(zoom_level+1)),dir);
			//save_shift_y += lengthdir_y((6*(zoom_level+1)),dir);
			save_shift_x += 9*(zoom_level+1);
		}
		if ((mouse_x-vpos_x)/vpos_w <= 0.02) {
			save_shift_x -= 9*(zoom_level+1);
		}
		if ((mouse_y-vpos_y)/vpos_h >= 1.98) {
			save_shift_y += 9*zoom_level;
		}
		if ((mouse_y-vpos_y)/vpos_h <= 0.02) {
			save_shift_y -= 9*(zoom_level+1);
		}*/
//}

if (camera_lock == 1) {
	if (((target_x - vpos_w) > (vpos_x + 5)) || ((target_x - vpos_w) < (vpos_x - 5)) &&
	((target_y - vpos_h) > (vpos_y + 5)) || ((target_y - vpos_h) < (vpos_y - 5))) {
		panning = 1;
	} else { 
		panning = 0;
	}
	var new_x = lerp(vpos_x, (target_x - vpos_w) + (rel_pos_x * 1), rate / 2);
	var new_y = lerp(vpos_y, (target_y - vpos_h) + (rel_pos_y * 1), rate / 2);
	save_shift_x = (target_x);
	save_shift_y = (target_y);
} else {
	var new_x = lerp(vpos_x, (m_x+save_shift_x-vpos_w) + (rel_pos_x), rate);
	var new_y = lerp(vpos_y, (m_y+save_shift_y-vpos_h) + (rel_pos_y), rate);
}

/*if (rel_pos_y > limit && obj_player_fleet.warp_in == 0) {
	rel_pos_y = limit;
} else if (rel_pos_y < -limit && obj_player_fleet.warp_in == 0) {
	rel_pos_y = -limit	
}

if (rel_pos_x > limit && obj_player_fleet.warp_in == 0) {
	rel_pos_x = limit;
} else if (rel_pos_x < -limit && obj_player_fleet.warp_in == 0) {
	rel_pos_x = -limit	
}
*/
/*if (room == rm_system1) {
	if (rel_pos_y > limit) {
		rel_pos_y = limit;
	} else if (rel_pos_y < -limit+325) {
		rel_pos_y = -limit+325;	
	}

	if (rel_pos_x > limit) {
		rel_pos_x = limit;
	} else if (rel_pos_x < -limit+325) {
		rel_pos_x = -limit+325;	
	}
}*/
camera_set_view_pos(view_camera[0], new_x  , new_y  );



if (panning == 0) {
	//if (mouse_check_button_released(mb_middle)) {
		save_shift_x = save_shift_x+(rel_pos_x);
		save_shift_y = save_shift_y+(rel_pos_y);
		rel_pos_x = 0;
		rel_pos_y = 0;
		mouse_clicked_x = ((device_mouse_x_to_gui(0))-960);
		mouse_clicked_y = ((device_mouse_y_to_gui(0))-540);
	//camera_set_view_pos(view_camera[0], new_x + save_shift_x, new_y + save_shift_y);	
	//} else {
	//camera_set_view_pos(view_camera[0], new_x + rel_pos_x, new_y + rel_pos_y);
	//}
}
//camera_set_view_pos(view_camera[0], new_x + rel_pos_x, new_y + rel_pos_y);
previous_camera_lock = camera_lock;
//movement sway
//vpos_x = camera_get_view_x(view_camera[0]);
//vpos_y = camera_get_view_y(view_camera[0]);
//vpos_w = camera_get_view_width(view_camera[0]) * 0.5;
//vpos_h = camera_get_view_height(view_camera[0]) * 0.5;

//if (target_x != 0 || target_y != 0) {
	//new_shift_x = lerp(vpos_x, target_x - (vpos_w), 0.2);
	//new_shift_y = lerp(vpos_y, target_y - (vpos_h), 0.2);
	//jump_shift_x = lerp(vpos_x, target_x - (vpos_w), 0.1);
	//jump_shift_y = lerp(vpos_y, target_y - (vpos_h), 0.1);
	//if ((vpos_y == target_y - (vpos_h)) && (vpos_x == target_x - (vpos_w))) {
		//target_x = 0;
		//target_y = 0;
	//}
//} else {
	//new_shift_x = lerp(vpos_x, pan_level_x - vpos_w, rate);
	//new_shift_y = lerp(vpos_y, pan_level_y - vpos_h, rate);
//}

//camera_set_view_pos(view_camera[0],jump_shift_x, jump_shift_y); 
//camera_set_view_pos(view_camera[0],target_x - (window_w / 2), target_y - (window_h / 2)); 

if (keyboard_check_pressed(ord("F"))) {
	if (fullscreen == 0) {
		window_set_fullscreen(true);
		fullscreen = 1;
	} else {
		window_set_fullscreen(false);
		fullscreen = 0;
	}
}

if (on_start) {
	on_start = 0;
	zoom_rate = 0.1;
	rate = 0.2;
	zoom_speed = 0.2;
}

//room system
if (zoom_level == 4) {
	zoom_level = 5.5;
	zoom_rate = 0.09;
}
if (zoom_level == 5.4) {
	zoom_rate = 0.09;
	zoom_level = 3.9;
}

if (zoom_level == 11) {
	global.pause = 1;
	zoom_rate = 0.03;
	zoom_level = 200;
}

if (new_h/1080 > 30) {
	zoom_rate = 0.06;
}
if (new_h/1080 > 60) {
	zoom_rate = 0.09;
}
if (zoom_level == 199.5) {
	zoom_rate = 0.08;
	zoom_level = 10.5;
}

fps_average += fps_real;
fps_count++;

x=vpos_x
y=vpos_y
previous_x = xprevious;
previous_y = yprevious;

if (keyboard_check_pressed(ord("H"))) {
	h *= -1;
	if (h==1) {
		gpu_set_texfilter(false);
		//application_surface_draw_enable(false);
	} else {
		//gpu_set_texfilter(true);
		//application_surface_draw_enable(true)
		//gpu_set_
	}
}


/*if (keyboard_check_pressed(ord("T"))) {
	if (global.scale == 1) {
		global.scale = 0.5;
	} else {
		global.scale = 1;
	}
}

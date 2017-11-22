if (keyboard_check(ord("1"))) {
	var inst = instance_create_depth(mouse_x,mouse_y,-100,obj_boid_square_red);
}
if (keyboard_check(ord("2"))) {
	var inst = instance_create_depth(mouse_x,mouse_y,-100,obj_boid_square_blue);
}
if (keyboard_check(ord("3"))) {
	var inst = instance_create_depth(mouse_x,mouse_y,-100,obj_boid_circle_green);
}
if (keyboard_check(ord("4"))) {
	var inst = instance_create_depth(mouse_x,mouse_y,-100,obj_boid_triangle_orange);
}

if (keyboard_check_pressed(ord("D"))) {
	if (debug) {
		debug = 0;
		with (obj_boid_parent) {
			debug = 0;	
		}
	} else {
		debug = 1;
		with (obj_boid_parent) {
			debug = 1;	
		}
	}
}

if (keyboard_check_pressed(vk_add) && global.t <= 4) {
	var mult = 2;
	global.t *= 2;
	with (obj_boid_parent) {
		physics_set_density(fix,physics_get_density(fix)*mult);
		physics_set_friction(fix,physics_get_friction(fix)*mult);
		//physics_world_update_speed(room_speed*global.t);
		phy_angular_damping *= mult;
		phy_linear_damping *= mult;
	}
	//room_speed = 120;
} else if (keyboard_check_pressed(vk_subtract) && global.t >= 0.25) {
	var mult = 2;
	global.t /= 2;
	with (obj_boid_parent) {
		physics_set_density(fix,physics_get_density(fix)/mult);
		physics_set_friction(fix,physics_get_friction(fix)/mult);
		//physics_world_update_speed(room_speed*global.t);
		phy_angular_damping /= mult;
		phy_linear_damping /= mult;
	}
	//room_speed = 30;
}


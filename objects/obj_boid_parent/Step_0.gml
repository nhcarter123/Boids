if (search_count > search_cd) {
	search_count = 0;
	target = noone;
}
search_count+=global.t;

var dist = point_distance(phy_position_x,phy_position_y,0,0);
var target_exists = instance_exists(target);
var dir = point_direction(phy_position_x,phy_position_y,goal_x,goal_y);

if (dist > 500) {
	falling = true;
}

if (falling) {
	time_falling++;
	image_xscale -= 0.01*power(time_falling/30,2)*global.t;
	image_yscale = image_xscale;
	if (image_xscale < 0) {
		with id instance_destroy();	
	}
}

var diff = angle_difference(-phy_rotation-90,dir);
if (diff > 0) {
	var turn = turn_speed*global.t;
	if (diff-turn < 0) {
		phy_rotation += diff;
	} else {
		phy_rotation += turn;
	}
} else if (diff < 0) {
	var turn = turn_speed*global.t;
	if (diff+turn > 0) {
		phy_rotation += diff;
	} else {
		phy_rotation -= turn;
	}
}
//phy_rotation += diff;
print = diff;

step_time+=global.t;
if (step_time > step_cd) {
	step_time = 0;	
	step_mod*=-1;
	//part_type_orientation(step,-phy_rotation+180,-phy_rotation+180,0,0,0);
	//part_particles_create(foot,x+lengthdir_x(step_mod,-phy_rotation),y+lengthdir_y(step_mod,-phy_rotation),step,1);		
	closest_dist = 100;
	var xx = 0;
	var yy = 0;
	var c = 0;
	/*with (obj_boid_parent) {
		if (color == other.color) {
			var dist = point_distance(x,y,other.x,other.y);
			var dir = point_direction(other.x,other.y,x,y);
			if (dist < other.closest_dist) {
				c++;
				xx += lengthdir_x(dist,dir);
				yy += lengthdir_y(dist,dir);
			}
		}
	}
	physics_apply_impulse(x,y,(xx/c)/150,(yy/c)/150);*/
	
	if (abs(diff) > 90) {
		physics_apply_local_impulse(0,0,0,-move_speed*global.t);
	} else {
		physics_apply_local_impulse(0,0,0,move_speed*global.t);
	}
}

var dist_to_edge = 500-dist;
if (dist_to_edge < 75) {
	goal_x = 0;
	goal_y = 0;
} else if (target_exists) {	
	if (cd > 63) {
		cd = 0;
		goal_x = target.x;
		goal_y = target.y;
		var target_dist = point_distance(x,y,target.x,target.y);
		var target_dir = point_direction(x,y,target.x,target.y);
		var target_diff = angle_difference(-phy_rotation-90,target_dir);
		if (target_dist < 150 /*&& abs(target_dir) < 20*/) {
			physics_apply_local_impulse(0,0,0,punch*global.t);	
		}
	}
}
cd+=global.t;

if (!target_exists) {
	closest_dist = 1000;
	with (obj_boid_parent) {
		if (color != other.color) {
			var dist = point_distance(x,y,other.x,other.y);
			if (dist != 0 && dist < other.closest_dist) {
				other.closest_dist = dist;
				other.target = id;
			}
		}
	}
}


/*if (other.red != red) {
	with(other.id) {
		var dir = point_direction(other.x,other.y,x,y);
		physics_apply_impulse(0,0,lengthdir_x(punch,dir),lengthdir_y(punch,dir));
	}
}
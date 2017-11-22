event_inherited();
color = "green";
punch = 0.7;
move_speed = 0.4;
step_cd = 2;
image_xscale = 0.25;
image_yscale = 0.25;

var scl = 1;
fix = physics_fixture_create();
physics_fixture_set_circle_shape(fix,16);

physics_fixture_set_density(fix, 7);
physics_fixture_set_restitution(fix, 0.1);
physics_fixture_set_linear_damping(fix,2);
physics_fixture_set_angular_damping(fix,2);
physics_fixture_set_friction(fix,2);
physics_fixture_bind(fix,id);
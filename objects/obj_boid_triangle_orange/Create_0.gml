event_inherited();
color = "orange";
punch = 0.1;
move_speed = 0.35;
image_xscale = 0.25;
image_yscale = 0.25;

var scl = 0.25;
fix = physics_fixture_create();
physics_fixture_set_polygon_shape(fix);

// four points, making up a convex shape

physics_fixture_add_point(fix, 0*scl, 32*scl);
physics_fixture_add_point(fix, -32*scl, -32*scl);
physics_fixture_add_point(fix, 32*scl, -32*scl);


physics_fixture_set_density(fix, 7);
physics_fixture_set_restitution(fix, 0.1);
physics_fixture_set_linear_damping(fix,2);
physics_fixture_set_angular_damping(fix,2);
physics_fixture_set_friction(fix,2);
physics_fixture_bind(fix,id);
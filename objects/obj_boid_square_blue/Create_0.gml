event_inherited();
color = "blue";
punch = 3;

var scl = 1;
fix = physics_fixture_create();
physics_fixture_set_polygon_shape(fix);

// four points, making up a convex shape
physics_fixture_add_point(fix, -16*scl, -16*scl);
physics_fixture_add_point(fix, 16*scl, -16*scl);
physics_fixture_add_point(fix, 16*scl, 16*scl);
physics_fixture_add_point(fix, -16*scl, 16*scl);

physics_fixture_set_density(fix, 5);
physics_fixture_set_restitution(fix, 0.1);
physics_fixture_set_linear_damping(fix,2);
physics_fixture_set_angular_damping(fix,2);
physics_fixture_set_friction(fix,2);
physics_fixture_bind(fix,id);



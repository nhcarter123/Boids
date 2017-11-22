falling = false;
time_falling = 0;
goal_x = 0;
goal_y = 0;
turn_speed = 6;
move_speed = 0.7;
max_speed = 3;
target = noone;
closest_dist = 1000;
print = 0;
step_time = 0;
cd = 0;
punch = 7;
search_cd = 255;
search_count = 0;
step_mod = 6;
step_cd = 31;
debug = 0;

foot = part_system_create();
part_system_depth(foot,-10);


//col1 = make_color_rgb(40,40,40);//blue
//col2 = make_color_rgb(255,115,0);//orange
//col3 = make_color_rgb(170,32,32);//red

step = part_type_create();
part_type_sprite(step,spr_part_step1,0,0,0);
part_type_scale(step,0.1,0.1);
//part_type_size(step,1,1,0,0);
part_type_speed(step,0,0,0,0);
//part_type_color1(step,col1);
part_type_alpha2(step,0.14,0); 
//part_type_blend(step,1);
part_type_life(step,room_speed*6,room_speed*6);
part_type_gravity(step,0,0);


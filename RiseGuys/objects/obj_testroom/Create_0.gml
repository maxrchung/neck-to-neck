/// @description Insert description here
// You can write your code in this editor

physics_world_create(0.1);                      //Pixel to meters scale
physics_world_gravity(0, 10);                    //gravity of 10
physics_world_update_iterations(20);            //iterations per step
physics_world_update_speed(60);                 //Update speed
game_set_speed(60,gamespeed_fps);

//create collidable edges of the room
var edge_fix = physics_fixture_create();
physics_fixture_set_chain_shape(edge_fix, true);
physics_fixture_add_point(edge_fix, 0, 0);
physics_fixture_add_point(edge_fix, room_width, 0);
physics_fixture_add_point(edge_fix, room_width, room_height);
physics_fixture_add_point(edge_fix, 0, room_height);
physics_fixture_set_density(edge_fix, 0);
physics_fixture_set_restitution(edge_fix, 0.5);
physics_fixture_bind(edge_fix, id);
physics_fixture_delete(edge_fix);

//sets render flags to draw physics debug visuals
render_flags = phy_debug_render_shapes | phy_debug_render_joints | phy_debug_render_coms | phy_debug_render_obb;

instance_create_layer(0, 0, layer, obj_PlayersManager);
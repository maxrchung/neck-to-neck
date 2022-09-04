/// @description Insert description here
// You can write your code in this editor

physics_world_create(0.1);                      //Pixel to meters scale
physics_world_gravity(0, 30);                    //gravity of 10
physics_world_update_iterations(20);            //iterations per step
physics_world_update_speed(60);                 //Update speed
game_set_speed(60,gamespeed_fps);


//sets render flags to draw physics debug visuals
render_flags = phy_debug_render_shapes | phy_debug_render_joints | phy_debug_render_coms | phy_debug_render_obb;

instance_create_layer(0, 0, layer, obj_PlayersManager);
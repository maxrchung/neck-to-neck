//variable creation
p1grabbing = false;
p2grabbing = false;
p1contracting = false;
p2contracting = false;
p1grabbed = false;
p2grabbed = false;

//create players and components of players
//each player has a main head and several bars and a circle, allowing for smooth non-collision with each other
//without the prismatic joint messing up
//a rope joint is also added since the prismatic constraints don't work with this setup
player1Head = instance_create_layer(obj_StartLocation.x-100,obj_StartLocation.y, layer, obj_Player1);
player1Bar0 = instance_create_layer(obj_Player1.x+2,obj_Player1.y,layer,obj_NonCollidable);
player1Bar1 = instance_create_layer(obj_Player1.x+6,obj_Player1.y,layer,obj_NonCollidable);
player1Wheel = instance_create_layer(obj_Player1.x+8,obj_Player1.y,layer,obj_NonCollidable);
player2Head = instance_create_layer(obj_StartLocation.x+100,obj_StartLocation.y, layer, obj_Player2);
player2Bar0 = instance_create_layer(obj_Player2.x-2,obj_Player2.y,layer,obj_NonCollidable);
player2Bar1 = instance_create_layer(obj_Player2.x-6,obj_Player2.y,layer,obj_NonCollidable);
player2Wheel = instance_create_layer(obj_Player2.x-8,obj_Player2.y,layer,obj_NonCollidable);

//create and bind physics fixtures
p1HeadFix = physics_fixture_create();
physics_fixture_set_circle_shape(p1HeadFix,obj_Player1.sprite_width/2);
physics_fixture_set_density(p1HeadFix, 0.5);
physics_fixture_set_restitution(p1HeadFix, 0.8);
physics_fixture_bind(p1HeadFix,player1Head);
physics_fixture_delete(p1HeadFix);
p1Bar0Fix = physics_fixture_create();
physics_fixture_set_box_shape(p1Bar0Fix,2,1);
physics_fixture_set_density(p1Bar0Fix, 0.1);
physics_fixture_bind(p1Bar0Fix,player1Bar0);
physics_fixture_delete(p1Bar0Fix);
p1Bar1Fix = physics_fixture_create();
physics_fixture_set_box_shape(p1Bar1Fix,2,1);
physics_fixture_set_density(p1Bar1Fix, 0.1);
physics_fixture_bind(p1Bar1Fix,player1Bar1);
physics_fixture_delete(p1Bar1Fix);
p1WheelFix = physics_fixture_create();
physics_fixture_set_circle_shape(p1WheelFix,2);
physics_fixture_set_density(p1WheelFix,0.1);
physics_fixture_bind(p1WheelFix,player1Wheel);
physics_fixture_delete(p1WheelFix);

p2HeadFix = physics_fixture_create();
physics_fixture_set_circle_shape(p2HeadFix,obj_Player2.sprite_width/2);
physics_fixture_set_density(p2HeadFix, 0.5);
physics_fixture_set_restitution(p2HeadFix, 0.8);
physics_fixture_bind(p2HeadFix,player2Head);
physics_fixture_delete(p2HeadFix);
p2Bar0Fix = physics_fixture_create();
physics_fixture_set_box_shape(p2Bar0Fix,2,1);
physics_fixture_set_density(p2Bar0Fix, 0.1);
physics_fixture_bind(p2Bar0Fix,player2Bar0);
physics_fixture_delete(p2Bar0Fix);
p2Bar1Fix = physics_fixture_create();
physics_fixture_set_box_shape(p2Bar1Fix,2,1);
physics_fixture_set_density(p2Bar1Fix, 0.1);
physics_fixture_bind(p2Bar1Fix,player2Bar1);
physics_fixture_delete(p2Bar1Fix);
p2WheelFix = physics_fixture_create();
physics_fixture_set_circle_shape(p2WheelFix,2);
physics_fixture_set_density(p2WheelFix,0.1);
physics_fixture_bind(p2WheelFix,player2Wheel);
physics_fixture_delete(p2WheelFix);

//joint creation
physics_joint_revolute_create(player1Head,player1Bar0,obj_Player1.x,obj_Player1.y,0,0,false,9,0,false,false);
physics_joint_revolute_create(player1Bar0,player1Bar1,obj_Player1.x+4,obj_Player1.y,0,0,false,9,0,false,false);
physics_joint_revolute_create(player1Bar1,player1Wheel,obj_Player1.x+8,obj_Player1.y,0,0,false,9,0,false,false);

physics_joint_revolute_create(player2Head,player2Bar0,obj_Player2.x,obj_Player2.y,0,0,false,9,0,false,false);
physics_joint_revolute_create(player2Bar0,player2Bar1,obj_Player2.x-4,obj_Player2.y,0,0,false,9,0,false,false);
physics_joint_revolute_create(player2Bar1,player2Wheel,obj_Player2.x-8,obj_Player2.y,0,0,false,9,0,false,false);

prisJoint1 = physics_joint_prismatic_create(player1Wheel,player2Wheel,obj_Player1.x+8,obj_Player1.y,10,0,-150,150,true,1000,-500,false,false);
prisJoint2 = physics_joint_prismatic_create(player2Wheel,player1Wheel,obj_Player2.x-8,obj_Player2.y,-10,0,-150,150,true,1000,-500,false,false);
physics_joint_rope_create(player1Head,player2Head,obj_Player1.x,obj_Player1.y,obj_Player2.x,obj_Player2.y,300,false);

//helper functions
function player1_grab_press()
{
	p1grabbing = true;
}

function player2_grab_press()
{
	p2grabbing = true;
}

function player1_grab_release()
{
	p1grabbing = false;
	p1grabbed = false;
}

function player2_grab_release()
{
	p2grabbing = false;
	p2grabbed = false;
}

function player1_tense_press()
{
	physics_joint_enable_motor(prisJoint1,true);
	p1contracting = true;
}

function player2_tense_press()
{
	physics_joint_enable_motor(prisJoint2,true);
	p2contracting = true;
}

function player1_tense_release()
{
	physics_joint_enable_motor(prisJoint1,false);
	p1contracting = false;
}

function player2_tense_release()
{
	physics_joint_enable_motor(prisJoint2,false);
	p2contracting = false;
}

function player1_impulse()
{
    var dir = point_direction(player1Head.x, player1Head.y, mouse_x, mouse_y);
	with (player1Head)
	{
		physics_apply_impulse(x, y, lengthdir_x(300, dir), lengthdir_y(300, dir));	
	}
}

function player2_impulse()
{
    var dir = point_direction(player2Head.x, player2Head.y, mouse_x, mouse_y);
	with (player2Head)
	{
		physics_apply_impulse(x, y, lengthdir_x(300, dir), lengthdir_y(300, dir));	
	}
}

render_flags = phy_debug_render_shapes | phy_debug_render_joints | phy_debug_render_coms | phy_debug_render_obb;
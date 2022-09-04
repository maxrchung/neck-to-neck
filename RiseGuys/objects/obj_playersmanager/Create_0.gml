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
player1Head = instance_create_layer(obj_StartLocation.x-100,obj_StartLocation.y, layer, obj_PlayerCollider);
player1Bar0 = instance_create_layer(obj_StartLocation.x-98,obj_StartLocation.y,layer,obj_NonCollidable);
player1Bar1 = instance_create_layer(obj_StartLocation.x-94,obj_StartLocation.y,layer,obj_NonCollidable);
player1Wheel = instance_create_layer(obj_StartLocation.x-92,obj_StartLocation.y,layer,obj_NonCollidable);
player2Head = instance_create_layer(obj_StartLocation.x+100,obj_StartLocation.y, layer, obj_PlayerCollider);
player2Bar0 = instance_create_layer(obj_StartLocation.x+98,obj_StartLocation.y,layer,obj_NonCollidable);
player2Bar1 = instance_create_layer(obj_StartLocation.x+94,obj_StartLocation.y,layer,obj_NonCollidable);
player2Wheel = instance_create_layer(obj_StartLocation.x+92,obj_StartLocation.y,layer,obj_NonCollidable);

//create and bind physics fixtures
p1HeadFix = physics_fixture_create();
physics_fixture_set_circle_shape(p1HeadFix,20);
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
physics_fixture_set_circle_shape(p2HeadFix,20);
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
physics_joint_revolute_create(player1Head,player1Bar0,obj_StartLocation.x-100,obj_StartLocation.y,0,0,false,9,0,false,false);
physics_joint_revolute_create(player1Bar0,player1Bar1,obj_StartLocation.x-96,obj_StartLocation.y,0,0,false,9,0,false,false);
physics_joint_revolute_create(player1Bar1,player1Wheel,obj_StartLocation.x-92,obj_StartLocation.y,0,0,false,9,0,false,false);

physics_joint_revolute_create(player2Head,player2Bar0,obj_StartLocation.x+100,obj_StartLocation.y,0,0,false,9,0,false,false);
physics_joint_revolute_create(player2Bar0,player2Bar1,obj_StartLocation.x+96,obj_StartLocation.y,0,0,false,9,0,false,false);
physics_joint_revolute_create(player2Bar1,player2Wheel,obj_StartLocation.x+92,obj_StartLocation.y,0,0,false,9,0,false,false);

prisJoint1 = physics_joint_prismatic_create(player1Wheel,player2Wheel,obj_StartLocation.x-92,obj_StartLocation.y,10,0,-150,150,true,1000,-500,false,false);
prisJoint2 = physics_joint_prismatic_create(player2Wheel,player1Wheel,obj_StartLocation.x+92,obj_StartLocation.y,-10,0,-150,150,true,1000,-500,false,false);
physics_joint_rope_create(player1Head,player2Head,obj_StartLocation.x-100,obj_StartLocation.y,obj_StartLocation.x+100,obj_StartLocation.y,300,false);
/// @description Insert description here
// You can write your code in this editor

playerNeck.x = (player1Head.x + player2Head.x)/2
playerNeck.y = (player1Head.y + player2Head.y)/2
playerNeck.image_xscale = sqrt(power(player1Head.x-player2Head.x,2)+power(player1Head.y-player2Head.y,2)) / 1366;
playerNeck.image_angle = radtodeg(arctan2((player1Head.y-playerNeck.y),(playerNeck.x-player1Head.x)));

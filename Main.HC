#include "C:/Home/Projects/temple-invaders/Defs.HC"
#include "C:/Home/Projects/temple-invaders/Player.HC"

U0 Game()
{
	InitPlayer; // Set start position and state for the player
	
	// Loop runs until ESC is physically held down
	while (!KeyDown(SC_ESC)){
		DCFill(BLACK);	// Clear the last frame
		UpdatePlayer;	// Read input & update player position
		DrawPlayer;	// Draw player sprite
		Refresh;	// Push framebuffer to screen
		Sleep(33);	// wait ~33ms (33.333...ms -> target  30 FPS)
	}
}

Game;
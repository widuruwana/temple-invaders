#include "C:/Home/Projects/temple-invaders/Defs.HC"
#include "C:/Home/Projects/temple-invaders/Bullets.HC"
#include "C:/Home/Projects/temple-invaders/Player.HC"

// DrawIT is called automatically by templeOS every frame
// CDC stands for CDevice Context. dc is a pointer to which surface
//-to draw on.
U0 DrawIt(CTask *, CDC *dc)
{
	// clear the screen
	dc->color = BLACK;
	GrRect(dc, 0, 0, SCREEN_W, SCREEN_H);

	// draw the player
	DrawPlayer(dc);
	// draw the bullet
	DrawBullet(dc);
}

U0 Game()
{
	InitPlayer; // Set start position and state for the player
	InitBullet; // same for the bullet

	// Resize the window to full screen
	WinMax;

	SettingsPush; // Save the OSstate

	Fs->draw_it = &DrawIt; // tellOS to call DrawIt every frame
	
	// Loop runs until ESC is physically held down
	while (!KeyDown(SC_ESC)){
		UpdatePlayer;	// Read input & update player position
		UpdateBullet;
		Sleep(33);	// 33ms targets 30Fps
	}

	SettingsPop; // restore OSstate
}

Game;
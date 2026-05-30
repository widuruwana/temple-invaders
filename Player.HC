/* --> Few words from the developer <---

  Ihereby put the cornerstone to the project temple-invaders which is inten-
  -ded to be a spiritual successor to 1978 Space Invaders arcade game, written
  entirely in HolyC and running on TempleOS just as God intended.

  Iwant the game to feel like it could have shipped alongside Terry's own
  games, with simple arcade controls, responsiveness, and sprites drawn with
  TempleOS sprite editor.

  In honor of Terry A.Davis (1969 - 2018).

*/

classPlayer
{
	I64 x, y, respawn_timer;
	Bool alive;
	Bool space_held;
};

Player player;

U0 InitPlayer()
{
	player.x = SCREEN_W / 2 - PLAYER_W / 2;
	player.y = PLAYER_Y;
	player.alive = TRUE;
	player.respawn_timer = 0;
	player.space_held = FALSE;
}

U0 UpdatePlayer()
{
	// Count down the respawn timer while dead
	if(!player.alive){
		player.respawn_timer--;
		if (player.respawn_timer <= 0){
			player.alive = TRUE;
			player.x = SCREEN_W / 2 - PLAYER_W / 2;
		}
		return; // no input while dead
	}

	// Movement -> both keys tested independantly in each frame.
	// ex: LEFT+SPACEworks simultaneously
	// KeyDown() returns true if the key is physically pressed.
	if(KeyDown(SC_LEFT)) player.x -= PLAYER_SPD;
	if(KeyDown(SC_RIGHT)) player.x += PLAYER_SPD;

	// Clamps the screen edges so the ship cant leave it
	if (player.x < 0) player.x = 0;

	// SCREEN_W is 640 but the actual drawable area of the window
	//-is smaller because of border and menu bar on the sides.

	/*
	  --> Fs stands for ForeSround task <---
	  In TempleOS every running process is a task and each task has a
	  "CTask" struct that holds everything about it like its window
	  dimensions, memory, the "draw_it" pointer, priority, etc. 
	*/
	if (player.x > Fs->pix_width - PLAYER_W){
		player.x = Fs->pix_width - PLAYER_W;
	}

	// Shooting -> cannot hold space for full auto
	if (KeyDown(SC_SPACE) && !player.space_held){
		player.space_held = TRUE;
		FirePlayerBullet(player.x + PLAYER_W / 2, player.y);
	}

	// space is released
	if (!KeyDown(SC_SPACE)){
		player.space_held = FALSE;
	}
}

U0 DrawPlayer(CDC *dc)
{
	if(player.alive){
		dc->color = GREEN;
		GrRect(dc, player.x, player.y, PLAYER_W, PLAYER_H);
	}
}
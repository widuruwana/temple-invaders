class Bullet{
	I64 x, y;
	Bool alive;
	Bool is_enemy; // False = player, TRUE = enemy
};

// global bullet array
Bullet bullets[MAX_BULLETS];

U0 InitBullets()
{
	I64 i;
	for(i = 0; i < MAX_BULLETS; i++){
		bullets[i].alive = FALSE;
	}
}

// Player bullet always in slot 0
U0 FirePlayerBullet(I64 x, I64 y)
{
	if (bullets[0].alive) return;
	
	bullets[0].x = x;
	bullets[0].y = y;
	bullets[0].alive = TRUE;
	bullets[0].is_enemy = FALSE;
}

U0 UpdateBullets()
{
	I64 i;
	for(i = 0; i < MAX_BULLETS; i++){
		if(!bullets[i].alive) goto skip_update; // skip dead slots

		// Move up if player bullet, move down if enemy bullet
		if(bullets[i].is_enemy){
			bullets[i].y += ENEMY_BULLET_SPD;
		}else{
			bullets[i].y -= PLAYER_BULLET_SPD;
		}
	
	
		// Kills bullet if it goes offscreen
		if(bullets[i].y < 0 || bullets[i].y > SCREEN_H){
			bullets[i].alive = FALSE;
		}

		skip_update:

	}
}

U0 DrawBullets(CDC* dc)
{
	I64 i;
	for(i = 0; i < MAX_BULLETS; i++){

		if(!bullets[i].alive)goto skip_draw;

		if(bullets[i].is_enemy){
			dc->color = RED;
			 
		}else{
			dc->color = LTGREEN;
		}

		GrRect(dc, bullets[i].x - (BULLET_W/2) , bullets[i].y,
			BULLET_W, PLAYER_H);

		skip_draw:
	}
}































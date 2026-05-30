class Bullet{
	I64 x, y;
	Bool alive;
};

// global bullet
Bullet bullet;

U0 InitBullet()
{
	bullet.alive = FALSE;
}

U0 FirePlayerBullet(I64 x, I64 y){
	bullet.x = x;
	bullet.y = y;
	bullet.alive = TRUE;
}

U0 UpdateBullet(){
	if(bullet.alive){
		bullet.y = bullet.y - PLAYER_BULLET_SPD;
	}
	if(bullet.y < 0){
		bullet.alive = FALSE;
	}
}

U0 DrawBullet(CDC* dc){
	if(bullet.alive){
		dc->color = BLUE;
		GrRect(dc, bullet.x - (BULLET_W/2) , bullet.y, BULLET_W, PLAYER_H); 
	}
}
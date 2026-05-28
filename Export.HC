// I advice to run this before every shutdown and after every successful test
// Copies all the source files to C:/Tmp where they would survive a crash and
//-can be grabbed by ImDisk on the Windows side.
// C:/Tmp is cleared on reboot so always pull files to windows before shutdown

U0 Export()
{
	Copy("C:/Home/Projects/temple-invaders/Main.HC", "C:/Tmp/Main.HC");
	Copy("C:/Home/Projects/temple-invaders/Defs.HC", "C:/Tmp/Defs.HC");
	Copy("C:/Home/Projects/temple-invaders/Player.HC", "C:/Tmp/Player.HC");
	Copy("C:/Home/Projects/temple-invaders/Sprites.HC", "C:/Tmp/Sprites.HC");
	Copy("C:/Home/Projects/temple-invaders/Enemies.HC", "C:/Tmp/Enemies.HC");
	Copy("C:/Home/Projects/temple-invaders/Bullets.HC", "C:/Tmp/Bullets.HC");
	Copy("C:/Home/Projects/temple-invaders/Sound.HC", "C:/Tmp/Sound.HC");
	Copy("C:/Home/Projects/temple-invaders/Export.HC", "C:/Tmp/Export.HC");
}
Export;
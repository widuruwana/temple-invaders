// Screen
#define SCREEN_W 640
#define SCREEN_H 480

// Player
#define PLAYER_Y 430
#define PLAYER_W 32
#define PLAYER_H 16
#define PLAYER_SPD 4

// Respawn
#define TARGET_FPS 30
#define RESPAWN_SECS 2
#define RESPAWN_FRAMES (TARGET_FPS * RESPAWN_SECS)

// Scan codes-> Hardware-level key identifiers
#define SC_LEFT 75   // left arrow
#define SC_RIGHT 77  // right arrow
#define SC_SPACE 57  // spacebar
#define SC_ESC 1 // escape

// Bt() tests a single bit; if the bit at position sc is set in
// kbd.down_bitmap then that key is physically held.
Bool KeyDown(I64 sc)
{
	return Bt(kbd.down_bitmap, sc);
}
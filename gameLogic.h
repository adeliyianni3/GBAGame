#include "myLib.h"
//masks
#define ROWMASK 0xFF
#define COLMASK 0x1FF

//macros for states
#define SPLASHSCREEN 0
#define GAMESCREEN 1
#define LOSESCREEN 2
#define PAUSESCREEN 3
#define INSTRUCSCREEN 4
#define CHARSCREEN 5
#define CHEATMODE 6
#define CUTSCENE 7

//Prototypes
int abs(int);
int ninjaHit(MOVOBJ*, MOVOBJ*);
void move(int, MOVOBJ*);
void updatePlayer(MOVOBJ*);
void updateBullet(MOVOBJ*);
void updateStats(MOVOBJ*);
void update(MOVOBJ*);
void enemyTurnAround(MOVOBJ*);
void hitPlayer(MOVOBJ*, MOVOBJ*);
void updateBadies(MOVOBJ*, MOVOBJ*);
void hideSprites();
void updatePowerUps(MOVOBJ*);
char allNinjasDead();
void updateBoss(MOVOBJ*, MOVOBJ*);
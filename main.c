    /*****************************************
    The intended gameplay is a side scrolling
    brawler. You are suppossed to kill ninjas
    as you pass each of the 2 stages, while 
    the third is a boss stage.
    Bugs: N/A (noticed nothing so far)
    Extra Credit: 
    	line 625 of gameLogic.c has
    		the code for the jump action of
    		the player. Here gravity is 
    		implemented.
		lines 164 and 175 in main.c are what
			sorts the ninjas and the player
			on the screen (so you can pass 
			behind or infront of them) so
			depth.
		lines under updateBadies and updatePlayer
			use a pause system of enums. Thus,
			when the player and ninjas are 
			they are pushed back from impact.
			Physics. (gameLogic.c start 684 and
			210)
    ******************************************/


#include "BG512x512.h"
#include "pause.h"
#include "splash.h"
#include "instruc.h"
#include "lose.h"
#include "bg2.h"
#include "bg3.h"
#include "bg4.h"
#include "bg5.h"
#include "win.h"
#include "charSelect.h"
#include "gameLogic.h"
#include "sailormoonSprites.h"
#include "mercurySprites.h"
#include "venusSprites.h"
#include "TuxedoSprites.h"
#include "marsSprites.h"
#include "neptuneSprites.h"
#include "uranusSprites.h"    
#include "plutoSprites.h"
#include "saturnSprites.h"
#include "usaSprites.h"
#include "JupiterSprites.h"
#include "sound.h"
#include "myLib.h"
#include "cutScene2.h"
#include "cutScene1.h"
#include "SailorMoon.h"
#include "Victory.h"
#include "Stage_12.h"
#include "Stage_3.h"
#include "Game_Over.h"
#include "Tuxedo.h"
#include <stdlib.h>
#include <stdio.h>
#include <time.h> 

//Prototypes
void game();
void lose();
void pause();
void initInstruc();
void instruc();
void initPause();
void initialize();
void splash();
void charSelect();
void initGame();
void initLose();
void initWin();
void cutScene();
void stageUpdate();

//Variables
MOVOBJ player; //player
MOVOBJ boss; //boss
SPRITESHEET currentSSheet; //current character sheet
MOVOBJ ninja[NUMBADIES]; //ninja array
MOVOBJ * sprites[NUMBADIES+1]; //sprite pointer array for sorting
MOVOBJ powerUp; //powerUp
MOVOBJ bul[NUMBULLETS]; //player's bullets
char state; //state
MOVOBJ bossBul[NUMBULLETS];//bosses bullets
int gameCounter = -1; //game in progress if greater then 0
unsigned int buttons;
unsigned int oldButtons;
int character; //character tracker for select
int stage;//current stage
char cheat;// on/offs cheat
time_t t; //time for random
char mute; //on/offs mute
int cut; //variable tracks cutscene progress


//Variables
extern int hOff;
extern int vOff;
extern int goingUp;
extern int countShots;
extern int power;
extern int powerTime;

OBJ_ATTR shadowOAM[128];

int main(){
	setupInterrupts();
	setupSounds();
    initialize();
	while(1) {
		oldButtons = buttons;
		buttons = BUTTONS;
		switch(state) {
			//splash state
			case SPLASHSCREEN:
				splash();
				break;
			//character select
			case CHARSCREEN:
				charSelect();
				DMANow(3, &shadowOAM, OAM, sizeof(shadowOAM)/2);
				waitForVblank();
				break;
			//game state
			case GAMESCREEN:
				gameCounter++;
				if (gameCounter&1) {
					game();
					DMANow(3, &shadowOAM, OAM, sizeof(shadowOAM)/2);
					waitForVblank();
				}
			    if(BUTTON_PRESSED(BUTTON_SELECT)) {
					state = PAUSESCREEN;
					initPause();
				}
				if (BUTTON_PRESSED(BUTTON_A) && player.pause == 0) {//punching dealt with here
					player.pause = 40;
				}
				if (BUTTON_PRESSED(BUTTON_R)) {//to cheat state
					state = CHEATMODE;
					cheat = 1;
					DMANow(3, TuxedoSpritesPal, SPRITE_PALETTE, TuxedoSpritesPalLen/2);
    				DMANow(3, TuxedoSpritesTiles, &CHARBLOCKBASE[4], TuxedoSpritesTilesLen/2);
				}
				break;
			case CHEATMODE:
				gameCounter++;
				if (gameCounter&1) {
					game();
					DMANow(3, &shadowOAM, OAM, sizeof(shadowOAM)/2);
					waitForVblank();
				}
			    if(BUTTON_PRESSED(BUTTON_SELECT)) {
					state = PAUSESCREEN;
					initPause();
				}
				if (BUTTON_PRESSED(BUTTON_A) && player.pause == 0) {//punching dealt with here
					player.pause = 40;
				}
				if (BUTTON_PRESSED(BUTTON_R)) {//to game state
					state = GAMESCREEN;
					cheat = 0;
					DMANow(3, currentSSheet.playerPal, SPRITE_PALETTE, currentSSheet.playerPalLen/2);
    				DMANow(3, currentSSheet.playerTiles, &CHARBLOCKBASE[4], currentSSheet.playerTilesLen/2);
				}
				break;
			//lose state
			case LOSESCREEN:
				lose();
				break;
			//pause state
			case PAUSESCREEN:
				pause();
				break;
			//instruction state
			case INSTRUCSCREEN:
				instruc();
				break;
			//cutscene state
			case CUTSCENE:
				cutScene();
				break;
		}
	}
	return 0;
}
int spritesCompRow(const void * a,const void * b) {
	MOVOBJ *orderA = *(MOVOBJ **)a;
  	MOVOBJ *orderB = *(MOVOBJ **)b;
  	//return player as in front if equal to or in range of 3 difference to ninja
  	if ((orderB == &player) && (abs((orderB->row + orderB->height) - (orderA->row + orderB->height))<3)) {
  		return 1;
  	} else if ((orderA == &player) && (abs((orderB->row + orderB->height) - (orderA->row + orderB->height))<3)) {
  		return -1;
  	} else {
 		return ( (orderB->row + orderB->height) - (orderA->row + orderB->height) );
 	}
}
void sortSprites() {//sort sprites-ninjas and player by row
	qsort(sprites, sizeof(sprites)/sizeof(sprites[0]), sizeof(sprites[0]), spritesCompRow);
	for (int i = 0; i < NUMBADIES+1; i++) {
		(*sprites[i]).oamNum = i;
	}
}
void stageUpdate() {
	if (stage == 0) { //set up stage 0
		//bg
		loadPalette(BG512x512Pal);
		DMANow(3, BG512x512Tiles, &CHARBLOCKBASE[0], (BG512x512TilesLen/2));
		DMANow(3, BG512x512Map, &SCREENBLOCKBASE[27], (BG512x512MapLen/2));
		DMANow(3, bg2Tiles, &CHARBLOCKBASE[2], (bg2TilesLen/2));
		DMANow(3, bg2Map, &SCREENBLOCKBASE[30], (bg2MapLen/2));
	} else if (stage == 1) {
		//bg
		loadPalette(bg3Pal);
		DMANow(3, bg3Tiles, &CHARBLOCKBASE[0], (bg3TilesLen/2));
		DMANow(3, bg3Map, &SCREENBLOCKBASE[27], (bg3MapLen/2));
		DMANow(3, bg4Tiles, &CHARBLOCKBASE[2], (bg4TilesLen/2));
		DMANow(3, bg4Map, &SCREENBLOCKBASE[30], (bg4MapLen/2));
	} else if (stage == 2) {
		if (!mute) {//music
			playSoundA(Stage_3,STAGE_3LEN,STAGE_3FREQ);
		}
		//bg
		loadPalette(bg3Pal);
		DMANow(3, bg3Tiles, &CHARBLOCKBASE[0], (bg3TilesLen/2));
		DMANow(3, bg3Map, &SCREENBLOCKBASE[27], (bg3MapLen/2));
		DMANow(3, bg5Tiles, &CHARBLOCKBASE[2], (bg5TilesLen/2));
		DMANow(3, bg5Map, &SCREENBLOCKBASE[30], (bg5MapLen/2));
		//life bar for boss
		for (int i = 1; i < 11; i++) {
			shadowOAM[116 + i].attr0 = (ROWMASK & 16) | ATTR0_SQUARE;
			shadowOAM[116 + i].attr1 = ATTR1_SIZE8 | (COLMASK & (160 + (4*(i-1))));
			if (boss.hit >= (i*10)) {//bar 2
				if (boss.hit >= ((i*10) + 100)) {
					shadowOAM[116 + i].attr0 = ATTR0_HIDE;
				} else {
					shadowOAM[116 + i].attr2 = (SPRITEOFFSET16(10, 23)) | ATTR2_PAL4;
				}
			} else {
				shadowOAM[116 + i].attr2 = (SPRITEOFFSET16(10, 22)) | ATTR2_PAL4;
			}
		}
		//kyuubey's avatar
		shadowOAM[116].attr0 = (ROWMASK & 0) | ATTR0_SQUARE;
		shadowOAM[116].attr1 = ATTR1_SIZE32 | (COLMASK & (200));
		shadowOAM[116].attr2 = (SPRITEOFFSET16(6, 22)) | ATTR2_PAL4;
	}
	//character icon
	shadowOAM[19].attr0 = (ROWMASK & 0) | ATTR0_SQUARE;
	shadowOAM[19].attr1 = ATTR1_SIZE32 | (COLMASK & 0);
	shadowOAM[19].attr2 = (SPRITEOFFSET16(0, 25));
}
void game() {
	sortSprites(); //sorts ninjas and player for physics
	updateStats(&player); //update stats
	updatePlayer(&player); //updates player
	for (int i = 0; i < NUMBADIES; i++) { //updates ninjas
		updateBadies(&ninja[i], &player);
	}
    if (stage ==2){ //boss states
		updateBoss(&boss, &player); //update boss
	}
	for(int i = 0; i < NUMBULLETS; i++) {
		updateBullet(&bul[i]);//player's bullets
	}
	updatePowerUps(&powerUp);//update powerup
	//if player is hit 10 times
	if (player.hit >= 10) {
		hOff = 0;
    	vOff = 0;
		initLose();
	}
	if ((player.col>=240) && allNinjasDead()) {//if left screen and all ninjas are dead
		//new stage
		hideSprites();//hide
		stage++;//next stage
		if (stage > 2) { //beat boss stage
			initWin(); //win state
		}
		powerUp.active = 0;//deactivate powerup
		stageUpdate();//update stage
		if (stage==2) {
			boss.active = 1;
			for (int i=0;i<NUMBADIES;i++) {
				ninja[i].col = 400;
			}
		} else {
			//replace if less then stage 2
			for (int i = 0; i < NUMBADIES; i++) {
				ninja[i].row = 110 + (2*i);
			    ninja[i].col = 300 + 120*i;
			    ninja[i].cdel = -1;
			    ninja[i].hit = 0;
			    ninja[i].width = 20;
			    ninja[i].height = 40;
			    ninja[i].active = 0;
			    ninja[i].aniCounter = 0;
			    ninja[i].aniState = 4;
			    ninja[i].currFrame = 0;
			    ninja[i].pause = 0;
			    ninja[i].rdel = 0;
			}
		}
		player.col = 50-player.width;
		hOff = 0;
		vOff = 0;
	}
    REG_BG1HOFS = hOff/2;
    REG_BG1VOFS = vOff/2;
    REG_BG0HOFS = hOff;
    REG_BG0VOFS = vOff;
}
//lose
void lose(){
	//hit start
    if(BUTTON_PRESSED(BUTTON_START)) {//splash
    	//go to splash
    	stopSound();
		REG_BG0HOFS = 0;
    	REG_BG0VOFS = 0;
    	gameCounter = -1;
		state = SPLASHSCREEN;
		initialize();
	}
}
//pause
void pause(){
	REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    //hit start, start game
    if(BUTTON_PRESSED(BUTTON_START)) {//game
		initGame();
		stageUpdate();
		if (stage < 2) { //set up stage music for 1 or 0
			if (!mute) {//music
				playSoundA(Stage_12,STAGE_12LEN,STAGE_12FREQ);
			}
		}
		if (cheat) {//to cheat mode
			state = CHEATMODE;
		} else {//game mode
			state = GAMESCREEN;
		}
	}
	//hit select, restart game
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		gameCounter = -1;
		initGame();
		if (!mute) { //unmuted sound
			playSoundA(Stage_12,STAGE_12LEN,STAGE_12FREQ);
		}
		state = GAMESCREEN;
	}
	if(BUTTON_PRESSED(BUTTON_A)) {// mute unmute sounds
		if (mute) {
			mute = 0;
			unpauseSound();
		} else {
			mute = 1;
			pauseSound();
		}
	}
}
//initiate instruction screen
void initInstruc() {
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	if (!mute) {
		playSoundA(Tuxedo,TUXEDOLEN,TUXEDOFREQ);
	}
	loadPalette(instrucPal);
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1;  
	DMANow(3, instrucTiles, &CHARBLOCKBASE[0], (instrucTilesLen/2));
	DMANow(3, instrucMap, &SCREENBLOCKBASE[27], (instrucMapLen/2));	
}
//instructio state, press start to play
//press select to go back to splash
void instruc() {
	if(BUTTON_PRESSED(BUTTON_START)) {//to char select menu
		state = CHARSCREEN;
		REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
		loadPalette(charSelectPal);
		DMANow(3, charSelectTiles, &CHARBLOCKBASE[0], (charSelectTilesLen/2));
		DMANow(3, charSelectMap, &SCREENBLOCKBASE[27], (charSelectMapLen/2));
    	//char icon selected
    	shadowOAM[0].attr0 = (ROWMASK & 50) | ATTR0_SQUARE;
		shadowOAM[0].attr1 = ATTR1_SIZE32 | (COLMASK & 60);
		shadowOAM[0].attr2 = (SPRITEOFFSET16(0, 25));
	}
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
		state = SPLASHSCREEN;
		initialize();
	}	
}
//initiate pause screen
void initPause() {//pause menu set up
	if (!mute) {
		playSoundA(Tuxedo,TUXEDOLEN,TUXEDOFREQ);
	}
	loadPalette(pausePal);
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1;  
	DMANow(3, pauseTiles, &CHARBLOCKBASE[0], (pauseTilesLen/2));
	DMANow(3, pauseMap, &SCREENBLOCKBASE[27], (pauseMapLen/2));
}
//initiate splash screen
void initialize() {
	//initialize the display control as mode 4, bg 2, and buffer 2
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1;
	loadPalette(splashPal);   
	DMANow(3, splashTiles, &CHARBLOCKBASE[0], (splashTilesLen/2));
	DMANow(3, splashMap, &SCREENBLOCKBASE[27], (splashMapLen/2));
	if (!mute) {
		playSoundA(SailorMoon,SAILORMOONLEN,SAILORMOONFREQ);
	}
	state = SPLASHSCREEN; //set the state as splash
	buttons = BUTTONS; //initialize buttons as BUTTONS
	character = 0;
	//sets up default character
	currentSSheet.playerPal = sailormoonSpritesPal;
	currentSSheet.playerPalLen = sailormoonSpritesPalLen;
	currentSSheet.playerTiles = sailormoonSpritesTiles;
	currentSSheet.playerTilesLen = sailormoonSpritesTilesLen;
	DMANow(3, currentSSheet.playerPal, SPRITE_PALETTE, currentSSheet.playerPalLen/2);
	DMANow(3, currentSSheet.playerTiles, &CHARBLOCKBASE[4], currentSSheet.playerTilesLen/2);
	hideSprites();
}
void initLose() {
	//initialize the display control as mode 4, bg 2, and buffer 2
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1;
	loadPalette(losePal);   
	DMANow(3, loseTiles, &CHARBLOCKBASE[0], (loseTilesLen/2));
	DMANow(3, loseMap, &SCREENBLOCKBASE[27], (loseMapLen/2));
	if (!mute) {
		playSoundA(Game_Over,GAME_OVERLEN,GAME_OVERFREQ);
	}
	state = LOSESCREEN; //set the state as splash
}
void initWin() {
	//initialize the display control as mode 4, bg 2, and buffer 2
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1;
	loadPalette(winPal);   
	DMANow(3, winTiles, &CHARBLOCKBASE[0], (winTilesLen/2));
	DMANow(3, winMap, &SCREENBLOCKBASE[27], (winMapLen/2));
	stopSound();
	if (!mute) {
		playSoundB(Victory,VICTORYLEN,VICTORYFREQ);
	}
	state = LOSESCREEN; //set the state as splash
}
//splash state
//press start to play
//press select to go to instructions
void splash(){
	if(BUTTON_PRESSED(BUTTON_START)) { //goes to char select menu
		if (!mute) {
			playSoundA(Tuxedo,TUXEDOLEN,TUXEDOFREQ);
		}
		state = CHARSCREEN;
		//set up bg's
		REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
		loadPalette(charSelectPal);
		DMANow(3, charSelectTiles, &CHARBLOCKBASE[0], (charSelectTilesLen/2));
		DMANow(3, charSelectMap, &SCREENBLOCKBASE[27], (charSelectMapLen/2));
		//faces of char selected
    	shadowOAM[0].attr0 = (ROWMASK & 50) | ATTR0_SQUARE;
		shadowOAM[0].attr1 = ATTR1_SIZE32 | (COLMASK & 60);
		shadowOAM[0].attr2 = (SPRITEOFFSET16(0, 25));
	}
    if(BUTTON_PRESSED(BUTTON_SELECT)) {//goes to instructions
		state = INSTRUCSCREEN;
    	initInstruc();
    }
}
void loadChar() { //loads in different character sprite sheets
	if (character == 0) { //sailor moon
		currentSSheet.playerPal = sailormoonSpritesPal;
		currentSSheet.playerPalLen = sailormoonSpritesPalLen;
		currentSSheet.playerTiles = sailormoonSpritesTiles;
		currentSSheet.playerTilesLen = sailormoonSpritesTilesLen;
	} else if (character == 1) { //mercury
		currentSSheet.playerPal = mercurySpritesPal;
		currentSSheet.playerPalLen = mercurySpritesPalLen;
		currentSSheet.playerTiles = mercurySpritesTiles;
		currentSSheet.playerTilesLen = mercurySpritesTilesLen;
	} else if (character == 2) { //venus
		currentSSheet.playerPal = venusSpritesPal;
		currentSSheet.playerPalLen = venusSpritesPalLen;
		currentSSheet.playerTiles = venusSpritesTiles;
		currentSSheet.playerTilesLen = venusSpritesTilesLen;			
	} else if (character == 3) { //mars
		currentSSheet.playerPal = marsSpritesPal;
		currentSSheet.playerPalLen = marsSpritesPalLen;
		currentSSheet.playerTiles = marsSpritesTiles;
		currentSSheet.playerTilesLen = marsSpritesTilesLen;				
	} else if (character == 4) { //jupiter
		currentSSheet.playerPal = JupiterSpritesPal;
		currentSSheet.playerPalLen = JupiterSpritesPalLen;
		currentSSheet.playerTiles = JupiterSpritesTiles;
		currentSSheet.playerTilesLen = JupiterSpritesTilesLen;				
	} else if (character == 5) { //uranus
		currentSSheet.playerPal = uranusSpritesPal;
		currentSSheet.playerPalLen = uranusSpritesPalLen;
		currentSSheet.playerTiles = uranusSpritesTiles;
		currentSSheet.playerTilesLen = uranusSpritesTilesLen;				
	} else if (character == 6) { //neptune
		currentSSheet.playerPal = neptuneSpritesPal;
		currentSSheet.playerPalLen = neptuneSpritesPalLen;
		currentSSheet.playerTiles = neptuneSpritesTiles;
		currentSSheet.playerTilesLen = neptuneSpritesTilesLen;				
	} else if (character == 7) { //pluto
		currentSSheet.playerPal = plutoSpritesPal;
		currentSSheet.playerPalLen = plutoSpritesPalLen;
		currentSSheet.playerTiles = plutoSpritesTiles;
		currentSSheet.playerTilesLen = plutoSpritesTilesLen;				
	} else if (character == 8) { //saturn
		currentSSheet.playerPal = saturnSpritesPal;
		currentSSheet.playerPalLen = saturnSpritesPalLen;
		currentSSheet.playerTiles = saturnSpritesTiles;
		currentSSheet.playerTilesLen = saturnSpritesTilesLen;				
	} else {//chibi usa
		currentSSheet.playerPal = usaSpritesPal;
		currentSSheet.playerPalLen = usaSpritesPalLen;
		currentSSheet.playerTiles = usaSpritesTiles;
		currentSSheet.playerTilesLen = usaSpritesTilesLen;				
	}//set character sheet at sprites
	DMANow(3, currentSSheet.playerPal, SPRITE_PALETTE, currentSSheet.playerPalLen/2);
   	DMANow(3, currentSSheet.playerTiles, &CHARBLOCKBASE[4], currentSSheet.playerTilesLen/2);
}
void cutScene() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		cut++;//increment through cutscene
		if (cut == 1) {
			loadPalette(BG512x512Pal);
			DMANow(3, BG512x512Tiles, &CHARBLOCKBASE[0], (BG512x512TilesLen/2));
			DMANow(3, BG512x512Map, &SCREENBLOCKBASE[27], (BG512x512MapLen/2));
			DMANow(3, cutScene2Tiles, &CHARBLOCKBASE[2], (cutScene2TilesLen/2));
			DMANow(3, cutScene2Map, &SCREENBLOCKBASE[30], (cutScene2MapLen/2));
		} 
	}
	if ((cut > 1) || (BUTTON_PRESSED(BUTTON_SELECT))) { //skips or starts game
		initGame();
		if (!mute) {//sound if not muted
			playSoundA(Stage_12,STAGE_12LEN,STAGE_12FREQ);
		}
		state = GAMESCREEN;
	}
}
//select a character sheet
void charSelect(){
	if (BUTTON_PRESSED(BUTTON_START)) {
		//set up cutscene image 1
		REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;
		REG_BG1CNT = CBB(0) | SBB(27) | BG_SIZE1;
		REG_BG0CNT = CBB(2) | SBB(30) | BG_SIZE0;
		loadPalette(BG512x512Pal);
		DMANow(3, BG512x512Tiles, &CHARBLOCKBASE[0], (BG512x512TilesLen/2));
		DMANow(3, BG512x512Map, &SCREENBLOCKBASE[27], (BG512x512MapLen/2));
		DMANow(3, cutScene1Tiles, &CHARBLOCKBASE[2], (cutScene1TilesLen/2));
		DMANow(3, cutScene1Map, &SCREENBLOCKBASE[30], (cutScene1MapLen/2));
		cut = 0;//cut scene starts
		state = CUTSCENE; //state
	}
    if(BUTTON_PRESSED(BUTTON_RIGHT)) { //move right in character select
		character++;
		if (character==10) {
			character = 0;
		}
		loadChar();
    }
    if(BUTTON_PRESSED(BUTTON_LEFT)) { //move left through characters
		character--;
		if (character==-1) {
			character = 9;
		}
		loadChar();
    }
}
//initiate game
void initGame() {
	//Enable sprites in the REG_DISPCTL
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
	//set bg reg's controls
	REG_BG1CNT = CBB(0) | SBB(27) | BG_SIZE1;
	REG_BG0CNT = CBB(2) | SBB(30) | BG_SIZE0;
	//if a game is being reset or hasnt already been started
    if(gameCounter<0) {
    	srand((unsigned) time(&t));//creates random
    	cheat = 0;//sets cheat to off
    	//set up player at beginning
	    player.width = 32;
	    player.height = 64;
	    player.rdel = 1;
	    player.cdel = 1;
		player.row = 110;
		power = 10;
		player.hit = 0;
		player.col = 50-player.width;
		player.aniCounter = 0;
	    player.currFrame = 0;
		player.aniState = 0; //walk
	    player.pause = 0;
	    player.oamNum = 0;

	    //sets up boss's attr
	    boss.width = 64;
	    boss.height = 32;
		boss.row = 115;
		boss.hit = 0;
		boss.col = 240 - boss.width;
		boss.aniCounter = 0;
	    boss.currFrame = 0;
		boss.aniState = 0; //walk
	    boss.pause = 0;
	    boss.oamNum = 80;
	    boss.active = 0;

	    buttons = BUTTONS;
		hOff = 0;
		vOff = 0;
		//start game
		gameCounter = 0;
		//not jumping
		goingUp = 0;
		sprites[0] = &player;//puts play in array
		//ninja's attr
		for (int i = 0; i < NUMBADIES; i++) {
			ninja[i].row = 110 + (2*i);
		    ninja[i].col = 300 + 120*i;
		    ninja[i].cdel = -1;
		    ninja[i].hit = 0;
		    ninja[i].width = 20;
		    ninja[i].height = 40;
		    ninja[i].active = 0;
		    ninja[i].aniCounter = 0;
		    ninja[i].aniState = 4;
		    ninja[i].currFrame = 0;
		    ninja[i].pause = 0;
		    ninja[i].rdel = 0;
		    ninja[i].oamNum = 1+i;
		    sprites[i+1] = &ninja[i];//puts ninjas in array
		}
		countShots = 0; //starts counter at 0
		//sets bullet's attrs
	    for (int i = 0; i < NUMBULLETS; i++) {
		    bul[i].active = 0;
		    bul[i].row = 115;
		    bul[i].cdel = 1;
		    bul[i].width = 16;
		    bul[i].height = 16;
		    bul[i].aniCounter = 0;
		    bul[i].aniState = 4;
		    bul[i].currFrame = 2;
		    bul[i].oamNum = 8+i;
		    bossBul[i].active = 0;
		    bossBul[i].row = -10*i;
		    bossBul[i].rdel = 1;
		    bossBul[i].cdel = -1;
		    bossBul[i].oamNum = 100+i;
		}
		//sets powerUp's attrs
			powerUp.active = 0;
			powerUp.row = 50;
			powerUp.col = 240;
			powerUp.cdel = -1;
			powerUp.width = 16;
		    powerUp.height = 16;
		    powerUp.aniState = 4;
		    powerUp.currFrame = 19;
		    powerUp.oamNum = 20;
		    powerTime = 0;
		    stage = 0;
	}
	if (cheat == 0) {
		//Import the player Tileset and Palette if not cheating
	    DMANow(3, currentSSheet.playerPal, SPRITE_PALETTE, currentSSheet.playerPalLen/2);
	    DMANow(3, currentSSheet.playerTiles, &CHARBLOCKBASE[4], currentSSheet.playerTilesLen/2);
	    hideSprites();
	}
	if (stage == 0) { //set up stage 0
		loadPalette(BG512x512Pal);
		DMANow(3, BG512x512Tiles, &CHARBLOCKBASE[0], (BG512x512TilesLen/2));
		DMANow(3, BG512x512Map, &SCREENBLOCKBASE[27], (BG512x512MapLen/2));
		DMANow(3, bg2Tiles, &CHARBLOCKBASE[2], (bg2TilesLen/2));
		DMANow(3, bg2Map, &SCREENBLOCKBASE[30], (bg2MapLen/2));
	}
    
    //CHAR ICON in upper left corner during game
    shadowOAM[18].attr0 = (ROWMASK & 0) | ATTR0_SQUARE;
	shadowOAM[18].attr1 = ATTR1_SIZE32 | (COLMASK & 0);
	shadowOAM[18].attr2 = (SPRITEOFFSET16(0, 25));
}
#include "math.h"
#include "myLib.h"
#include "collisionMap.h"
#include "gameLogic.h"
#include "sound.h"
#include "PUNCH.h"
#include "PUNCH2.h"
#include "HURT.h"
#include "EPUNCH.h"
#include "EPUNCH2.h"
#include "EHURT.h"
#include <stdio.h>
#include <stdlib.h>

//Variables from main
extern char state; //state
extern MOVOBJ ninja[]; //ninja list
extern MOVOBJ powerUp; //powerUp
extern MOVOBJ bul[]; //player's bullets
extern MOVOBJ bossBul[];
extern int stage; //stage
extern char cheat; //cheat
extern MOVOBJ boss; //boss
extern char mute; //mute

//Variables
enum {PAUSEHURT = -2, PAUSEHURTFLIP= -1, UNPAUSE = 0, PAUSEPUNCH = 1, PAUSESTAND = 40}; //pause enum
enum {WALK, INPLACE, FIGHT}; //state of sprite
char goingUp; //mid jump
int countShots; //helps make sure bullets arent all shot at once
int power; //power avaliable to player
//horizontal/vertical offsets
int hOff = 0;
int vOff = 0;
//jump counter
int count = 0;
//sprites shadowOAM
OBJ_ATTR shadowOAM[128];
//time till powerup appears
int powerTime = 0;
int flashCounter = 10; //flashes GO!!
char release = 0;//release badies/bulters counter

int ninjaHit(MOVOBJ*nin, MOVOBJ*play) {
	//if player/bullet moves left
	if (play->cdel<0) {
		//if player/bullet hits ninja
		if (play->col >= nin->col && play->col <= (nin->col + nin->width)) {
			//return 1
			return 1;
		} else {
			//else return 0
			return 0;
		}
		//if player/bullet moves right
	} else {
		//if it hits ninja
		if (((play->col+play->width) >= nin->col) && ((play->col+play->width) <= (nin->col + nin->width))) {
			return 1; //true
		} else {
			return 0; //false
		}
	}
}
char allNinjasDead() {
	//for all ninjas check if they are active
	for (int i = 0; i < NUMBADIES; i++) {
		if (ninja[i].active) {
			//if any are return false
			return 0;
		}
	}
	//else return true
	return 1;
}
void updateBoss(MOVOBJ*bos, MOVOBJ*play) {//update boss stage
	if(!bos->active) { //boss is inactive
		//sprite of dead boss
		shadowOAM[bos->oamNum].attr0 = (ROWMASK & bos->row) | ATTR0_WIDE;
		shadowOAM[bos->oamNum].attr1 = ATTR1_SIZE64 | (COLMASK & bos->col);
		shadowOAM[bos->oamNum].attr2 = (SPRITEOFFSET16((7*4), (3*8))) | ATTR2_PAL4;
		shadowOAM[bos->oamNum+1].attr0 = ATTR0_HIDE;
	} else {
		if(bos->aniCounter % 20 == 0) {
			bos->currFrame = (bos->currFrame + 1) %3;//update animations
		}
		//boss avatar
		shadowOAM[bos->oamNum].attr0 = (ROWMASK & bos->row) | ATTR0_SQUARE;
		shadowOAM[bos->oamNum].attr1 = ATTR1_SIZE32 | (COLMASK & bos->col) | ATTR1_HFLIP;
		shadowOAM[bos->oamNum].attr2 = (SPRITEOFFSET16(5, 28)) | ATTR2_PAL4;
		shadowOAM[bos->oamNum+1].attr0 = (ROWMASK & bos->row) | ATTR0_SQUARE;
		shadowOAM[bos->oamNum+1].attr1 = ATTR1_SIZE32 | (COLMASK & (bos->col+bos->width/2)) | ATTR1_HFLIP;
		shadowOAM[bos->oamNum+1].attr2 = (SPRITEOFFSET16(10+(bos->currFrame*5), 28)) | ATTR2_PAL4; //tail animates
		bos->aniCounter++; //animation
		if (release%5000==0) { //releases attacks of boss
			for(int i=0; i<NUMBADIES;i++) {
				if (!ninja[i].active) { //if not active
					ninja[i].hit = 0;//hit is zero to reactivate
					if (rand()%2==0) {//every other random ninja
						ninja[i].cdel = 1;//come from the left
						ninja[i].col = -60;
					} else {
						ninja[i].col = 245;//come from the right
					}
					break;
				}
			}
		}
		if (release%6000==0) {//drop the bombs
			for(int i=0; i<NUMBULLETS;i++) {
				if (!bossBul[i].active) {//not active
					bossBul[i].active = 1;//activate
					bossBul[i].col = (rand()%230);
				}
			}
		}
		release++; //release of attacks counter
		if (bos->hit > 200) {
			bos->active = 0;//boss dead
		}
	}
	for(int i=0; i<NUMBULLETS;i++) {
		if (bossBul[i].active) {//activate
			bossBul[i].row+=bossBul[i].rdel;//move downscreen
			//sprite
				shadowOAM[bossBul[i].oamNum].attr0 = (ROWMASK & bossBul[i].row) | ATTR0_SQUARE;
				shadowOAM[bossBul[i].oamNum].attr1 = ATTR1_SIZE16 | (COLMASK & bossBul[i].col);
				shadowOAM[bossBul[i].oamNum].attr2 = (SPRITEOFFSET16(19,22)) | ATTR2_PAL4;
			if (((bossBul[i].col+4)>play->col) && ((bossBul[i].col+4)<(play->col+(play->width/2)))) {//col range of player
				if (((bossBul[i].row+4)>play->row) && ((bossBul[i].row+4)<(play->row+play->height))) {//row range of player
					shadowOAM[bossBul[i].oamNum].attr0 = ATTR0_HIDE;//hides
					bossBul[i].active = 0;//deactivate
					bossBul[i].row=-10*i;//put at top of screen
					if (!goingUp) {//not jumping
						hitPlayer(&bossBul[i], play);//hitplayer animation
						play->pause = UNPAUSE;
						play->pause++;
					} else {
						//else continue jump but hit
						play->aniState = FIGHT;
						play->currFrame = 2;
					}
				} 
			}
		}
		if (bossBul[i].row>=130) {//hits floor
			bossBul[i].active = 0;//deactivate
			bossBul[i].row=-10*i;//put at top
			shadowOAM[bossBul[i].oamNum].attr0 = ATTR0_HIDE;//hide
		}
	}
}
void move(int direction, MOVOBJ*play) {
	play->cdel = direction; //set players col delta to direction given
	//if hoff is 0, or player is past half point of screen and moving left
	if (((hOff <= 0 || (play->col + (play->width/2)) > 120) || stage==2) && direction < 0) {
		//if col is greater then 0
		if (play->col > 0) {
			//move player on screen
			play->col+= play->cdel;
		}
	//else if hoff is greater then 512, or player is past half point of screen and moving right
	} else if (((hOff >= 512 || (play->col + (play->width/2)) < 120) || stage==2) && direction > 0) {
		//if player is before end of screen, or all ninja's are dead and player is before end of map
		if ((play->col < (240-play->width)) || ((allNinjasDead() && !boss.active) && (play->col <= 512))) {
			//move player on screen
			play->col += play->cdel;
		}
	} else {
		//else, move screen in direction
		hOff+=play->cdel;
		//if powerup is active
		if (powerUp.active) {
			//adjusts its col
			powerUp.col-=play->cdel;
		}
		//for all the bullets
		for (int i = 0; i < NUMBULLETS; i++) {
			//if the bullet is active
			if (bul[i].active) {
				//adjust its col
				bul[i].col-=play->cdel;
			}
		}
		//for all ninjas
		for (int i = 0; i < NUMBADIES; i++) {
			//adjust its col
			ninja[i].col-=play->cdel;
		}
	}
}
void updatePlayer(MOVOBJ*play){
	//if the player's pause type is greater then 0 (right)
	if ((play->pause>UNPAUSE) && (play->pause < PAUSESTAND)){
		play->aniState = FIGHT;
		play->cdel = 1;
		goingUp = 0;
		play->currFrame = 2;
		if (play->col>0) {
			play->col--;
		} else {
			play->col=0;
		}
		//increment pause
		play->pause++;
		if (play->pause%20==0) {
			//after a while set to unpaused
			play->pause=UNPAUSE;
		}
		//if the player's pause type is less then 0 (left)
	} else if (play->pause<UNPAUSE) {
		play->aniState = FIGHT;
		play->cdel = -1;
		goingUp = 0;
		play->currFrame = 2;
		if (play->col<210) {
			play->col++;
		} else {
			play->col=210;
		}
		play->pause--;
		if (play->pause%20==0) {
			play->pause=UNPAUSE;
		}
	} else if (play->pause>PAUSESTAND) {//punching
		play->pause++;
		if (play->pause%10==0) {
			//after a while set to unpaused
			play->pause=UNPAUSE;
		}	
	} else {
	//Jump
		if (BUTTON_HELD(BUTTON_L)) {
			//if not already mid jump
			if (!goingUp) {
				//set it to true (aka you are jumping)
				goingUp = 1;
				//set acceleration
				play->racc = -12;
				//init frame and state for sprite
				play->aniState = INPLACE;
				play->currFrame = 1;
				//start count
				count = 0;
			}
		}
		//if not jumoing
		if (!goingUp) {
			//if not punching
	        if((play->pause<PAUSESTAND)) {
	        	//set up sprite
	        	play->aniState = INPLACE;
	        	if(play->aniCounter % 20 == 0) {
					play->currFrame = (play->currFrame + 1) %4;
				}
	        }
	        //if pressing left and no attack
			if(BUTTON_HELD(BUTTON_LEFT) && (play->pause<PAUSESTAND) && !BUTTON_HELD(BUTTON_B)) {
				//set state to walk
				play->aniState = WALK;
				move(-1, play);
			}
			if(BUTTON_HELD(BUTTON_DOWN) && (play->pause<PAUSESTAND) && !BUTTON_HELD(BUTTON_B)) {
				//set state to walk
				play->aniState = WALK;
				if (play->row + (play->height/2) <= 150) {
					play->row++;
				}
			}
			if(BUTTON_HELD(BUTTON_UP) && (play->pause<PAUSESTAND) && !BUTTON_HELD(BUTTON_B)) {
				//set state to walk
				play->aniState = WALK;
				if (play->row > 110) {
					play->row--;
				}
			}
			//if pressing right and no attack
			if(BUTTON_HELD(BUTTON_RIGHT) && (play->pause<PAUSESTAND) && !BUTTON_HELD(BUTTON_B)) {
				//set state to walk
				play->aniState = WALK;
				move(1, play);
			}
			//Punch attack
			if (play->pause == PAUSESTAND) {
				//set state and frame
	        	if (play->aniState != FIGHT) {
	        		if (cheat) {//guy voice
	        			if (!mute) {
	        				playSoundB(EPUNCH,EPUNCHLEN,EPUNCHFREQ);
	        			}
	        		} else {//girl
	        			if (!mute) {
	        				playSoundB(PUNCH,PUNCHLEN,PUNCHFREQ);
	        			}
	        		}
	        	}
	        	//fight type
				play->aniState = FIGHT;
				play->currFrame = 0;
				if (boss.active) {//if boss is on
					if(ninjaHit(&boss, play)) {//check if hit
						boss.hit+=6;//hit
					}
				}
				for (int i = 0; i < NUMBADIES; i++) {
					if(ninja[i].active) {//active
						if(ninjaHit(&ninja[i], play)) {//if hit
							if (ninja[i].pause >= UNPAUSE) {//if not paused
								ninja[i].hit++;//hit them
								//if punches to right
								if ((play->cdel>0 && ninja[i].cdel < 0)||(play->cdel <0 && ninja[i].cdel > 0)){
									ninja[i].pause = PAUSEHURT;//set pause to hurt
								} else {
									//if punches to left
									ninja[i].pause = PAUSEHURTFLIP;//flip it
								}
								break;
							}
						}
					}
				}
				play->pause++;
			}
			//wand attack
			if (BUTTON_HELD(BUTTON_B) && (play->pause<PAUSESTAND)) {
				//if player has power
				if (power > 0) {
					//set state and frame
					play->aniState = FIGHT;
					play->currFrame = 1;
					//every 10 loops
					if (countShots % 20 == 0) {
						//for whatever bullet is inactive
						for (int i = 0; i < NUMBULLETS; i++) {
							if (!bul[i].active) {
								if (cheat) {
									if (!mute) {//guy
										playSoundB(EPUNCH2,EPUNCH2LEN,EPUNCH2FREQ);
									}
								} else {
									if (!mute) {//girl
										playSoundB(PUNCH2,PUNCH2LEN,PUNCH2FREQ);
									}
								}
								//decrease power
								power--;
								//activate bullet
								bul[i].active = 1;
								//set its row
								bul[i].row = play->row + (bul[i].height/2);
								if (play->cdel < 0) {
									//set direction
									bul[i].cdel = -1;
									//set col
									bul[i].col = play->col;
								} else {
									//set its direction
									bul[i].cdel = 1;
									//set col
									bul[i].col = play->col + (play->width/2);
								}
								break;
							}
						}
					}
					//increment counter
					countShots++;
				}
			}
		}
		//if inplace
		if(play->aniState == INPLACE) {
			//if not jumping
			if(!goingUp) {
				//set frame to just standing there
				play->currFrame = 0;
			}
		} else {
			//if not fighting
			if (play->aniState != FIGHT) {
				//go to next frame
				play->aniCounter++;
			}
		}
		//if jumping
		if(goingUp) {
			//increment count
			count ++;
			//wait for 15 loops
			if (count >= 15) {
				//if count is odd
				if (count & 1) {
					//update jump
					update(play);
				}
				//if pressing left and no attack
				if(BUTTON_HELD(BUTTON_LEFT) && (play->pause<PAUSESTAND) && !BUTTON_HELD(BUTTON_B)) {
					//move left
					move(-1,play);
				}
				//if pressing right and no attack
				if(BUTTON_HELD(BUTTON_RIGHT) && (play->pause<PAUSESTAND) && !BUTTON_HELD(BUTTON_B)) {
					//move right
					move(1,play);
				}
			}
		}
	}
	/*
    * set up sprite
    */
    shadowOAM[play->oamNum].attr0 = (ROWMASK & play->row) | ATTR0_TALL;
	//if facing left
	if (play->cdel < 0) {
		//horizontal flip the sprite
		shadowOAM[play->oamNum].attr1 = ATTR1_SIZE64 | (COLMASK & play->col) | ATTR1_HFLIP;
	} else {
		//dont flip
		shadowOAM[play->oamNum].attr1 = ATTR1_SIZE64 | (COLMASK & play->col);
	}
	shadowOAM[play->oamNum].attr2 = SPRITEOFFSET16(play->currFrame*8, play->aniState*8);//Here is where you designate your sprite that you are pulling from, change these values for different sprite images!
}
void updateBullet(MOVOBJ* sparkle) {
	//if bullet is active
	if (sparkle->active) {
		//draw bullet
		shadowOAM[sparkle->oamNum].attr0 = (ROWMASK & sparkle->row) | ATTR0_SQUARE;
		//if it moves to left
		if (sparkle->cdel ==-1) {
			//flip it
			shadowOAM[sparkle->oamNum].attr1 = ATTR1_SIZE16 | (COLMASK & sparkle->col)|ATTR1_HFLIP;
		} else {
			//else dont flip it
			shadowOAM[sparkle->oamNum].attr1 = ATTR1_SIZE16 | (COLMASK & sparkle->col);
		}
		//select image of the bullet
		shadowOAM[sparkle->oamNum].attr2 = SPRITEOFFSET16(sparkle->currFrame*8, sparkle->aniState*3);
		//update its col every run
		sparkle->col+=sparkle->cdel;
		//if it goes off screen
		//hide it and make it inactive
		if ((sparkle->col >= 220) || (sparkle->col <=0)) {
			sparkle->active = 0;
			shadowOAM[sparkle->oamNum].attr0 = ATTR0_HIDE;
		}
		//for each bad guy
		if (boss.active) {
			if (ninjaHit(&boss, sparkle)) {
				//hide and deactivate bullet
				sparkle->active=0;
				shadowOAM[sparkle->oamNum].attr0 = ATTR0_HIDE;
				//update ninja's hit counter
				boss.hit+=6;
			}
		}
		for (int i = 0; i < NUMBADIES; i++) {
			//if he is active
			if (ninja[i].active) {
				//if he is not already hit
				if (ninja[i].pause >= 0) {
					//if bullet hits him
					if (ninjaHit(&ninja[i], sparkle)) {
						//hide and deactivate bullet
						sparkle->active=0;
						shadowOAM[sparkle->oamNum].attr0 = ATTR0_HIDE;
						//update ninja's hit counter
						ninja[i].hit++;
						//if shot to right
						if ((sparkle->cdel>0 && ninja[i].cdel < 0)||(sparkle->cdel <0 && ninja[i].cdel > 0)){
							//pause the ninja's movement
							ninja[i].pause = PAUSEHURT;
						} else {
							//if punches to left, pause the ninja's movement
							ninja[i].pause = PAUSEHURTFLIP;
						}
						//break loop
						break;
					}
				}
			}
		}
	}
}
void updateStats(MOVOBJ*play) {
	//For every two hits the player receives
	//hide a life sprite
	for (int i = 0; i < 10; i ++) {
		shadowOAM[32 + i].attr0 = (ROWMASK & 12) | ATTR0_SQUARE;
		shadowOAM[32 + i].attr2 = (SPRITEOFFSET16(9*2, 12));
		if (i%2==1) {//flip it
			shadowOAM[32 + i].attr1 = ATTR1_HFLIP | ATTR1_SIZE8 | (COLMASK & (31 + (4*(i-1))));
		} else {
			shadowOAM[32 + i].attr1 = ATTR1_SIZE8 | (COLMASK & (32 + (4*i)));
		}
	}
	for (int i = play->hit; i > 0; i --) {//if hit hide
		shadowOAM[42 - i].attr0 = ATTR0_HIDE;
	}
	//draws in one when gaining power
	for (int i = 0; i < power; i++) {
		if (!bul[(i%5)].active) {
			shadowOAM[21 + i].attr0 = (ROWMASK & 20) | ATTR0_SQUARE;
			shadowOAM[21 + i].attr1 = ATTR1_SIZE8 | (COLMASK & (32 + (4*i)));
			shadowOAM[21 + i].attr2 = (SPRITEOFFSET16(9*2, 13));
		}
	}
	//hides when shot
	for (int i = 10; i >= power; i--) {
			shadowOAM[21 + i].attr0 = ATTR0_HIDE;
	}
	if (stage == 2) {//in stage 2
		for (int i = 1; i < 11; i++) {
			if (boss.hit >= (i*10)) {
				if (boss.hit >= ((i*10) + 100)) {
					shadowOAM[116 + i].attr0 = ATTR0_HIDE;//hide bar
				} else {
					shadowOAM[116 + i].attr2 = (SPRITEOFFSET16(10, 23)) | ATTR2_PAL4;//set to 2nd bar
				}
			}
		}
	}

	//makes go flash when enemies are dead
	if ((!boss.active) && allNinjasDead()) {
		flashCounter++;
		if (flashCounter%100==0) {//off
			shadowOAM[85].attr0 = ATTR0_HIDE;
			flashCounter = 0;//start flash over
		} else if (flashCounter%50==0) {//on
			shadowOAM[85].attr0 = (ROWMASK & 60) | ATTR0_SQUARE;
			shadowOAM[85].attr1 = ATTR1_SIZE32 | (COLMASK & 190);
			shadowOAM[85].attr2 = (SPRITEOFFSET16(21, 21)) | ATTR2_PAL4;
		}
	} else {
		if (flashCounter%100==0) {//off
			shadowOAM[85].attr0 = ATTR0_HIDE;
			flashCounter = 0;//start flash over
		} else {//count some more so it can turn off
			flashCounter++;
		}
	}
}
void updatePowerUps(MOVOBJ* powerup) {
	if (powerup->active) { //if active
		powerup->col+=powerup->cdel; //alter col
		if ((powerup->col < 250) && (powerup->col > -10)) { //if in screen
			//show/set atts
			shadowOAM[powerup->oamNum].attr0 = (ROWMASK & powerup->row) | ATTR0_SQUARE;
			shadowOAM[powerup->oamNum].attr1 = ATTR1_SIZE16 | (COLMASK & powerup->col);
			shadowOAM[powerup->oamNum].attr2 = (SPRITEOFFSET16(powerup->currFrame, 3*powerup->aniState)) | ATTR2_PAL3;
		} else {
			//else hide
			shadowOAM[powerUp.oamNum].attr0 = ATTR0_HIDE;
			if (powerup->col<-10) {
				powerup->active=0;
			}
		}
	} else {
		//time elapsed
		powerTime++;
		//if 500 cycles pass
		if (powerTime%500 == 0) {
			//activate it
			powerUp.col = 240;
			powerup->active = 1;
		}
		//else keep it hidden
		shadowOAM[powerUp.oamNum].attr0 = ATTR0_HIDE;
	}
}
char obtainedPowerUp(MOVOBJ*play) {
	if (powerUp.active) {//if its active
		if ((play->col <= (powerUp.col+powerUp.width-8)) && ((play->col +play->width) >= (powerUp.col+powerUp.width-8))) {//if touched
			if (play->row <= (powerUp.row +powerUp.height)) {//if player touched it
				return 1;//true
			}
		} else if ((play->col <= powerUp.col) && ((play->col +play->width-8) >= (powerUp.col))) {//if touched
			if (play->row <= (powerUp.row +powerUp.height)) {//if player touched it
				return 1;//true
			}
		}
	}
	return 0;//false
}
void update(MOVOBJ*play) {
	//set sprite's frame
	play->currFrame=2;
	//setup acceleration
	play->racc= play->racc+play->rdel;
	//change row
    play->row += play->racc;
    //stop jump when hits ground
    if(play->row >= 110) {
        goingUp = 0;
    }
    //If they obtained the powerUp
    if (obtainedPowerUp(play)) {
    	//add 2 to power, unless it passes max power
    	if ((power+2)<=10) {
    		power=power+2;
    	} else {
    		power=10;
    	}
    	//deactivate powerup
    	powerUp.active = 0;
    	powerTime = 0;
    }
}
//turn enemy
void enemyTurnAround(MOVOBJ * nin) {
	nin->cdel = -nin->cdel;
}
//hit player
void hitPlayer(MOVOBJ * nin, MOVOBJ*play) {
	//set up animation
	nin->aniState = 12;
	nin->currFrame = 0;
	//increase hit counter
	play->hit++;
	if (cheat) {
		if (!mute) {//male
			playSoundB(EHURT,EHURTLEN,EHURTFREQ);
		}
	} else {
		if (!mute) {//female
			playSoundB(HURT,HURTLEN,HURTFREQ);
		}
	}
	//pause ninja's movement
	nin->pause=PAUSEPUNCH;
	if ((play->col <= 0) || (play->col >= 240 - play->width)) {
		//if player is cornered turn enemy around
		enemyTurnAround(nin);
	}
}
//update ninjas
void updateBadies(MOVOBJ * nin, MOVOBJ* play){
	if (cheat){//cheat is on
		//ninja near tuxedo mask
		if ( (abs( (play->col + (play->width/2)) - nin->col ) <= 10) ||  (abs( (play->col - (nin->col + (nin->width/2))))) <= 10) {
			nin->hit += 20;//instant death
		}
	} 
	if(abs(play->col - nin->col) <= 300) {
		//if close to screen, activate ninja
		nin->active = 1;
	}
	//if ninja is hit 20 or more times, deactivate him and set sprite to dead
	if (nin->hit >= 20) {
		nin->active = 0;
		nin->aniState = 12;
		nin->currFrame = 3;
	}
	//if it is active
	if (nin->active) {
		if (nin->col == 0 || (nin->col < play->col - 60)) {
		//if hit left wall or a distance to left of player
			nin->cdel = 1;//move right
		} else if (nin->col == 210 || (nin->col > play->col + 70)) {
		//if hit right wall or a distance to right of player
			nin->cdel = -1;//move left
		}
		if(!goingUp) {//player is not jumping
			if (nin->cdel > 0) {//move right
				if (abs(nin->col - play->col + 32) < abs(nin->row - play->row)) {
					if (play->row > nin->row) {//if ninja is lower then player
						nin->rdel = 1;//move up
					} else if (play->row < nin->row) {//if ninja is higher then player
						nin->rdel = -1;//move down
					}
				} else {
					nin->rdel=0;//don't move up/down
				}
			} else {//move left
				if (abs(nin->col - play->col - 32) <= abs(nin->row - play->row)) {
					if (play->row > nin->row) {//if ninja is lower then player
						nin->rdel = 1;//move up
					} else if (play->row < nin->row) {//if ninja is higher then player
						nin->rdel = -1;//move down
					}
				}
				else {
					nin->rdel=0;//don't move up/down
				}
			}
		}
		if (nin->cdel == -1) {//going left
			//if ninja gets close enough
			if (((nin->col >= play->col + 6) && (nin->col <= play->col +8)) && (abs(play->row - nin->row)<=1)) {
				if (!play->pause){//if player hasn't been hit
					hitPlayer(nin, play); //hit 'em
					play->pause++; //pause player
				}
			}
			if (nin->pause < UNPAUSE) {//if ninja is hit
				if (nin->pause == PAUSEHURTFLIP){
					nin->cdel = -nin->cdel;//flip direction
				}
				//move ninja in direction of impact
				nin->col -= nin->cdel;
				//update pause
				nin->pause--;
				//set sprite
				nin->aniState = 21;
				nin->currFrame = 0;
				//unpause
				if (nin->pause%20 == 0) {
					nin->pause = UNPAUSE; 
				}
			} else if ((nin->pause > UNPAUSE) && (nin->pause < PAUSESTAND)) {//greater then unpaused but not standing unpaused
				if (nin->pause%35==0) {//unpause after so long 
					nin->pause = UNPAUSE;
				} else {
					nin->aniState = 12;
					nin->currFrame = 0;
					nin->pause++;
				}
			} else if (nin->pause >= PAUSESTAND) {//standing
				if (nin->pause%60==0) {
					nin->pause = UNPAUSE;//unpause
					nin->col += nin->cdel;//move
				} else {//animation till stand
					nin->aniState = 4;
					nin->currFrame = 3;
					nin->pause++;
				}
			} else {
				nin->aniState = 4;//animate unpaused
				if(nin->aniCounter % 20 == 0) {
					nin->currFrame = (nin->currFrame + 1) %3;
				}
				nin->aniCounter++;
				nin->col += nin->cdel;
				if ((collisionMapBitmap[OFFSET(nin->row + vOff + nin->height + nin->rdel, nin->col + hOff, 512)] == 0x7FFF)) {//stock in walk area
					if (!BUTTON_HELD(BUTTON_UP) && !BUTTON_HELD(BUTTON_DOWN)) {
						nin->row += nin->rdel;//get closer to player
					}
				}
				if (abs((nin->col) - (play->col+(play->width/2)) == 6)) {//pause once close to player for hit
					nin->pause = PAUSESTAND;//stand
				}
			}
		} else {//going right
			//if ninja gets close enough
			if ((((nin->col+nin->width) >= play->col + 6) && ((nin->col+nin->width) <= play->col +8)) && (abs(play->row - nin->row)<=1)) {
				if (!play->pause){
					hitPlayer(nin, play);
					play->pause--;
				}
			}
			//EVERYTHING HERE IS FLIPPED FOR GOING LEFT (ABOVE) FOR GOING RIGHT
			if (nin->pause < UNPAUSE) {
				if (nin->pause == PAUSEHURTFLIP) {
					nin->cdel = -nin->cdel;
				}
				nin->col -= nin->cdel;
				nin->pause--;
				nin->aniState = 21;
				nin->currFrame = 0;
				if (nin->pause%20 == 0) {
					nin->pause =UNPAUSE; 
				}
			}  else if ((nin->pause > UNPAUSE) && (nin->pause < PAUSESTAND)) {
				if (nin->pause%35==0) {
					nin->pause = UNPAUSE;
				} else {
					nin->aniState = 12;
					nin->currFrame = 0;
					nin->pause++;
				}
			} else if (nin->pause >= PAUSESTAND) {
				if (nin->pause%60==0) {
					nin->pause = UNPAUSE;
					nin->col += nin->cdel;
				} else {
					nin->aniState = 4;
					nin->currFrame = 3;
					nin->pause++;
				}
			} else {
				nin->aniState = 4;
				if(nin->aniCounter % 20 == 0) {
					nin->currFrame = (nin->currFrame + 1) %3;
				}
				nin->aniCounter++;
				nin->col += nin->cdel;
				if ((collisionMapBitmap[OFFSET(nin->row + vOff + nin->height + nin->rdel, nin->col + hOff, 512)] == 0x7FFF)) {
					if (!BUTTON_HELD(BUTTON_UP) && !BUTTON_HELD(BUTTON_DOWN)) {
						nin->row += nin->rdel;
					}
				}
				if (abs((nin->col + nin->width/2) - play->col) == 6) {
					nin->pause = PAUSESTAND;
				}
			}
		}//LOOK AT ABOVE CODE
		//set up sprites
		if (nin->col < -64 || nin->col > 240) {//off screen
			shadowOAM[nin->oamNum].attr0 = ATTR0_HIDE;//hide
		} else {
			shadowOAM[nin->oamNum].attr0 = (ROWMASK & nin->row) | ATTR0_TALL;
		}
	} else {
		if (nin->col < -64 || nin->col > 240) { //off screen
			shadowOAM[nin->oamNum].attr0 = ATTR0_HIDE; //hide
		} else {
			shadowOAM[nin->oamNum].attr0 = (ROWMASK & nin->row) | ATTR0_SQUARE;
		}
	}
	if (nin->cdel == 1) {
			shadowOAM[nin->oamNum].attr1 = ATTR1_SIZE64 | (COLMASK & nin->col) | ATTR1_HFLIP;//flip
	} else {
		shadowOAM[nin->oamNum].attr1 = ATTR1_SIZE64 | (COLMASK & nin->col);
	}
	shadowOAM[nin->oamNum].attr2 = (SPRITEOFFSET16(nin->currFrame*8, nin->aniState)) | ATTR2_PAL2;//palette two
}
//hide sprites on screen
void hideSprites() {
    for (int i = 0; i < 128; i++) {
    	shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}
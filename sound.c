#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "sound.h"
//set up sounds
void setupSounds() {
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}
//play sound A
void playSoundA( const unsigned char* sound, int length, int frequency) {
        dma[1].cnt = 0;
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
	//set up reg
        REG_TM0CNT = 0;
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;
	
    // Assign all the appropriate struct values
        soundA.data = sound;
        soundA.length = length;
    	soundA.frequency = frequency;
    	soundA.isPlaying = 1;
    	soundA.loops = 1;
    	soundA.duration = (VBLANK_FREQ*length)/frequency;
    	soundA.vbCount = 0;

         
}

//Play sound B (same as A)
void playSoundB( const unsigned char* sound, int length, int frequency) {

        dma[2].cnt = 0;
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;
	
        soundB.data = sound;
        soundB.length = length;
    	soundB.frequency = frequency;
    	soundB.isPlaying = 1;
    	soundB.loops = 0;
    	soundB.duration = (VBLANK_FREQ*length)/frequency;
    	soundB.vbCount = 0;
}

void pauseSound()
{
	//stop timers
	REG_TM0CNT = 0;
	REG_TM1CNT = 0;
	soundA.isPlaying = 0;
	soundB.isPlaying = 0;

}

void unpauseSound() {
	//start timers
	REG_TM0CNT = TIMER_ON;
	REG_TM1CNT = TIMER_ON;
	soundA.isPlaying = 1;
	soundB.isPlaying = 1;
}

void stopSound() {
    //stop dma's and timers
    dma[1].cnt = 0;
    REG_TM0CNT = 0;
    REG_TM1CNT = 0;
    dma[2].cnt = 0;
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;

}

//from lab
void setupInterrupts() {
	REG_IME = 0;
	REG_INTERRUPT = (unsigned int) interruptHandler;
	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}
//from lab
void interruptHandler() {
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
		//TODO: FINISH THIS FUNCTION
		// This should be where you determine if a sound if finished or not
		if (soundA.isPlaying) {
			if (soundA.vbCount >= soundA.duration) {
				if (soundA.loops) {
					playSoundA(soundA.data, soundA.length, soundA.frequency);
				} else {
					dma[1].cnt = 0;
					REG_TM0CNT = 0;
					soundA.isPlaying = 0;
				}
			}
			soundA.vbCount++;
		}
		if (soundB.isPlaying) {
			if (soundB.vbCount >= soundB.duration) {
				if (soundB.loops) {
					playSoundB(soundB.data, soundB.length, soundB.frequency);
				} else {
					dma[2].cnt = 0;
					REG_TM1CNT = 0;
					soundB.isPlaying = 0;
				}
			}
			soundB.vbCount++;
		}
		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}

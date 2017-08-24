void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency);
void playSoundB( const unsigned char* sound, int length, int frequency);
void muteSound();
void unmuteSound();
void stopSound();
void unpauseSound();
void pauseSound();

void setupInterrupts();
void interruptHandler();

typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;

SOUND soundA;
SOUND soundB;
unsigned short scanLineCounter;
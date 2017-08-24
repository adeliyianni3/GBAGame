# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 26 "main.c"
# 1 "BG512x512.h" 1
# 22 "BG512x512.h"
extern const unsigned short BG512x512Tiles[2000];


extern const unsigned short BG512x512Map[2048];


extern const unsigned short BG512x512Pal[256];
# 27 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[7056];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 28 "main.c" 2
# 1 "splash.h" 1
# 22 "splash.h"
extern const unsigned short splashTiles[7216];


extern const unsigned short splashMap[1024];


extern const unsigned short splashPal[256];
# 29 "main.c" 2
# 1 "instruc.h" 1
# 22 "instruc.h"
extern const unsigned short instrucTiles[7632];


extern const unsigned short instrucMap[1024];


extern const unsigned short instrucPal[256];
# 30 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[9552];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 31 "main.c" 2
# 1 "bg2.h" 1
# 22 "bg2.h"
extern const unsigned short bg2Tiles[5072];


extern const unsigned short bg2Map[2048];


extern const unsigned short bg2Pal[256];
# 32 "main.c" 2
# 1 "bg3.h" 1
# 22 "bg3.h"
extern const unsigned short bg3Tiles[1520];


extern const unsigned short bg3Map[2048];


extern const unsigned short bg3Pal[256];
# 33 "main.c" 2
# 1 "bg4.h" 1
# 22 "bg4.h"
extern const unsigned short bg4Tiles[1136];


extern const unsigned short bg4Map[2048];


extern const unsigned short bg4Pal[256];
# 34 "main.c" 2
# 1 "bg5.h" 1
# 22 "bg5.h"
extern const unsigned short bg5Tiles[10992];


extern const unsigned short bg5Map[2048];


extern const unsigned short bg5Pal[256];
# 35 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[6320];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 36 "main.c" 2
# 1 "charSelect.h" 1
# 22 "charSelect.h"
extern const unsigned short charSelectTiles[7056];


extern const unsigned short charSelectMap[1024];


extern const unsigned short charSelectPal[256];
# 37 "main.c" 2
# 1 "gameLogic.h" 1
# 1 "myLib.h" 1



typedef unsigned short u16;
# 40 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void initialize();
void changeBG();

void waitForVblank();
void flipPage();
# 91 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 101 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 140 "myLib.h"
enum {IDLE, CHASE, FLEE};
# 238 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 298 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;
typedef struct
{
    int row;
    int col;
    int rdel;
    int cdel;
    char active;
    int hit;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int oamNum;
    int currFrame;
    int pause;
    int racc;
} MOVOBJ;
typedef struct {
    volatile const void* playerPal;
    int playerPalLen;
    volatile const void* playerTiles;
    int playerTilesLen;
} SPRITESHEET;
# 2 "gameLogic.h" 2
# 17 "gameLogic.h"
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
# 38 "main.c" 2
# 1 "sailormoonSprites.h" 1
# 21 "sailormoonSprites.h"
extern const unsigned short sailormoonSpritesTiles[16384];


extern const unsigned short sailormoonSpritesPal[256];
# 39 "main.c" 2
# 1 "mercurySprites.h" 1
# 21 "mercurySprites.h"
extern const unsigned short mercurySpritesTiles[16384];


extern const unsigned short mercurySpritesPal[256];
# 40 "main.c" 2
# 1 "venusSprites.h" 1
# 21 "venusSprites.h"
extern const unsigned short venusSpritesTiles[16384];


extern const unsigned short venusSpritesPal[256];
# 41 "main.c" 2
# 1 "TuxedoSprites.h" 1
# 21 "TuxedoSprites.h"
extern const unsigned short TuxedoSpritesTiles[16384];


extern const unsigned short TuxedoSpritesPal[256];
# 42 "main.c" 2
# 1 "marsSprites.h" 1
# 21 "marsSprites.h"
extern const unsigned short marsSpritesTiles[16384];


extern const unsigned short marsSpritesPal[256];
# 43 "main.c" 2
# 1 "neptuneSprites.h" 1
# 21 "neptuneSprites.h"
extern const unsigned short neptuneSpritesTiles[16384];


extern const unsigned short neptuneSpritesPal[256];
# 44 "main.c" 2
# 1 "uranusSprites.h" 1
# 21 "uranusSprites.h"
extern const unsigned short uranusSpritesTiles[16384];


extern const unsigned short uranusSpritesPal[256];
# 45 "main.c" 2
# 1 "plutoSprites.h" 1
# 21 "plutoSprites.h"
extern const unsigned short plutoSpritesTiles[16384];


extern const unsigned short plutoSpritesPal[256];
# 46 "main.c" 2
# 1 "saturnSprites.h" 1
# 21 "saturnSprites.h"
extern const unsigned short saturnSpritesTiles[16384];


extern const unsigned short saturnSpritesPal[256];
# 47 "main.c" 2
# 1 "usaSprites.h" 1
# 21 "usaSprites.h"
extern const unsigned short usaSpritesTiles[16384];


extern const unsigned short usaSpritesPal[256];
# 48 "main.c" 2
# 1 "JupiterSprites.h" 1
# 21 "JupiterSprites.h"
extern const unsigned short JupiterSpritesTiles[16384];


extern const unsigned short JupiterSpritesPal[256];
# 49 "main.c" 2
# 1 "sound.h" 1
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
# 50 "main.c" 2

# 1 "cutScene2.h" 1
# 22 "cutScene2.h"
extern const unsigned short cutScene2Tiles[3968];


extern const unsigned short cutScene2Map[1024];


extern const unsigned short cutScene2Pal[256];
# 52 "main.c" 2
# 1 "cutScene1.h" 1
# 22 "cutScene1.h"
extern const unsigned short cutScene1Tiles[5072];


extern const unsigned short cutScene1Map[1024];


extern const unsigned short cutScene1Pal[256];
# 53 "main.c" 2
# 1 "SailorMoon.h" 1
# 20 "SailorMoon.h"
extern const unsigned char SailorMoon[225309];
# 54 "main.c" 2
# 1 "Victory.h" 1
# 20 "Victory.h"
extern const unsigned char Victory[50095];
# 55 "main.c" 2
# 1 "Stage_12.h" 1
# 20 "Stage_12.h"
extern const unsigned char Stage_12[1412096];
# 56 "main.c" 2
# 1 "Stage_3.h" 1
# 20 "Stage_3.h"
extern const unsigned char Stage_3[1294336];
# 57 "main.c" 2
# 1 "Game_Over.h" 1
# 20 "Game_Over.h"
extern const unsigned char Game_Over[138350];
# 58 "main.c" 2
# 1 "Tuxedo.h" 1
# 20 "Tuxedo.h"
extern const unsigned char Tuxedo[172995];
# 59 "main.c" 2
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 1 3
# 10 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/ieeefp.h" 1 3
# 11 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 1 3
# 15 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/newlib.h" 1 3
# 16 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 2 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/config.h" 1 3



# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/ieeefp.h" 1 3
# 5 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/config.h" 2 3
# 17 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 2 3
# 12 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3



# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 211 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 323 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 16 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3

# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 1 3
# 13 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 1 3
# 14 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 2 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 1 3
# 12 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_types.h" 1 3






# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 1 3
# 26 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t ;
typedef unsigned char __uint8_t ;
# 36 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed short __int16_t;
typedef unsigned short __uint16_t;
# 46 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
# 58 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
# 76 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
# 99 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed long long __int64_t;
typedef unsigned long long __uint64_t;
# 8 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_types.h" 2 3
# 13 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/lock.h" 1 3





typedef int _LOCK_T;
typedef int _LOCK_RECURSIVE_T;
# 14 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3


typedef long _off_t;







typedef int __dev_t;




typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



__extension__ typedef long long _off64_t;







typedef long _fpos_t;
# 56 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 3
typedef int _ssize_t;






# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 352 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 64 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;
# 15 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 37 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _reent;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 89 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 105 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 169 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                     ;
  int (* _write) (struct _reent *, void *, const char *, int)
                            ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  int _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 273 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 305 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 579 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (* __cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;


  struct _atexit *_atexit;
  struct _atexit _atexit0;


  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 817 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 18 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/stdlib.h" 1 3
# 19 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3
# 27 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;
# 58 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
extern int __mb_cur_max;



void abort (void) __attribute__ ((noreturn));
int abs (int);
int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, int (* _compar) (const void *, const void *))



                                                         ;
void * calloc (size_t __nmemb, size_t __size) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((noreturn));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);
long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *, const char *, size_t);
int _mbtowc_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *, const char *, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
size_t wcstombs (char *, const wchar_t *, size_t);
size_t _wcstombs_r (struct _reent *, char *, const wchar_t *, size_t, _mbstate_t *);
# 111 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
void qsort (void * __base, size_t __nmemb, size_t __size, int(*_compar)(const void *, const void *));
int rand (void);
void * realloc (void * __r, size_t __size) ;



void srand (unsigned __seed);
double strtod (const char *__n, char **__end_PTR);
double _strtod_r (struct _reent *,const char *__n, char **__end_PTR);
float strtof (const char *__n, char **__end_PTR);






long strtol (const char *__n, char **__end_PTR, int __base);
long _strtol_r (struct _reent *,const char *__n, char **__end_PTR, int __base);
unsigned long strtoul (const char *__n, char **__end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *__n, char **__end_PTR, int __base);

int system (const char *__string);
# 198 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);



extern long double strtold (const char *, char **);
extern long double wcstold (const wchar_t *, wchar_t **);



# 60 "main.c" 2
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 1 3
# 34 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 35 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 2 3


# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stdarg.h" 1 3 4
# 40 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 38 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 2 3
# 46 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 1 3
# 69 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 149 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 70 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 2 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/types.h" 1 3
# 19 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/types.h" 3
typedef long int __off_t;
typedef int __pid_t;

__extension__ typedef long long int __loff_t;
# 71 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 2 3
# 92 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 3
typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;



typedef unsigned short ushort;
typedef unsigned int uint;



typedef unsigned long clock_t;




typedef long time_t;




struct timespec {
  time_t tv_sec;
  long tv_nsec;
};

struct itimerspec {
  struct timespec it_interval;
  struct timespec it_value;
};


typedef long daddr_t;
typedef char * caddr_t;






typedef unsigned int ino_t;
# 162 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 3
typedef _off_t off_t;
typedef __dev_t dev_t;
typedef __uid_t uid_t;
typedef __gid_t gid_t;





typedef int pid_t;



typedef long key_t;

typedef _ssize_t ssize_t;
# 191 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 3
typedef unsigned int mode_t __attribute__ ((__mode__ (__SI__)));




typedef unsigned short nlink_t;
# 218 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 3
typedef long fd_mask;







typedef struct _types_fd_set {
 fd_mask fds_bits[(((64)+(((sizeof (fd_mask) * 8))-1))/((sizeof (fd_mask) * 8)))];
} _types_fd_set;
# 249 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 3
typedef unsigned long clockid_t;




typedef unsigned long timer_t;



typedef unsigned long useconds_t;
typedef long suseconds_t;

typedef __uint32_t fsblkcnt_t;
typedef __uint32_t fsfilcnt_t;

# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/features.h" 1 3
# 265 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 2 3
# 47 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 2 3



typedef __FILE FILE;
# 59 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
typedef _fpos_t fpos_t;





# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/stdio.h" 1 3
# 66 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 2 3
# 175 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
FILE * tmpfile (void);
char * tmpnam (char *);
int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *, const char *, FILE *);
void setbuf (FILE *, char *);
int setvbuf (FILE *, char *, int, size_t);
int fprintf (FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int fscanf (FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int printf (const char *, ...) __attribute__ ((__format__ (__printf__, 1, 2)))
                                                            ;
int scanf (const char *, ...) __attribute__ ((__format__ (__scanf__, 1, 2)))
                                                           ;
int sscanf (const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int vfprintf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vprintf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 1, 0)))
                                                            ;
int vsprintf (char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int fgetc (FILE *);
char * fgets (char *, int, FILE *);
int fputc (int, FILE *);
int fputs (const char *, FILE *);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void *, size_t _size, size_t _n, FILE *);
size_t fwrite (const void * , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *, fpos_t *);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *_name, const char *_type);
int sprintf (char *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int remove (const char *);
int rename (const char *, const char *);
# 246 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
int asiprintf (char **, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
char * asniprintf (char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
char * asnprintf (char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int asprintf (char **, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;

int diprintf (int, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;

int fcloseall (void);
int fiprintf (FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int fiscanf (FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int iprintf (const char *, ...) __attribute__ ((__format__ (__printf__, 1, 2)))
                                                            ;
int iscanf (const char *, ...) __attribute__ ((__format__ (__scanf__, 1, 2)))
                                                           ;
int siprintf (char *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int siscanf (const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int snprintf (char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int sniprintf (char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
char * tempnam (const char *, const char *);
int vasiprintf (char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
char * vasniprintf (char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
char * vasnprintf (char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vasprintf (char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vdiprintf (int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vfiprintf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vfiscanf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int vfscanf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int viprintf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 1, 0)))
                                                            ;
int viscanf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 1, 0)))
                                                           ;
int vscanf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 1, 0)))
                                                           ;
int vsiprintf (char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vsiscanf (const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int vsniprintf (char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vsnprintf (char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vsscanf (const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
# 361 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
char * _asnprintf_r (struct _reent *, char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _asprintf_r (struct _reent *, char **, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _diprintf_r (struct _reent *, int, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _dprintf_r (struct _reent *, int, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *, int, FILE *);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fiscanf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
FILE * _fmemopen_r (struct _reent *, void *, size_t, const char *);
FILE * _fopen_r (struct _reent *, const char *, const char *);
FILE * _freopen_r (struct _reent *, const char *, const char *, FILE *);
int _fprintf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *, FILE *);
size_t _fread_r (struct _reent *, void *, size_t _size, size_t _n, FILE *);
int _fscanf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void * , size_t _size, size_t _n, FILE *);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int _iscanf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *, const char *_old, const char *_new)
                                          ;
int _scanf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int _siprintf_r (struct _reent *, char *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _siscanf_r (struct _reent *, const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _snprintf_r (struct _reent *, char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _sprintf_r (struct _reent *, char *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _sscanf_r (struct _reent *, const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vdprintf_r (struct _reent *, int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _vfprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int _vprintf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int _vscanf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vsnprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vsprintf_r (struct _reent *, char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vsscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);
# 519 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 687 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3

# 61 "main.c" 2
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/time.h" 1 3
# 18 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/time.h" 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/time.h" 1 3
# 19 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/time.h" 2 3
# 27 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/time.h" 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 28 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/time.h" 2 3





struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;
};

clock_t clock (void);
double difftime (time_t _time2, time_t _time1);
time_t mktime (struct tm *_timeptr);
time_t time (time_t *_timer);

char *asctime (const struct tm *_tblock);
char *ctime (const time_t *_time);
struct tm *gmtime (const time_t *_timer);
struct tm *localtime (const time_t *_timer);

size_t strftime (char *_s, size_t _maxsize, const char *_fmt, const struct tm *_t);

char *asctime_r (const struct tm *, char *);
char *ctime_r (const time_t *, char *);
struct tm *gmtime_r (const time_t *, struct tm *);
struct tm *localtime_r (const time_t *, struct tm *);


# 62 "main.c" 2


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


MOVOBJ player;
MOVOBJ boss;
SPRITESHEET currentSSheet;
MOVOBJ ninja[5];
MOVOBJ * sprites[5 +1];
MOVOBJ powerUp;
MOVOBJ bul[5];
char state;
MOVOBJ bossBul[5];
int gameCounter = -1;
unsigned int buttons;
unsigned int oldButtons;
int character;
int stage;
char cheat;
time_t t;
char mute;
int cut;



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
  buttons = *(volatile unsigned int *)0x04000130;
  switch(state) {

   case 0:
    splash();
    break;

   case 5:
    charSelect();
    DMANow(3, &shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
    waitForVblank();
    break;

   case 1:
    gameCounter++;
    if (gameCounter&1) {
     game();
     DMANow(3, &shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
     waitForVblank();
    }
       if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
     state = 3;
     initPause();
    }
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && player.pause == 0) {
     player.pause = 40;
    }
    if ((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8))))) {
     state = 6;
     cheat = 1;
     DMANow(3, TuxedoSpritesPal, ((unsigned short*)(0x5000200)), 512/2);
        DMANow(3, TuxedoSpritesTiles, &((charblock *)0x6000000)[4], 32768/2);
    }
    break;
   case 6:
    gameCounter++;
    if (gameCounter&1) {
     game();
     DMANow(3, &shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
     waitForVblank();
    }
       if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
     state = 3;
     initPause();
    }
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && player.pause == 0) {
     player.pause = 40;
    }
    if ((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8))))) {
     state = 1;
     cheat = 0;
     DMANow(3, currentSSheet.playerPal, ((unsigned short*)(0x5000200)), currentSSheet.playerPalLen/2);
        DMANow(3, currentSSheet.playerTiles, &((charblock *)0x6000000)[4], currentSSheet.playerTilesLen/2);
    }
    break;

   case 2:
    lose();
    break;

   case 3:
    pause();
    break;

   case 4:
    instruc();
    break;

   case 7:
    cutScene();
    break;
  }
 }
 return 0;
}
int spritesCompRow(const void * a,const void * b) {
 MOVOBJ *orderA = *(MOVOBJ **)a;
   MOVOBJ *orderB = *(MOVOBJ **)b;

   if ((orderB == &player) && (abs((orderB->row + orderB->height) - (orderA->row + orderB->height))<3)) {
    return 1;
   } else if ((orderA == &player) && (abs((orderB->row + orderB->height) - (orderA->row + orderB->height))<3)) {
    return -1;
   } else {
   return ( (orderB->row + orderB->height) - (orderA->row + orderB->height) );
  }
}
void sortSprites() {
 qsort(sprites, sizeof(sprites)/sizeof(sprites[0]), sizeof(sprites[0]), spritesCompRow);
 for (int i = 0; i < 5 +1; i++) {
  (*sprites[i]).oamNum = i;
 }
}
void stageUpdate() {
 if (stage == 0) {

  loadPalette(BG512x512Pal);
  DMANow(3, BG512x512Tiles, &((charblock *)0x6000000)[0], (4000/2));
  DMANow(3, BG512x512Map, &((screenblock *)0x6000000)[27], (4096/2));
  DMANow(3, bg2Tiles, &((charblock *)0x6000000)[2], (10144/2));
  DMANow(3, bg2Map, &((screenblock *)0x6000000)[30], (4096/2));
 } else if (stage == 1) {

  loadPalette(bg3Pal);
  DMANow(3, bg3Tiles, &((charblock *)0x6000000)[0], (3040/2));
  DMANow(3, bg3Map, &((screenblock *)0x6000000)[27], (4096/2));
  DMANow(3, bg4Tiles, &((charblock *)0x6000000)[2], (2272/2));
  DMANow(3, bg4Map, &((screenblock *)0x6000000)[30], (4096/2));
 } else if (stage == 2) {
  if (!mute) {
   playSoundA(Stage_3,1294336,11025);
  }

  loadPalette(bg3Pal);
  DMANow(3, bg3Tiles, &((charblock *)0x6000000)[0], (3040/2));
  DMANow(3, bg3Map, &((screenblock *)0x6000000)[27], (4096/2));
  DMANow(3, bg5Tiles, &((charblock *)0x6000000)[2], (21984/2));
  DMANow(3, bg5Map, &((screenblock *)0x6000000)[30], (4096/2));

  for (int i = 1; i < 11; i++) {
   shadowOAM[116 + i].attr0 = (0xFF & 16) | (0 << 14);
   shadowOAM[116 + i].attr1 = (0 << 14) | (0x1FF & (160 + (4*(i-1))));
   if (boss.hit >= (i*10)) {
    if (boss.hit >= ((i*10) + 100)) {
     shadowOAM[116 + i].attr0 = (2 << 8);
    } else {
     shadowOAM[116 + i].attr2 = ((10)*32+(23)) | (((3)&15)<<12);
    }
   } else {
    shadowOAM[116 + i].attr2 = ((10)*32+(22)) | (((3)&15)<<12);
   }
  }

  shadowOAM[116].attr0 = (0xFF & 0) | (0 << 14);
  shadowOAM[116].attr1 = (2 << 14) | (0x1FF & (200));
  shadowOAM[116].attr2 = ((6)*32+(22)) | (((3)&15)<<12);
 }

 shadowOAM[19].attr0 = (0xFF & 0) | (0 << 14);
 shadowOAM[19].attr1 = (2 << 14) | (0x1FF & 0);
 shadowOAM[19].attr2 = ((0)*32+(25));
}
void game() {
 sortSprites();
 updateStats(&player);
 updatePlayer(&player);
 for (int i = 0; i < 5; i++) {
  updateBadies(&ninja[i], &player);
 }
    if (stage ==2){
  updateBoss(&boss, &player);
 }
 for(int i = 0; i < 5; i++) {
  updateBullet(&bul[i]);
 }
 updatePowerUps(&powerUp);

 if (player.hit >= 10) {
  hOff = 0;
     vOff = 0;
  initLose();
 }
 if ((player.col>=240) && allNinjasDead()) {

  hideSprites();
  stage++;
  if (stage > 2) {
   initWin();
  }
  powerUp.active = 0;
  stageUpdate();
  if (stage==2) {
   boss.active = 1;
   for (int i=0;i<5;i++) {
    ninja[i].col = 400;
   }
  } else {

   for (int i = 0; i < 5; i++) {
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
    *(volatile unsigned short *)0x04000014 = hOff/2;
    *(volatile unsigned short *)0x04000016 = vOff/2;
    *(volatile unsigned short *)0x04000010 = hOff;
    *(volatile unsigned short *)0x04000012 = vOff;
}

void lose(){

    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

     stopSound();
  *(volatile unsigned short *)0x04000010 = 0;
     *(volatile unsigned short *)0x04000012 = 0;
     gameCounter = -1;
  state = 0;
  initialize();
 }
}

void pause(){
 *(volatile unsigned short *)0x04000010 = 0;
    *(volatile unsigned short *)0x04000012 = 0;

    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  initGame();
  stageUpdate();
  if (stage < 2) {
   if (!mute) {
    playSoundA(Stage_12,1412096,11025);
   }
  }
  if (cheat) {
   state = 6;
  } else {
   state = 1;
  }
 }

 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  gameCounter = -1;
  initGame();
  if (!mute) {
   playSoundA(Stage_12,1412096,11025);
  }
  state = 1;
 }
 if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
  if (mute) {
   mute = 0;
   unpauseSound();
  } else {
   mute = 1;
   pauseSound();
  }
 }
}

void initInstruc() {
 *(unsigned short *)0x4000000 = 0 | (1<<8);
 if (!mute) {
  playSoundA(Tuxedo,172995,11025);
 }
 loadPalette(instrucPal);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14;
 DMANow(3, instrucTiles, &((charblock *)0x6000000)[0], (15264/2));
 DMANow(3, instrucMap, &((screenblock *)0x6000000)[27], (2048/2));
}


void instruc() {
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  state = 5;
  *(unsigned short *)0x4000000 = 0 | (1<<8) | (1 << 12);
  loadPalette(charSelectPal);
  DMANow(3, charSelectTiles, &((charblock *)0x6000000)[0], (14112/2));
  DMANow(3, charSelectMap, &((screenblock *)0x6000000)[27], (2048/2));

     shadowOAM[0].attr0 = (0xFF & 50) | (0 << 14);
  shadowOAM[0].attr1 = (2 << 14) | (0x1FF & 60);
  shadowOAM[0].attr2 = ((0)*32+(25));
 }
    if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  state = 0;
  initialize();
 }
}

void initPause() {
 if (!mute) {
  playSoundA(Tuxedo,172995,11025);
 }
 loadPalette(pausePal);
 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14;
 DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], (14112/2));
 DMANow(3, pauseMap, &((screenblock *)0x6000000)[27], (2048/2));
}

void initialize() {

 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14;
 loadPalette(splashPal);
 DMANow(3, splashTiles, &((charblock *)0x6000000)[0], (14432/2));
 DMANow(3, splashMap, &((screenblock *)0x6000000)[27], (2048/2));
 if (!mute) {
  playSoundA(SailorMoon,225309,11025);
 }
 state = 0;
 buttons = *(volatile unsigned int *)0x04000130;
 character = 0;

 currentSSheet.playerPal = sailormoonSpritesPal;
 currentSSheet.playerPalLen = 512;
 currentSSheet.playerTiles = sailormoonSpritesTiles;
 currentSSheet.playerTilesLen = 32768;
 DMANow(3, currentSSheet.playerPal, ((unsigned short*)(0x5000200)), currentSSheet.playerPalLen/2);
 DMANow(3, currentSSheet.playerTiles, &((charblock *)0x6000000)[4], currentSSheet.playerTilesLen/2);
 hideSprites();
}
void initLose() {

 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14;
 loadPalette(losePal);
 DMANow(3, loseTiles, &((charblock *)0x6000000)[0], (19104/2));
 DMANow(3, loseMap, &((screenblock *)0x6000000)[27], (2048/2));
 if (!mute) {
  playSoundA(Game_Over,138350,11025);
 }
 state = 2;
}
void initWin() {

 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14;
 loadPalette(winPal);
 DMANow(3, winTiles, &((charblock *)0x6000000)[0], (12640/2));
 DMANow(3, winMap, &((screenblock *)0x6000000)[27], (2048/2));
 stopSound();
 if (!mute) {
  playSoundB(Victory,50095,11025);
 }
 state = 2;
}



void splash(){
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  if (!mute) {
   playSoundA(Tuxedo,172995,11025);
  }
  state = 5;

  *(unsigned short *)0x4000000 = 0 | (1<<8) | (1 << 12);
  loadPalette(charSelectPal);
  DMANow(3, charSelectTiles, &((charblock *)0x6000000)[0], (14112/2));
  DMANow(3, charSelectMap, &((screenblock *)0x6000000)[27], (2048/2));

     shadowOAM[0].attr0 = (0xFF & 50) | (0 << 14);
  shadowOAM[0].attr1 = (2 << 14) | (0x1FF & 60);
  shadowOAM[0].attr2 = ((0)*32+(25));
 }
    if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  state = 4;
     initInstruc();
    }
}
void loadChar() {
 if (character == 0) {
  currentSSheet.playerPal = sailormoonSpritesPal;
  currentSSheet.playerPalLen = 512;
  currentSSheet.playerTiles = sailormoonSpritesTiles;
  currentSSheet.playerTilesLen = 32768;
 } else if (character == 1) {
  currentSSheet.playerPal = mercurySpritesPal;
  currentSSheet.playerPalLen = 512;
  currentSSheet.playerTiles = mercurySpritesTiles;
  currentSSheet.playerTilesLen = 32768;
 } else if (character == 2) {
  currentSSheet.playerPal = venusSpritesPal;
  currentSSheet.playerPalLen = 512;
  currentSSheet.playerTiles = venusSpritesTiles;
  currentSSheet.playerTilesLen = 32768;
 } else if (character == 3) {
  currentSSheet.playerPal = marsSpritesPal;
  currentSSheet.playerPalLen = 512;
  currentSSheet.playerTiles = marsSpritesTiles;
  currentSSheet.playerTilesLen = 32768;
 } else if (character == 4) {
  currentSSheet.playerPal = JupiterSpritesPal;
  currentSSheet.playerPalLen = 512;
  currentSSheet.playerTiles = JupiterSpritesTiles;
  currentSSheet.playerTilesLen = 32768;
 } else if (character == 5) {
  currentSSheet.playerPal = uranusSpritesPal;
  currentSSheet.playerPalLen = 512;
  currentSSheet.playerTiles = uranusSpritesTiles;
  currentSSheet.playerTilesLen = 32768;
 } else if (character == 6) {
  currentSSheet.playerPal = neptuneSpritesPal;
  currentSSheet.playerPalLen = 512;
  currentSSheet.playerTiles = neptuneSpritesTiles;
  currentSSheet.playerTilesLen = 32768;
 } else if (character == 7) {
  currentSSheet.playerPal = plutoSpritesPal;
  currentSSheet.playerPalLen = 512;
  currentSSheet.playerTiles = plutoSpritesTiles;
  currentSSheet.playerTilesLen = 32768;
 } else if (character == 8) {
  currentSSheet.playerPal = saturnSpritesPal;
  currentSSheet.playerPalLen = 512;
  currentSSheet.playerTiles = saturnSpritesTiles;
  currentSSheet.playerTilesLen = 32768;
 } else {
  currentSSheet.playerPal = usaSpritesPal;
  currentSSheet.playerPalLen = 512;
  currentSSheet.playerTiles = usaSpritesTiles;
  currentSSheet.playerTilesLen = 32768;
 }
 DMANow(3, currentSSheet.playerPal, ((unsigned short*)(0x5000200)), currentSSheet.playerPalLen/2);
    DMANow(3, currentSSheet.playerTiles, &((charblock *)0x6000000)[4], currentSSheet.playerTilesLen/2);
}
void cutScene() {
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  cut++;
  if (cut == 1) {
   loadPalette(BG512x512Pal);
   DMANow(3, BG512x512Tiles, &((charblock *)0x6000000)[0], (4000/2));
   DMANow(3, BG512x512Map, &((screenblock *)0x6000000)[27], (4096/2));
   DMANow(3, cutScene2Tiles, &((charblock *)0x6000000)[2], (7936/2));
   DMANow(3, cutScene2Map, &((screenblock *)0x6000000)[30], (2048/2));
  }
 }
 if ((cut > 1) || ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))))) {
  initGame();
  if (!mute) {
   playSoundA(Stage_12,1412096,11025);
  }
  state = 1;
 }
}

void charSelect(){
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

  *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9);
  *(volatile unsigned short*)0x400000A = 0 << 2 | 27 << 8 | 1<<14;
  *(volatile unsigned short*)0x4000008 = 2 << 2 | 30 << 8 | 0<<14;
  loadPalette(BG512x512Pal);
  DMANow(3, BG512x512Tiles, &((charblock *)0x6000000)[0], (4000/2));
  DMANow(3, BG512x512Map, &((screenblock *)0x6000000)[27], (4096/2));
  DMANow(3, cutScene1Tiles, &((charblock *)0x6000000)[2], (10144/2));
  DMANow(3, cutScene1Map, &((screenblock *)0x6000000)[30], (2048/2));
  cut = 0;
  state = 7;
 }
    if((!(~(oldButtons)&((1<<4))) && (~buttons & ((1<<4))))) {
  character++;
  if (character==10) {
   character = 0;
  }
  loadChar();
    }
    if((!(~(oldButtons)&((1<<5))) && (~buttons & ((1<<5))))) {
  character--;
  if (character==-1) {
   character = 9;
  }
  loadChar();
    }
}

void initGame() {

 *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);

 *(volatile unsigned short*)0x400000A = 0 << 2 | 27 << 8 | 1<<14;
 *(volatile unsigned short*)0x4000008 = 2 << 2 | 30 << 8 | 0<<14;

    if(gameCounter<0) {
     srand((unsigned) time(&t));
     cheat = 0;

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
  player.aniState = 0;
     player.pause = 0;
     player.oamNum = 0;


     boss.width = 64;
     boss.height = 32;
  boss.row = 115;
  boss.hit = 0;
  boss.col = 240 - boss.width;
  boss.aniCounter = 0;
     boss.currFrame = 0;
  boss.aniState = 0;
     boss.pause = 0;
     boss.oamNum = 80;
     boss.active = 0;

     buttons = *(volatile unsigned int *)0x04000130;
  hOff = 0;
  vOff = 0;

  gameCounter = 0;

  goingUp = 0;
  sprites[0] = &player;

  for (int i = 0; i < 5; i++) {
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
      sprites[i+1] = &ninja[i];
  }
  countShots = 0;

     for (int i = 0; i < 5; i++) {
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

     DMANow(3, currentSSheet.playerPal, ((unsigned short*)(0x5000200)), currentSSheet.playerPalLen/2);
     DMANow(3, currentSSheet.playerTiles, &((charblock *)0x6000000)[4], currentSSheet.playerTilesLen/2);
     hideSprites();
 }
 if (stage == 0) {
  loadPalette(BG512x512Pal);
  DMANow(3, BG512x512Tiles, &((charblock *)0x6000000)[0], (4000/2));
  DMANow(3, BG512x512Map, &((screenblock *)0x6000000)[27], (4096/2));
  DMANow(3, bg2Tiles, &((charblock *)0x6000000)[2], (10144/2));
  DMANow(3, bg2Map, &((screenblock *)0x6000000)[30], (4096/2));
 }


    shadowOAM[18].attr0 = (0xFF & 0) | (0 << 14);
 shadowOAM[18].attr1 = (2 << 14) | (0x1FF & 0);
 shadowOAM[18].attr2 = ((0)*32+(25));
}

# 1 "gameLogic.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gameLogic.c"
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/math.h" 1 3




# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 1 3
# 13 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 1 3
# 15 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/newlib.h" 1 3
# 16 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 2 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/config.h" 1 3



# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/ieeefp.h" 1 3
# 5 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/config.h" 2 3
# 17 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 2 3
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
# 6 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/math.h" 2 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/ieeefp.h" 1 3
# 7 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/math.h" 2 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 1 3
# 8 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/math.h" 2 3






union __dmath
{
  double d;
  __ULong i[2];
};

union __fmath
{
  float f;
  __ULong i[1];
};


union __ldmath
{
  long double ld;
  __ULong i[4];
};
# 111 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/math.h" 3
extern double atan (double);
extern double cos (double);
extern double sin (double);
extern double tan (double);
extern double tanh (double);
extern double frexp (double, int *);
extern double modf (double, double *);
extern double ceil (double);
extern double fabs (double);
extern double floor (double);






extern double acos (double);
extern double asin (double);
extern double atan2 (double, double);
extern double cosh (double);
extern double sinh (double);
extern double exp (double);
extern double ldexp (double, int);
extern double log (double);
extern double log10 (double);
extern double pow (double, double);
extern double sqrt (double);
extern double fmod (double, double);
# 148 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/math.h" 3
typedef float float_t;
typedef double double_t;
# 175 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/math.h" 3
extern int __isinff (float x);
extern int __isinfd (double x);
extern int __isnanf (float x);
extern int __isnand (double x);
extern int __fpclassifyf (float x);
extern int __fpclassifyd (double x);
extern int __signbitf (float x);
extern int __signbitd (double x);
# 235 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/math.h" 3
extern double infinity (void);
extern double nan (const char *);
extern int finite (double);
extern double copysign (double, double);
extern double logb (double);
extern int ilogb (double);

extern double asinh (double);
extern double cbrt (double);
extern double nextafter (double, double);
extern double rint (double);
extern double scalbn (double, int);

extern double exp2 (double);
extern double scalbln (double, long int);
extern double tgamma (double);
extern double nearbyint (double);
extern long int lrint (double);
extern long long int llrint (double);
extern double round (double);
extern long int lround (double);
extern long long int llround (double);
extern double trunc (double);
extern double remquo (double, double, int *);
extern double fdim (double, double);
extern double fmax (double, double);
extern double fmin (double, double);
extern double fma (double, double, double);


extern double log1p (double);
extern double expm1 (double);



extern double acosh (double);
extern double atanh (double);
extern double remainder (double, double);
extern double gamma (double);
extern double lgamma (double);
extern double erf (double);
extern double erfc (double);
extern double log2 (double);



extern double hypot (double, double);






extern float atanf (float);
extern float cosf (float);
extern float sinf (float);
extern float tanf (float);
extern float tanhf (float);
extern float frexpf (float, int *);
extern float modff (float, float *);
extern float ceilf (float);
extern float fabsf (float);
extern float floorf (float);


extern float acosf (float);
extern float asinf (float);
extern float atan2f (float, float);
extern float coshf (float);
extern float sinhf (float);
extern float expf (float);
extern float ldexpf (float, int);
extern float logf (float);
extern float log10f (float);
extern float powf (float, float);
extern float sqrtf (float);
extern float fmodf (float, float);




extern float exp2f (float);
extern float scalblnf (float, long int);
extern float tgammaf (float);
extern float nearbyintf (float);
extern long int lrintf (float);
extern long long llrintf (float);
extern float roundf (float);
extern long int lroundf (float);
extern long long int llroundf (float);
extern float truncf (float);
extern float remquof (float, float, int *);
extern float fdimf (float, float);
extern float fmaxf (float, float);
extern float fminf (float, float);
extern float fmaf (float, float, float);

extern float infinityf (void);
extern float nanf (const char *);
extern int finitef (float);
extern float copysignf (float, float);
extern float logbf (float);
extern int ilogbf (float);

extern float asinhf (float);
extern float cbrtf (float);
extern float nextafterf (float, float);
extern float rintf (float);
extern float scalbnf (float, int);
extern float log1pf (float);
extern float expm1f (float);


extern float acoshf (float);
extern float atanhf (float);
extern float remainderf (float, float);
extern float gammaf (float);
extern float lgammaf (float);
extern float erff (float);
extern float erfcf (float);
extern float log2f (float);

extern float hypotf (float, float);






extern long double atanl (long double);
extern long double cosl (long double);
extern long double sinl (long double);
extern long double tanl (long double);
extern long double tanhl (long double);
extern long double frexpl (long double value, int *);
extern long double modfl (long double, long double *);
extern long double ceill (long double);
extern long double fabsl (long double);
extern long double floorl (long double);
extern long double log1pl (long double);
extern long double expm1l (long double);




extern long double acosl (long double);
extern long double asinl (long double);
extern long double atan2l (long double, long double);
extern long double coshl (long double);
extern long double sinhl (long double);
extern long double expl (long double);
extern long double ldexpl (long double, int);
extern long double logl (long double);
extern long double log10l (long double);
extern long double powl (long double, long double);
extern long double sqrtl (long double);
extern long double fmodl (long double, long double);
extern long double hypotl (long double, long double);


extern long double copysignl (long double, long double);
extern long double nanl (const char *);
extern int ilogbl (long double);
extern long double asinhl (long double);
extern long double cbrtl (long double);
extern long double nextafterl (long double, long double);
extern long double rintl (long double);
extern long double scalbnl (long double, int);
extern long double exp2l (long double);
extern long double scalblnl (long double, long);
extern long double tgammal (long double);
extern long double nearbyintl (long double);
extern long int lrintl (long double);
extern long long int llrintl (long double);
extern long double roundl (long double);
extern long lroundl (long double);
extern long long int llroundl (long double);
extern long double truncl (long double);
extern long double remquol (long double, long double, int *);
extern long double fdiml (long double, long double);
extern long double fmaxl (long double, long double);
extern long double fminl (long double, long double);
extern long double fmal (long double, long double, long double);

extern long double acoshl (long double);
extern long double atanhl (long double);
extern long double remainderl (long double, long double);
extern long double lgammal (long double);
extern long double erfl (long double);
extern long double erfcl (long double);
# 572 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/math.h" 3

# 2 "gameLogic.c" 2
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
# 3 "gameLogic.c" 2
# 1 "collisionMap.h" 1
# 20 "collisionMap.h"
extern const unsigned short collisionMapBitmap[81920];
# 4 "gameLogic.c" 2
# 1 "gameLogic.h" 1
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
# 5 "gameLogic.c" 2
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
# 6 "gameLogic.c" 2
# 1 "PUNCH.h" 1
# 20 "PUNCH.h"
extern const unsigned char PUNCH[12120];
# 7 "gameLogic.c" 2
# 1 "PUNCH2.h" 1
# 20 "PUNCH2.h"
extern const unsigned char PUNCH2[4136];
# 8 "gameLogic.c" 2
# 1 "HURT.h" 1
# 20 "HURT.h"
extern const unsigned char HURT[11176];
# 9 "gameLogic.c" 2
# 1 "EPUNCH.h" 1
# 20 "EPUNCH.h"
extern const unsigned char EPUNCH[8376];
# 10 "gameLogic.c" 2
# 1 "EPUNCH2.h" 1
# 20 "EPUNCH2.h"
extern const unsigned char EPUNCH2[10704];
# 11 "gameLogic.c" 2
# 1 "EHURT.h" 1
# 20 "EHURT.h"
extern const unsigned char EHURT[6480];
# 12 "gameLogic.c" 2
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 1 3
# 34 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 211 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int size_t;
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
# 323 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
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

# 13 "gameLogic.c" 2
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 1 3
# 10 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/ieeefp.h" 1 3
# 11 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3




# 1 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 16 "c:\\devkitarm\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3


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



# 14 "gameLogic.c" 2


extern char state;
extern MOVOBJ ninja[];
extern MOVOBJ powerUp;
extern MOVOBJ bul[];
extern MOVOBJ bossBul[];
extern int stage;
extern char cheat;
extern MOVOBJ boss;
extern char mute;


enum {PAUSEHURT = -2, PAUSEHURTFLIP= -1, UNPAUSE = 0, PAUSEPUNCH = 1, PAUSESTAND = 40};
enum {WALK, INPLACE, FIGHT};
char goingUp;
int countShots;
int power;

int hOff = 0;
int vOff = 0;

int count = 0;

OBJ_ATTR shadowOAM[128];

int powerTime = 0;
int flashCounter = 10;
char release = 0;

int ninjaHit(MOVOBJ*nin, MOVOBJ*play) {

 if (play->cdel<0) {

  if (play->col >= nin->col && play->col <= (nin->col + nin->width)) {

   return 1;
  } else {

   return 0;
  }

 } else {

  if (((play->col+play->width) >= nin->col) && ((play->col+play->width) <= (nin->col + nin->width))) {
   return 1;
  } else {
   return 0;
  }
 }
}
char allNinjasDead() {

 for (int i = 0; i < 5; i++) {
  if (ninja[i].active) {

   return 0;
  }
 }

 return 1;
}
void updateBoss(MOVOBJ*bos, MOVOBJ*play) {
 if(!bos->active) {

  shadowOAM[bos->oamNum].attr0 = (0xFF & bos->row) | (1 << 14);
  shadowOAM[bos->oamNum].attr1 = (3 << 14) | (0x1FF & bos->col);
  shadowOAM[bos->oamNum].attr2 = (((7*4))*32+((3*8))) | (((3)&15)<<12);
  shadowOAM[bos->oamNum+1].attr0 = (2 << 8);
 } else {
  if(bos->aniCounter % 20 == 0) {
   bos->currFrame = (bos->currFrame + 1) %3;
  }

  shadowOAM[bos->oamNum].attr0 = (0xFF & bos->row) | (0 << 14);
  shadowOAM[bos->oamNum].attr1 = (2 << 14) | (0x1FF & bos->col) | (1 << 12);
  shadowOAM[bos->oamNum].attr2 = ((5)*32+(28)) | (((3)&15)<<12);
  shadowOAM[bos->oamNum+1].attr0 = (0xFF & bos->row) | (0 << 14);
  shadowOAM[bos->oamNum+1].attr1 = (2 << 14) | (0x1FF & (bos->col+bos->width/2)) | (1 << 12);
  shadowOAM[bos->oamNum+1].attr2 = ((10+(bos->currFrame*5))*32+(28)) | (((3)&15)<<12);
  bos->aniCounter++;
  if (release%5000==0) {
   for(int i=0; i<5;i++) {
    if (!ninja[i].active) {
     ninja[i].hit = 0;
     if (rand()%2==0) {
      ninja[i].cdel = 1;
      ninja[i].col = -60;
     } else {
      ninja[i].col = 245;
     }
     break;
    }
   }
  }
  if (release%6000==0) {
   for(int i=0; i<5;i++) {
    if (!bossBul[i].active) {
     bossBul[i].active = 1;
     bossBul[i].col = (rand()%230);
    }
   }
  }
  release++;
  if (bos->hit > 200) {
   bos->active = 0;
  }
 }
 for(int i=0; i<5;i++) {
  if (bossBul[i].active) {
   bossBul[i].row+=bossBul[i].rdel;

    shadowOAM[bossBul[i].oamNum].attr0 = (0xFF & bossBul[i].row) | (0 << 14);
    shadowOAM[bossBul[i].oamNum].attr1 = (1 << 14) | (0x1FF & bossBul[i].col);
    shadowOAM[bossBul[i].oamNum].attr2 = ((19)*32+(22)) | (((3)&15)<<12);
   if (((bossBul[i].col+4)>play->col) && ((bossBul[i].col+4)<(play->col+(play->width/2)))) {
    if (((bossBul[i].row+4)>play->row) && ((bossBul[i].row+4)<(play->row+play->height))) {
     shadowOAM[bossBul[i].oamNum].attr0 = (2 << 8);
     bossBul[i].active = 0;
     bossBul[i].row=-10*i;
     if (!goingUp) {
      hitPlayer(&bossBul[i], play);
      play->pause = UNPAUSE;
      play->pause++;
     } else {

      play->aniState = FIGHT;
      play->currFrame = 2;
     }
    }
   }
  }
  if (bossBul[i].row>=130) {
   bossBul[i].active = 0;
   bossBul[i].row=-10*i;
   shadowOAM[bossBul[i].oamNum].attr0 = (2 << 8);
  }
 }
}
void move(int direction, MOVOBJ*play) {
 play->cdel = direction;

 if (((hOff <= 0 || (play->col + (play->width/2)) > 120) || stage==2) && direction < 0) {

  if (play->col > 0) {

   play->col+= play->cdel;
  }

 } else if (((hOff >= 512 || (play->col + (play->width/2)) < 120) || stage==2) && direction > 0) {

  if ((play->col < (240-play->width)) || ((allNinjasDead() && !boss.active) && (play->col <= 512))) {

   play->col += play->cdel;
  }
 } else {

  hOff+=play->cdel;

  if (powerUp.active) {

   powerUp.col-=play->cdel;
  }

  for (int i = 0; i < 5; i++) {

   if (bul[i].active) {

    bul[i].col-=play->cdel;
   }
  }

  for (int i = 0; i < 5; i++) {

   ninja[i].col-=play->cdel;
  }
 }
}
void updatePlayer(MOVOBJ*play){

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

  play->pause++;
  if (play->pause%20==0) {

   play->pause=UNPAUSE;
  }

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
 } else if (play->pause>PAUSESTAND) {
  play->pause++;
  if (play->pause%10==0) {

   play->pause=UNPAUSE;
  }
 } else {

  if ((~(*(volatile unsigned int *)0x04000130) & ((1<<9)))) {

   if (!goingUp) {

    goingUp = 1;

    play->racc = -12;

    play->aniState = INPLACE;
    play->currFrame = 1;

    count = 0;
   }
  }

  if (!goingUp) {

         if((play->pause<PAUSESTAND)) {

          play->aniState = INPLACE;
          if(play->aniCounter % 20 == 0) {
     play->currFrame = (play->currFrame + 1) %4;
    }
         }

   if((~(*(volatile unsigned int *)0x04000130) & ((1<<5))) && (play->pause<PAUSESTAND) && !(~(*(volatile unsigned int *)0x04000130) & ((1<<1)))) {

    play->aniState = WALK;
    move(-1, play);
   }
   if((~(*(volatile unsigned int *)0x04000130) & ((1<<7))) && (play->pause<PAUSESTAND) && !(~(*(volatile unsigned int *)0x04000130) & ((1<<1)))) {

    play->aniState = WALK;
    if (play->row + (play->height/2) <= 150) {
     play->row++;
    }
   }
   if((~(*(volatile unsigned int *)0x04000130) & ((1<<6))) && (play->pause<PAUSESTAND) && !(~(*(volatile unsigned int *)0x04000130) & ((1<<1)))) {

    play->aniState = WALK;
    if (play->row > 110) {
     play->row--;
    }
   }

   if((~(*(volatile unsigned int *)0x04000130) & ((1<<4))) && (play->pause<PAUSESTAND) && !(~(*(volatile unsigned int *)0x04000130) & ((1<<1)))) {

    play->aniState = WALK;
    move(1, play);
   }

   if (play->pause == PAUSESTAND) {

          if (play->aniState != FIGHT) {
           if (cheat) {
            if (!mute) {
             playSoundB(EPUNCH,8376,11025);
            }
           } else {
            if (!mute) {
             playSoundB(PUNCH,12120,22050);
            }
           }
          }

    play->aniState = FIGHT;
    play->currFrame = 0;
    if (boss.active) {
     if(ninjaHit(&boss, play)) {
      boss.hit+=6;
     }
    }
    for (int i = 0; i < 5; i++) {
     if(ninja[i].active) {
      if(ninjaHit(&ninja[i], play)) {
       if (ninja[i].pause >= UNPAUSE) {
        ninja[i].hit++;

        if ((play->cdel>0 && ninja[i].cdel < 0)||(play->cdel <0 && ninja[i].cdel > 0)){
         ninja[i].pause = PAUSEHURT;
        } else {

         ninja[i].pause = PAUSEHURTFLIP;
        }
        break;
       }
      }
     }
    }
    play->pause++;
   }

   if ((~(*(volatile unsigned int *)0x04000130) & ((1<<1))) && (play->pause<PAUSESTAND)) {

    if (power > 0) {

     play->aniState = FIGHT;
     play->currFrame = 1;

     if (countShots % 20 == 0) {

      for (int i = 0; i < 5; i++) {
       if (!bul[i].active) {
        if (cheat) {
         if (!mute) {
          playSoundB(EPUNCH2,10704,22050);
         }
        } else {
         if (!mute) {
          playSoundB(PUNCH2,4136,11025);
         }
        }

        power--;

        bul[i].active = 1;

        bul[i].row = play->row + (bul[i].height/2);
        if (play->cdel < 0) {

         bul[i].cdel = -1;

         bul[i].col = play->col;
        } else {

         bul[i].cdel = 1;

         bul[i].col = play->col + (play->width/2);
        }
        break;
       }
      }
     }

     countShots++;
    }
   }
  }

  if(play->aniState == INPLACE) {

   if(!goingUp) {

    play->currFrame = 0;
   }
  } else {

   if (play->aniState != FIGHT) {

    play->aniCounter++;
   }
  }

  if(goingUp) {

   count ++;

   if (count >= 15) {

    if (count & 1) {

     update(play);
    }

    if((~(*(volatile unsigned int *)0x04000130) & ((1<<5))) && (play->pause<PAUSESTAND) && !(~(*(volatile unsigned int *)0x04000130) & ((1<<1)))) {

     move(-1,play);
    }

    if((~(*(volatile unsigned int *)0x04000130) & ((1<<4))) && (play->pause<PAUSESTAND) && !(~(*(volatile unsigned int *)0x04000130) & ((1<<1)))) {

     move(1,play);
    }
   }
  }
 }



    shadowOAM[play->oamNum].attr0 = (0xFF & play->row) | (2 << 14);

 if (play->cdel < 0) {

  shadowOAM[play->oamNum].attr1 = (3 << 14) | (0x1FF & play->col) | (1 << 12);
 } else {

  shadowOAM[play->oamNum].attr1 = (3 << 14) | (0x1FF & play->col);
 }
 shadowOAM[play->oamNum].attr2 = (play->currFrame*8)*32+(play->aniState*8);
}
void updateBullet(MOVOBJ* sparkle) {

 if (sparkle->active) {

  shadowOAM[sparkle->oamNum].attr0 = (0xFF & sparkle->row) | (0 << 14);

  if (sparkle->cdel ==-1) {

   shadowOAM[sparkle->oamNum].attr1 = (1 << 14) | (0x1FF & sparkle->col)|(1 << 12);
  } else {

   shadowOAM[sparkle->oamNum].attr1 = (1 << 14) | (0x1FF & sparkle->col);
  }

  shadowOAM[sparkle->oamNum].attr2 = (sparkle->currFrame*8)*32+(sparkle->aniState*3);

  sparkle->col+=sparkle->cdel;


  if ((sparkle->col >= 220) || (sparkle->col <=0)) {
   sparkle->active = 0;
   shadowOAM[sparkle->oamNum].attr0 = (2 << 8);
  }

  if (boss.active) {
   if (ninjaHit(&boss, sparkle)) {

    sparkle->active=0;
    shadowOAM[sparkle->oamNum].attr0 = (2 << 8);

    boss.hit+=6;
   }
  }
  for (int i = 0; i < 5; i++) {

   if (ninja[i].active) {

    if (ninja[i].pause >= 0) {

     if (ninjaHit(&ninja[i], sparkle)) {

      sparkle->active=0;
      shadowOAM[sparkle->oamNum].attr0 = (2 << 8);

      ninja[i].hit++;

      if ((sparkle->cdel>0 && ninja[i].cdel < 0)||(sparkle->cdel <0 && ninja[i].cdel > 0)){

       ninja[i].pause = PAUSEHURT;
      } else {

       ninja[i].pause = PAUSEHURTFLIP;
      }

      break;
     }
    }
   }
  }
 }
}
void updateStats(MOVOBJ*play) {


 for (int i = 0; i < 10; i ++) {
  shadowOAM[32 + i].attr0 = (0xFF & 12) | (0 << 14);
  shadowOAM[32 + i].attr2 = ((9*2)*32+(12));
  if (i%2==1) {
   shadowOAM[32 + i].attr1 = (1 << 12) | (0 << 14) | (0x1FF & (31 + (4*(i-1))));
  } else {
   shadowOAM[32 + i].attr1 = (0 << 14) | (0x1FF & (32 + (4*i)));
  }
 }
 for (int i = play->hit; i > 0; i --) {
  shadowOAM[42 - i].attr0 = (2 << 8);
 }

 for (int i = 0; i < power; i++) {
  if (!bul[(i%5)].active) {
   shadowOAM[21 + i].attr0 = (0xFF & 20) | (0 << 14);
   shadowOAM[21 + i].attr1 = (0 << 14) | (0x1FF & (32 + (4*i)));
   shadowOAM[21 + i].attr2 = ((9*2)*32+(13));
  }
 }

 for (int i = 10; i >= power; i--) {
   shadowOAM[21 + i].attr0 = (2 << 8);
 }
 if (stage == 2) {
  for (int i = 1; i < 11; i++) {
   if (boss.hit >= (i*10)) {
    if (boss.hit >= ((i*10) + 100)) {
     shadowOAM[116 + i].attr0 = (2 << 8);
    } else {
     shadowOAM[116 + i].attr2 = ((10)*32+(23)) | (((3)&15)<<12);
    }
   }
  }
 }


 if ((!boss.active) && allNinjasDead()) {
  flashCounter++;
  if (flashCounter%100==0) {
   shadowOAM[85].attr0 = (2 << 8);
   flashCounter = 0;
  } else if (flashCounter%50==0) {
   shadowOAM[85].attr0 = (0xFF & 60) | (0 << 14);
   shadowOAM[85].attr1 = (2 << 14) | (0x1FF & 190);
   shadowOAM[85].attr2 = ((21)*32+(21)) | (((3)&15)<<12);
  }
 } else {
  if (flashCounter%100==0) {
   shadowOAM[85].attr0 = (2 << 8);
   flashCounter = 0;
  } else {
   flashCounter++;
  }
 }
}
void updatePowerUps(MOVOBJ* powerup) {
 if (powerup->active) {
  powerup->col+=powerup->cdel;
  if ((powerup->col < 250) && (powerup->col > -10)) {

   shadowOAM[powerup->oamNum].attr0 = (0xFF & powerup->row) | (0 << 14);
   shadowOAM[powerup->oamNum].attr1 = (1 << 14) | (0x1FF & powerup->col);
   shadowOAM[powerup->oamNum].attr2 = ((powerup->currFrame)*32+(3*powerup->aniState)) | (((2)&15)<<12);
  } else {

   shadowOAM[powerUp.oamNum].attr0 = (2 << 8);
   if (powerup->col<-10) {
    powerup->active=0;
   }
  }
 } else {

  powerTime++;

  if (powerTime%500 == 0) {

   powerUp.col = 240;
   powerup->active = 1;
  }

  shadowOAM[powerUp.oamNum].attr0 = (2 << 8);
 }
}
char obtainedPowerUp(MOVOBJ*play) {
 if (powerUp.active) {
  if ((play->col <= (powerUp.col+powerUp.width-8)) && ((play->col +play->width) >= (powerUp.col+powerUp.width-8))) {
   if (play->row <= (powerUp.row +powerUp.height)) {
    return 1;
   }
  } else if ((play->col <= powerUp.col) && ((play->col +play->width-8) >= (powerUp.col))) {
   if (play->row <= (powerUp.row +powerUp.height)) {
    return 1;
   }
  }
 }
 return 0;
}
void update(MOVOBJ*play) {

 play->currFrame=2;

 play->racc= play->racc+play->rdel;

    play->row += play->racc;

    if(play->row >= 110) {
        goingUp = 0;
    }

    if (obtainedPowerUp(play)) {

     if ((power+2)<=10) {
      power=power+2;
     } else {
      power=10;
     }

     powerUp.active = 0;
     powerTime = 0;
    }
}

void enemyTurnAround(MOVOBJ * nin) {
 nin->cdel = -nin->cdel;
}

void hitPlayer(MOVOBJ * nin, MOVOBJ*play) {

 nin->aniState = 12;
 nin->currFrame = 0;

 play->hit++;
 if (cheat) {
  if (!mute) {
   playSoundB(EHURT,6480,11025);
  }
 } else {
  if (!mute) {
   playSoundB(HURT,11176,22050);
  }
 }

 nin->pause=PAUSEPUNCH;
 if ((play->col <= 0) || (play->col >= 240 - play->width)) {

  enemyTurnAround(nin);
 }
}

void updateBadies(MOVOBJ * nin, MOVOBJ* play){
 if (cheat){

  if ( (abs( (play->col + (play->width/2)) - nin->col ) <= 10) || (abs( (play->col - (nin->col + (nin->width/2))))) <= 10) {
   nin->hit += 20;
  }
 }
 if(abs(play->col - nin->col) <= 300) {

  nin->active = 1;
 }

 if (nin->hit >= 20) {
  nin->active = 0;
  nin->aniState = 12;
  nin->currFrame = 3;
 }

 if (nin->active) {
  if (nin->col == 0 || (nin->col < play->col - 60)) {

   nin->cdel = 1;
  } else if (nin->col == 210 || (nin->col > play->col + 70)) {

   nin->cdel = -1;
  }
  if(!goingUp) {
   if (nin->cdel > 0) {
    if (abs(nin->col - play->col + 32) < abs(nin->row - play->row)) {
     if (play->row > nin->row) {
      nin->rdel = 1;
     } else if (play->row < nin->row) {
      nin->rdel = -1;
     }
    } else {
     nin->rdel=0;
    }
   } else {
    if (abs(nin->col - play->col - 32) <= abs(nin->row - play->row)) {
     if (play->row > nin->row) {
      nin->rdel = 1;
     } else if (play->row < nin->row) {
      nin->rdel = -1;
     }
    }
    else {
     nin->rdel=0;
    }
   }
  }
  if (nin->cdel == -1) {

   if (((nin->col >= play->col + 6) && (nin->col <= play->col +8)) && (abs(play->row - nin->row)<=1)) {
    if (!play->pause){
     hitPlayer(nin, play);
     play->pause++;
    }
   }
   if (nin->pause < UNPAUSE) {
    if (nin->pause == PAUSEHURTFLIP){
     nin->cdel = -nin->cdel;
    }

    nin->col -= nin->cdel;

    nin->pause--;

    nin->aniState = 21;
    nin->currFrame = 0;

    if (nin->pause%20 == 0) {
     nin->pause = UNPAUSE;
    }
   } else if ((nin->pause > UNPAUSE) && (nin->pause < PAUSESTAND)) {
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
    if ((collisionMapBitmap[((nin->row + vOff + nin->height + nin->rdel)*(512)+(nin->col + hOff))] == 0x7FFF)) {
     if (!(~(*(volatile unsigned int *)0x04000130) & ((1<<6))) && !(~(*(volatile unsigned int *)0x04000130) & ((1<<7)))) {
      nin->row += nin->rdel;
     }
    }
    if (abs((nin->col) - (play->col+(play->width/2)) == 6)) {
     nin->pause = PAUSESTAND;
    }
   }
  } else {

   if ((((nin->col+nin->width) >= play->col + 6) && ((nin->col+nin->width) <= play->col +8)) && (abs(play->row - nin->row)<=1)) {
    if (!play->pause){
     hitPlayer(nin, play);
     play->pause--;
    }
   }

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
   } else if ((nin->pause > UNPAUSE) && (nin->pause < PAUSESTAND)) {
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
    if ((collisionMapBitmap[((nin->row + vOff + nin->height + nin->rdel)*(512)+(nin->col + hOff))] == 0x7FFF)) {
     if (!(~(*(volatile unsigned int *)0x04000130) & ((1<<6))) && !(~(*(volatile unsigned int *)0x04000130) & ((1<<7)))) {
      nin->row += nin->rdel;
     }
    }
    if (abs((nin->col + nin->width/2) - play->col) == 6) {
     nin->pause = PAUSESTAND;
    }
   }
  }

  if (nin->col < -64 || nin->col > 240) {
   shadowOAM[nin->oamNum].attr0 = (2 << 8);
  } else {
   shadowOAM[nin->oamNum].attr0 = (0xFF & nin->row) | (2 << 14);
  }
 } else {
  if (nin->col < -64 || nin->col > 240) {
   shadowOAM[nin->oamNum].attr0 = (2 << 8);
  } else {
   shadowOAM[nin->oamNum].attr0 = (0xFF & nin->row) | (0 << 14);
  }
 }
 if (nin->cdel == 1) {
   shadowOAM[nin->oamNum].attr1 = (3 << 14) | (0x1FF & nin->col) | (1 << 12);
 } else {
  shadowOAM[nin->oamNum].attr1 = (3 << 14) | (0x1FF & nin->col);
 }
 shadowOAM[nin->oamNum].attr2 = ((nin->currFrame*8)*32+(nin->aniState)) | (((1)&15)<<12);
}

void hideSprites() {
    for (int i = 0; i < 128; i++) {
     shadowOAM[i].attr0 = (2 << 8);
    }
}

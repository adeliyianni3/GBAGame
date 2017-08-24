
//{{BLOCK(instruc)

//======================================================================
//
//	instruc, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 477 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 15264 + 2048 = 17824
//
//	Time-stamp: 2016-04-12, 19:57:24
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUC_H
#define GRIT_INSTRUC_H

#define instrucTilesLen 15264
extern const unsigned short instrucTiles[7632];

#define instrucMapLen 2048
extern const unsigned short instrucMap[1024];

#define instrucPalLen 512
extern const unsigned short instrucPal[256];

#endif // GRIT_INSTRUC_H

//}}BLOCK(instruc)


//{{BLOCK(charSelect)

//======================================================================
//
//	charSelect, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 441 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 14112 + 2048 = 16672
//
//	Time-stamp: 2016-04-12, 19:05:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CHARSELECT_H
#define GRIT_CHARSELECT_H

#define charSelectTilesLen 14112
extern const unsigned short charSelectTiles[7056];

#define charSelectMapLen 2048
extern const unsigned short charSelectMap[1024];

#define charSelectPalLen 512
extern const unsigned short charSelectPal[256];

#endif // GRIT_CHARSELECT_H

//}}BLOCK(charSelect)

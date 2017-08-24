
//{{BLOCK(bg3)

//======================================================================
//
//	bg3, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 95 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 3040 + 4096 = 7648
//
//	Time-stamp: 2016-04-13, 16:17:35
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG3_H
#define GRIT_BG3_H

#define bg3TilesLen 3040
extern const unsigned short bg3Tiles[1520];

#define bg3MapLen 4096
extern const unsigned short bg3Map[2048];

#define bg3PalLen 512
extern const unsigned short bg3Pal[256];

#endif // GRIT_BG3_H

//}}BLOCK(bg3)

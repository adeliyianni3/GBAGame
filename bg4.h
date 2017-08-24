
//{{BLOCK(bg4)

//======================================================================
//
//	bg4, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 71 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 2272 + 4096 = 6880
//
//	Time-stamp: 2016-04-13, 16:30:23
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG4_H
#define GRIT_BG4_H

#define bg4TilesLen 2272
extern const unsigned short bg4Tiles[1136];

#define bg4MapLen 4096
extern const unsigned short bg4Map[2048];

#define bg4PalLen 512
extern const unsigned short bg4Pal[256];

#endif // GRIT_BG4_H

//}}BLOCK(bg4)


//{{BLOCK(bg2)

//======================================================================
//
//	bg2, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 317 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 10144 + 4096 = 14752
//
//	Time-stamp: 2016-03-16, 13:06:08
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG2_H
#define GRIT_BG2_H

#define bg2TilesLen 10144
extern const unsigned short bg2Tiles[5072];

#define bg2MapLen 4096
extern const unsigned short bg2Map[2048];

#define bg2PalLen 512
extern const unsigned short bg2Pal[256];

#endif // GRIT_BG2_H

//}}BLOCK(bg2)

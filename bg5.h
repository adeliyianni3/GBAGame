
//{{BLOCK(bg5)

//======================================================================
//
//	bg5, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 687 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 21984 + 4096 = 26592
//
//	Time-stamp: 2016-04-13, 16:33:22
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG5_H
#define GRIT_BG5_H

#define bg5TilesLen 21984
extern const unsigned short bg5Tiles[10992];

#define bg5MapLen 4096
extern const unsigned short bg5Map[2048];

#define bg5PalLen 512
extern const unsigned short bg5Pal[256];

#endif // GRIT_BG5_H

//}}BLOCK(bg5)

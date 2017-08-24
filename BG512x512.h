
//{{BLOCK(BG512x512)

//======================================================================
//
//	BG512x512, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 125 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 4000 + 4096 = 8608
//
//	Time-stamp: 2016-04-19, 21:01:48
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG512X512_H
#define GRIT_BG512X512_H

#define BG512x512TilesLen 4000
extern const unsigned short BG512x512Tiles[2000];

#define BG512x512MapLen 4096
extern const unsigned short BG512x512Map[2048];

#define BG512x512PalLen 512
extern const unsigned short BG512x512Pal[256];

#endif // GRIT_BG512X512_H

//}}BLOCK(BG512x512)

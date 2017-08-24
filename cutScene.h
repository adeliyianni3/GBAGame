
//{{BLOCK(cutScene)

//======================================================================
//
//	cutScene, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 319 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10208 + 2048 = 12768
//
//	Time-stamp: 2016-04-19, 21:37:04
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CUTSCENE_H
#define GRIT_CUTSCENE_H

#define cutSceneTilesLen 10208
extern const unsigned short cutSceneTiles[5104];

#define cutSceneMapLen 2048
extern const unsigned short cutSceneMap[1024];

#define cutScenePalLen 512
extern const unsigned short cutScenePal[256];

#endif // GRIT_CUTSCENE_H

//}}BLOCK(cutScene)

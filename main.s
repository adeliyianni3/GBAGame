	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	spritesCompRow
	.type	spritesCompRow, %function
spritesCompRow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #0]
	ldr	r2, .L11
	cmp	r3, r2
	ldr	r1, [r0, #0]
	beq	.L9
.L2:
	cmp	r1, r2
	ldrne	r3, [r3, #0]
	beq	.L10
.L5:
	ldr	r0, [r1, #0]
	rsb	r0, r0, r3
	bx	lr
.L9:
	ldr	ip, [r3, #0]
	ldr	r0, [r1, #0]
	rsb	r0, r0, ip
	add	r0, r0, #2
	cmp	r0, #4
	movls	r0, #1
	bhi	.L2
	bx	lr
.L10:
	ldr	r3, [r3, #0]
	ldr	r2, [r1, #0]
	rsb	r2, r2, r3
	add	r2, r2, #2
	cmp	r2, #4
	bhi	.L5
	mvn	r0, #0
	bx	lr
.L12:
	.align	2
.L11:
	.word	player
	.size	spritesCompRow, .-spritesCompRow
	.align	2
	.global	sortSprites
	.type	sortSprites, %function
sortSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r2, #4
	ldr	r3, .L16
	ldr	r0, .L16+4
	mov	r1, #6
	ldr	ip, .L16+8
	mov	lr, pc
	bx	ip
	ldr	r2, .L16+12
	mov	r3, #0
.L14:
	ldr	r1, [r2, #4]!
	str	r3, [r1, #44]
	add	r3, r3, #1
	cmp	r3, #6
	bne	.L14
	ldmfd	sp!, {r3, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	spritesCompRow
	.word	sprites
	.word	qsort
	.word	sprites-4
	.size	sortSprites, .-sortSprites
	.align	2
	.global	stageUpdate
	.type	stageUpdate, %function
stageUpdate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L34
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L30
	cmp	r3, #1
	beq	.L31
	cmp	r3, #2
	ldrne	ip, .L34+4
	beq	.L32
.L20:
	mov	r3, #32768
	strh	r3, [ip, #154]	@ movhi
	mov	r2, #0	@ movhi
	mov	r3, #25	@ movhi
	strh	r2, [ip, #152]	@ movhi
	strh	r3, [ip, #156]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L32:
	ldr	r3, .L34+8
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L33
.L22:
	ldr	r0, .L34+12
	ldr	r3, .L34+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L34+20
	mov	r0, #3
	ldr	r1, .L34+24
	mov	r2, #100663296
	mov	r3, #1520
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L34+28
	add	r2, r2, #55296
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r3, #10944
	mov	r0, #3
	ldr	r1, .L34+32
	add	r2, r2, #32768
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	add	r2, r2, #61440
	mov	r3, #2048
	ldr	r1, .L34+36
	mov	lr, pc
	bx	r4
	mov	r7, #12608
	ldr	r3, .L34+40
	mov	r8, r7
	ldr	ip, .L34+4
	ldr	r6, [r3, #20]
	mov	r2, #10
	mov	r0, #160
	mov	r3, #0
	add	r7, r7, #22
	add	r8, r8, #23
.L26:
	add	r4, ip, r3
	cmp	r6, r2
	add	r1, r4, #936
	bic	r5, r0, #65024
	mov	r9, #16	@ movhi
	addlt	r4, r4, #940
	add	sl, r2, #99
	strh	r9, [r1, #0]	@ movhi
	strh	r5, [r1, #2]	@ movhi
	strlth	r7, [r4, #0]	@ movhi
	blt	.L25
	cmp	r6, sl
	movgt	r4, #512	@ movhi
	addle	r4, r4, #940
	strgth	r4, [r1, #0]	@ movhi
	strleh	r8, [r4, #0]	@ movhi
.L25:
	add	r0, r0, #4
	add	r3, r3, #8
	mov	r0, r0, asl #16
	cmp	r3, #80
	mov	r0, r0, lsr #16
	add	r2, r2, #10
	bne	.L26
	mov	r2, #928
	mvn	r1, #32512
	add	r2, r2, #2
	mov	r3, #12480
	sub	r1, r1, #55
	add	r3, r3, #22
	strh	r1, [ip, r2]	@ movhi
	mov	r2, #932
	strh	r3, [ip, r2]	@ movhi
	mov	r9, #0	@ movhi
	mov	r3, #928
	strh	r9, [ip, r3]	@ movhi
	b	.L20
.L30:
	ldr	r0, .L34+44
	ldr	r3, .L34+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L34+20
	mov	r0, #3
	ldr	r1, .L34+48
	mov	r2, #100663296
	mov	r3, #2000
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L34+52
	add	r2, r2, #55296
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r3, #5056
	mov	r0, #3
	ldr	r1, .L34+56
	add	r2, r2, #32768
	add	r3, r3, #16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L34+60
	add	r2, r2, #61440
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	ldr	ip, .L34+4
	b	.L20
.L33:
	mov	r2, #11008
	ldr	r0, .L34+64
	mov	r1, #1294336
	add	r2, r2, #17
	ldr	r3, .L34+68
	mov	lr, pc
	bx	r3
	b	.L22
.L31:
	ldr	r0, .L34+12
	ldr	r3, .L34+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L34+20
	mov	r0, #3
	ldr	r1, .L34+24
	mov	r2, #100663296
	mov	r3, #1520
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L34+28
	add	r2, r2, #55296
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L34+72
	add	r2, r2, #32768
	mov	r3, #1136
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L34+76
	add	r2, r2, #61440
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	ldr	ip, .L34+4
	b	.L20
.L35:
	.align	2
.L34:
	.word	stage
	.word	shadowOAM
	.word	mute
	.word	bg3Pal
	.word	loadPalette
	.word	DMANow
	.word	bg3Tiles
	.word	bg3Map
	.word	bg5Tiles
	.word	bg5Map
	.word	boss
	.word	BG512x512Pal
	.word	BG512x512Tiles
	.word	BG512x512Map
	.word	bg2Tiles
	.word	bg2Map
	.word	Stage_3
	.word	playSoundA
	.word	bg4Tiles
	.word	bg4Map
	.size	stageUpdate, .-stageUpdate
	.align	2
	.global	initInstruc
	.type	initInstruc, %function
initInstruc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L38
	stmfd	sp!, {r4, lr}
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, #256	@ movhi
	cmp	r3, #0
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	bne	.L37
	mov	r1, #173056
	mov	r2, #11008
	ldr	r0, .L38+4
	sub	r1, r1, #61
	add	r2, r2, #17
	ldr	r3, .L38+8
	mov	lr, pc
	bx	r3
.L37:
	ldr	r0, .L38+12
	ldr	r3, .L38+16
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	mov	lr, #23296	@ movhi
	mov	r3, #7616
	mov	r0, #3
	ldr	r1, .L38+20
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r4, .L38+24
	strh	lr, [ip, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L38+28
	add	r2, r2, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	mute
	.word	Tuxedo
	.word	playSoundA
	.word	instrucPal
	.word	loadPalette
	.word	instrucTiles
	.word	DMANow
	.word	instrucMap
	.size	initInstruc, .-initInstruc
	.align	2
	.global	initPause
	.type	initPause, %function
initPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L42
	stmfd	sp!, {r4, lr}
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L41
	mov	r1, #173056
	mov	r2, #11008
	ldr	r0, .L42+4
	sub	r1, r1, #61
	add	r2, r2, #17
	ldr	r3, .L42+8
	mov	lr, pc
	bx	r3
.L41:
	ldr	r0, .L42+12
	ldr	r3, .L42+16
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	mov	lr, #256	@ movhi
	strh	lr, [ip, #0]	@ movhi
	mov	r3, #7040
	mov	lr, #23296	@ movhi
	mov	r0, #3
	ldr	r1, .L42+20
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r4, .L42+24
	strh	lr, [ip, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L42+28
	add	r2, r2, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	mute
	.word	Tuxedo
	.word	playSoundA
	.word	pausePal
	.word	loadPalette
	.word	pauseTiles
	.word	DMANow
	.word	pauseMap
	.size	initPause, .-initPause
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r2, #256	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	mov	r2, #23296	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L46
	ldr	r3, .L46+4
	mov	lr, pc
	bx	r3
	mov	r3, #7168
	mov	r0, #3
	ldr	r1, .L46+8
	mov	r2, #100663296
	add	r3, r3, #48
	ldr	r5, .L46+12
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L46+16
	add	r2, r2, #55296
	mov	lr, pc
	bx	r5
	ldr	r3, .L46+20
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L45
	mov	r1, #225280
	mov	r2, #11008
	ldr	r0, .L46+24
	add	r1, r1, #29
	add	r2, r2, #17
	ldr	r3, .L46+28
	mov	lr, pc
	bx	r3
.L45:
	ldr	r6, .L46+32
	ldr	r4, .L46+36
	mov	lr, #0
	ldr	ip, .L46+40
	mov	r3, #67108864
	ldr	r7, [r3, #304]
	strb	lr, [r6, #0]
	ldr	r6, .L46+44
	mov	r1, ip
	str	ip, [r4, #0]
	mov	ip, #512
	str	r7, [r6, #0]
	str	ip, [r4, #4]
	ldr	r6, .L46+48
	ldr	ip, .L46+52
	mov	r2, #83886080
	str	lr, [r6, #0]
	str	ip, [r4, #8]
	mov	r0, #3
	mov	ip, #32768
	add	r2, r2, #512
	mov	r3, #256
	str	ip, [r4, #12]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #12]
	mov	r2, #100663296
	add	r3, r3, r3, lsr #31
	mov	r0, #3
	ldr	r1, [r4, #8]
	add	r2, r2, #65536
	mov	r3, r3, asr #1
	mov	lr, pc
	bx	r5
	ldr	r3, .L46+56
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	splashPal
	.word	loadPalette
	.word	splashTiles
	.word	DMANow
	.word	splashMap
	.word	mute
	.word	SailorMoon
	.word	playSoundA
	.word	state
	.word	currentSSheet
	.word	sailormoonSpritesPal
	.word	buttons
	.word	character
	.word	sailormoonSpritesTiles
	.word	hideSprites
	.size	initialize, .-initialize
	.align	2
	.global	instruc
	.type	instruc, %function
instruc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L53
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L49
	ldr	r2, .L53+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L51
.L49:
	tst	r3, #4
	beq	.L48
	ldr	r3, .L53+4
	ldr	r3, [r3, #0]
	ands	r3, r3, #4
	beq	.L52
.L48:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L52:
	ldr	r2, .L53+8
	strb	r3, [r2, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	initialize
.L51:
	ldr	r3, .L53+8
	mov	r2, #5
	strb	r2, [r3, #0]
	mov	r1, #4352	@ movhi
	mov	r3, #67108864
	strh	r1, [r3, #0]	@ movhi
	ldr	r0, .L53+12
	ldr	r3, .L53+16
	mov	lr, pc
	bx	r3
	mov	r3, #7040
	mov	r0, #3
	ldr	r1, .L53+20
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r5, .L53+24
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	ldr	r1, .L53+28
	add	r2, r2, #55296
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L53+32
	mov	r1, #50	@ movhi
	mvn	r3, #32512
	sub	r3, r3, #195
	strh	r1, [r2, #0]	@ movhi
	mov	r1, #25	@ movhi
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	ldr	r3, [r4, #0]
	b	.L49
.L54:
	.align	2
.L53:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	charSelectPal
	.word	loadPalette
	.word	charSelectTiles
	.word	DMANow
	.word	charSelectMap
	.word	shadowOAM
	.size	instruc, .-instruc
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L58
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L55
	ldr	r3, .L58+4
	ldr	r3, [r3, #0]
	ands	r4, r3, #8
	beq	.L57
.L55:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L57:
	ldr	r3, .L58+8
	mov	lr, pc
	bx	r3
	ldr	r2, .L58+12
	mov	r3, #67108864
	mvn	r1, #0
	strh	r4, [r3, #16]	@ movhi
	str	r1, [r2, #0]
	strh	r4, [r3, #18]	@ movhi
	ldr	r3, .L58+16
	strb	r4, [r3, #0]
	ldmfd	sp!, {r4, lr}
	b	initialize
.L59:
	.align	2
.L58:
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	.LANCHOR0
	.word	state
	.size	lose, .-lose
	.align	2
	.global	initLose
	.type	initLose, %function
initLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #256	@ movhi
	stmfd	sp!, {r4, lr}
	strh	r2, [r3, #0]	@ movhi
	mov	r2, #23296	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L62
	ldr	r3, .L62+4
	mov	lr, pc
	bx	r3
	mov	r3, #9536
	mov	r0, #3
	ldr	r1, .L62+8
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r4, .L62+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L62+16
	add	r2, r2, #55296
	mov	lr, pc
	bx	r4
	ldr	r3, .L62+20
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L61
	mov	r1, #138240
	mov	r2, #11008
	ldr	r0, .L62+24
	add	r1, r1, #110
	add	r2, r2, #17
	ldr	r3, .L62+28
	mov	lr, pc
	bx	r3
.L61:
	ldr	r3, .L62+32
	mov	r2, #2
	strb	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	losePal
	.word	loadPalette
	.word	loseTiles
	.word	DMANow
	.word	loseMap
	.word	mute
	.word	Game_Over
	.word	playSoundA
	.word	state
	.size	initLose, .-initLose
	.align	2
	.global	initWin
	.type	initWin, %function
initWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #256	@ movhi
	stmfd	sp!, {r4, lr}
	strh	r2, [r3, #0]	@ movhi
	mov	r2, #23296	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L66
	ldr	r3, .L66+4
	mov	lr, pc
	bx	r3
	mov	r3, #6272
	mov	r0, #3
	ldr	r1, .L66+8
	mov	r2, #100663296
	add	r3, r3, #48
	ldr	r4, .L66+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L66+16
	add	r2, r2, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L66+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+24
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L65
	mov	r1, #50176
	mov	r2, #11008
	ldr	r0, .L66+28
	sub	r1, r1, #81
	add	r2, r2, #17
	ldr	r3, .L66+32
	mov	lr, pc
	bx	r3
.L65:
	ldr	r3, .L66+36
	mov	r2, #2
	strb	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	winPal
	.word	loadPalette
	.word	winTiles
	.word	DMANow
	.word	winMap
	.word	stopSound
	.word	mute
	.word	Victory
	.word	playSoundB
	.word	state
	.size	initWin, .-initWin
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bl	sortSprites
	ldr	r0, .L88
	ldr	r3, .L88+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L88
	ldr	r3, .L88+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L88+12
	ldr	r7, .L88
	ldr	r6, .L88+16
	mov	r4, #0
.L69:
	rsb	r0, r4, r4, asl #4
	add	r0, r5, r0, asl #2
	ldr	r1, .L88
	add	r4, r4, #1
	mov	lr, pc
	bx	r6
	cmp	r4, #5
	bne	.L69
	ldr	r4, .L88+20
	ldr	r3, [r4, #0]
	cmp	r3, #2
	beq	.L85
.L70:
	ldr	sl, .L88+24
	ldr	r8, .L88+28
	mov	r6, #0
.L71:
	rsb	r0, r6, r6, asl #4
	add	r0, sl, r0, asl #2
	add	r6, r6, #1
	mov	lr, pc
	bx	r8
	cmp	r6, #5
	bne	.L71
	ldr	r3, .L88+32
	ldr	r0, .L88+36
	mov	lr, pc
	bx	r3
	ldr	r3, [r7, #20]
	cmp	r3, #9
	bgt	.L84
	ldr	r8, .L88+40
	ldr	r6, .L88+44
.L72:
	ldr	r3, [r7, #4]
	cmp	r3, #239
	bgt	.L73
	ldr	r3, [r8, #0]
	ldr	r2, [r6, #0]
	add	ip, r3, r3, lsr #31
	add	r0, r2, r2, lsr #31
	mov	ip, ip, asl #15
	mov	r0, r0, asl #15
	mov	r3, r3, asl #16
	mov	r2, r2, asl #16
	mov	ip, ip, lsr #16
	mov	r0, r0, lsr #16
	mov	r1, r3, lsr #16
	mov	r2, r2, lsr #16
.L74:
	mov	r3, #67108864
	strh	ip, [r3, #20]	@ movhi
	strh	r0, [r3, #22]	@ movhi
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L73:
	ldr	r3, .L88+48
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L75
	ldr	r1, [r8, #0]
	ldr	r2, [r6, #0]
	add	ip, r1, r1, lsr #31
	add	r0, r2, r2, lsr #31
	mov	ip, ip, asl #15
	mov	r0, r0, asl #15
	mov	r1, r1, asl #16
	mov	r2, r2, asl #16
	mov	ip, ip, lsr #16
	mov	r0, r0, lsr #16
	mov	r1, r1, lsr #16
	mov	r2, r2, lsr #16
	b	.L74
.L84:
	ldr	r8, .L88+40
	ldr	r6, .L88+44
	mov	r3, #0
	str	r3, [r8, #0]
	str	r3, [r6, #0]
	bl	initLose
	b	.L72
.L75:
	ldr	r3, .L88+52
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	add	r3, r3, #1
	cmp	r3, #2
	str	r3, [r4, #0]
	bgt	.L86
.L76:
	ldr	r3, .L88+36
	mov	r9, #0
	strb	r9, [r3, #16]
	bl	stageUpdate
	ldr	r3, [r4, #0]
	cmp	r3, #2
	beq	.L87
	ldr	r3, .L88+12
	mov	r0, #300
	mov	r1, #110
	mvn	sl, #0
	mov	r2, r9
	mov	r5, #20
	mov	r4, #40
	mov	ip, #4
.L79:
	str	r1, [r3, #0]
	add	r1, r1, #2
	cmp	r1, #120
	str	r0, [r3, #4]
	str	sl, [r3, #12]
	str	r2, [r3, #20]
	str	r5, [r3, #24]
	str	r4, [r3, #28]
	strb	r2, [r3, #16]
	str	r2, [r3, #32]
	str	ip, [r3, #36]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #8]
	add	r0, r0, #120
	add	r3, r3, #60
	bne	.L79
.L78:
	ldr	r1, [r7, #24]
	mov	r3, #0
	rsb	r1, r1, #50
	str	r1, [r7, #4]
	mov	r2, r3
	str	r3, [r8, #0]
	str	r3, [r6, #0]
	mov	r1, r3
	mov	r0, r3
	mov	ip, r3
	b	.L74
.L85:
	ldr	r0, .L88+56
	ldr	r1, .L88
	ldr	r3, .L88+60
	mov	lr, pc
	bx	r3
	b	.L70
.L86:
	bl	initWin
	b	.L76
.L87:
	ldr	r2, .L88+56
	mov	r3, #400
	mov	r1, #1
	strb	r1, [r2, #16]
	str	r3, [r5, #4]
	str	r3, [r5, #64]
	str	r3, [r5, #124]
	str	r3, [r5, #184]
	str	r3, [r5, #244]
	b	.L78
.L89:
	.align	2
.L88:
	.word	player
	.word	updateStats
	.word	updatePlayer
	.word	ninja
	.word	updateBadies
	.word	stage
	.word	bul
	.word	updateBullet
	.word	updatePowerUps
	.word	powerUp
	.word	hOff
	.word	vOff
	.word	allNinjasDead
	.word	hideSprites
	.word	boss
	.word	updateBoss
	.size	game, .-game
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L97
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L91
	ldr	r2, .L97+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L94
.L91:
	tst	r3, #4
	beq	.L90
	ldr	r3, .L97+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L95
.L90:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L94:
	ldr	r3, .L97+8
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L96
.L92:
	ldr	r3, .L97+12
	mov	r2, #5
	strb	r2, [r3, #0]
	mov	r1, #4352	@ movhi
	mov	r3, #67108864
	strh	r1, [r3, #0]	@ movhi
	ldr	r0, .L97+16
	ldr	r3, .L97+20
	mov	lr, pc
	bx	r3
	mov	r3, #7040
	mov	r0, #3
	ldr	r1, .L97+24
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r5, .L97+28
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	ldr	r1, .L97+32
	add	r2, r2, #55296
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L97+36
	mov	r1, #50	@ movhi
	mvn	r3, #32512
	sub	r3, r3, #195
	strh	r1, [r2, #0]	@ movhi
	mov	r1, #25	@ movhi
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	ldr	r3, [r4, #0]
	b	.L91
.L95:
	ldr	r3, .L97+12
	mov	r2, #4
	strb	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	initInstruc
.L96:
	mov	r1, #173056
	mov	r2, #11008
	ldr	r0, .L97+40
	sub	r1, r1, #61
	add	r2, r2, #17
	ldr	r3, .L97+44
	mov	lr, pc
	bx	r3
	b	.L92
.L98:
	.align	2
.L97:
	.word	oldButtons
	.word	buttons
	.word	mute
	.word	state
	.word	charSelectPal
	.word	loadPalette
	.word	charSelectTiles
	.word	DMANow
	.word	charSelectMap
	.word	shadowOAM
	.word	Tuxedo
	.word	playSoundA
	.size	splash, .-splash
	.align	2
	.global	loadChar
	.type	loadChar, %function
loadChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L119
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L110
	cmp	r3, #1
	beq	.L111
	cmp	r3, #2
	beq	.L112
	cmp	r3, #3
	beq	.L113
	cmp	r3, #4
	beq	.L114
	cmp	r3, #5
	beq	.L115
	cmp	r3, #6
	beq	.L116
	cmp	r3, #7
	beq	.L117
	cmp	r3, #8
	beq	.L118
	ldr	r4, .L119+4
	mov	r3, #512
	str	r3, [r4, #4]
	ldr	r3, .L119+8
	ldr	r1, .L119+12
	str	r3, [r4, #8]
	mov	r3, #32768
	str	r1, [r4, #0]
	str	r3, [r4, #12]
	b	.L101
.L110:
	ldr	r4, .L119+4
	mov	r3, #512
	str	r3, [r4, #4]
	ldr	r3, .L119+16
	ldr	r1, .L119+20
	str	r3, [r4, #8]
	mov	r3, #32768
	str	r1, [r4, #0]
	str	r3, [r4, #12]
.L101:
	mov	r2, #83886080
	mov	r0, #3
	add	r2, r2, #512
	mov	r3, #256
	ldr	r5, .L119+24
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #12]
	mov	r2, #100663296
	add	r3, r3, r3, lsr #31
	mov	r0, #3
	ldr	r1, [r4, #8]
	add	r2, r2, #65536
	mov	r3, r3, asr #1
	mov	lr, pc
	bx	r5
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L111:
	ldr	r4, .L119+4
	mov	r3, #512
	str	r3, [r4, #4]
	ldr	r3, .L119+28
	ldr	r1, .L119+32
	str	r3, [r4, #8]
	mov	r3, #32768
	str	r1, [r4, #0]
	str	r3, [r4, #12]
	b	.L101
.L112:
	ldr	r4, .L119+4
	mov	r3, #512
	str	r3, [r4, #4]
	ldr	r3, .L119+36
	ldr	r1, .L119+40
	str	r3, [r4, #8]
	mov	r3, #32768
	str	r1, [r4, #0]
	str	r3, [r4, #12]
	b	.L101
.L113:
	ldr	r4, .L119+4
	mov	r3, #512
	str	r3, [r4, #4]
	ldr	r3, .L119+44
	ldr	r1, .L119+48
	str	r3, [r4, #8]
	mov	r3, #32768
	str	r1, [r4, #0]
	str	r3, [r4, #12]
	b	.L101
.L114:
	ldr	r4, .L119+4
	mov	r3, #512
	str	r3, [r4, #4]
	ldr	r3, .L119+52
	ldr	r1, .L119+56
	str	r3, [r4, #8]
	mov	r3, #32768
	str	r1, [r4, #0]
	str	r3, [r4, #12]
	b	.L101
.L115:
	ldr	r4, .L119+4
	mov	r3, #512
	str	r3, [r4, #4]
	ldr	r3, .L119+60
	ldr	r1, .L119+64
	str	r3, [r4, #8]
	mov	r3, #32768
	str	r1, [r4, #0]
	str	r3, [r4, #12]
	b	.L101
.L116:
	ldr	r4, .L119+4
	mov	r3, #512
	str	r3, [r4, #4]
	ldr	r3, .L119+68
	ldr	r1, .L119+72
	str	r3, [r4, #8]
	mov	r3, #32768
	str	r1, [r4, #0]
	str	r3, [r4, #12]
	b	.L101
.L117:
	ldr	r4, .L119+4
	mov	r3, #512
	str	r3, [r4, #4]
	ldr	r3, .L119+76
	ldr	r1, .L119+80
	str	r3, [r4, #8]
	mov	r3, #32768
	str	r1, [r4, #0]
	str	r3, [r4, #12]
	b	.L101
.L118:
	ldr	r4, .L119+4
	mov	r3, #512
	str	r3, [r4, #4]
	ldr	r3, .L119+84
	ldr	r1, .L119+88
	str	r3, [r4, #8]
	mov	r3, #32768
	str	r1, [r4, #0]
	str	r3, [r4, #12]
	b	.L101
.L120:
	.align	2
.L119:
	.word	character
	.word	currentSSheet
	.word	usaSpritesTiles
	.word	usaSpritesPal
	.word	sailormoonSpritesTiles
	.word	sailormoonSpritesPal
	.word	DMANow
	.word	mercurySpritesTiles
	.word	mercurySpritesPal
	.word	venusSpritesTiles
	.word	venusSpritesPal
	.word	marsSpritesTiles
	.word	marsSpritesPal
	.word	JupiterSpritesTiles
	.word	JupiterSpritesPal
	.word	uranusSpritesTiles
	.word	uranusSpritesPal
	.word	neptuneSpritesTiles
	.word	neptuneSpritesPal
	.word	plutoSpritesTiles
	.word	plutoSpritesPal
	.word	saturnSpritesTiles
	.word	saturnSpritesPal
	.size	loadChar, .-loadChar
	.align	2
	.global	charSelect
	.type	charSelect, %function
charSelect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L129
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L122
	ldr	r2, .L129+4
	ldr	r6, [r2, #0]
	ands	r6, r6, #8
	beq	.L127
.L122:
	tst	r3, #16
	beq	.L123
	ldr	r2, .L129+4
	ldr	r2, [r2, #0]
	ands	r2, r2, #16
	beq	.L128
.L123:
	tst	r3, #32
	beq	.L121
	ldr	r3, .L129+4
	ldr	r3, [r3, #0]
	tst	r3, #32
	bne	.L121
	ldr	r3, .L129+8
	ldr	r2, [r3, #0]
	sub	r2, r2, #1
	cmn	r2, #1
	str	r2, [r3, #0]
	moveq	r2, #9
	streq	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	loadChar
.L121:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L128:
	ldr	r3, .L129+8
	ldr	r1, [r3, #0]
	cmp	r1, #9
	addne	r1, r1, #1
	moveq	r1, r2
	str	r1, [r3, #0]
	bl	loadChar
	ldr	r3, [r4, #0]
	b	.L123
.L127:
	mov	r3, #67108864
	mov	r1, #23296	@ movhi
	mov	r2, #7680
	strh	r1, [r3, #10]	@ movhi
	add	r2, r2, #8
	mov	r1, #768	@ movhi
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L129+12
	ldr	r3, .L129+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L129+20
	mov	r0, #3
	ldr	r1, .L129+24
	mov	r2, #100663296
	mov	r3, #2000
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L129+28
	add	r2, r2, #55296
	mov	r3, #2048
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #5056
	mov	r0, #3
	ldr	r1, .L129+32
	add	r2, r2, #32768
	add	r3, r3, #16
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L129+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L129+40
	str	r6, [r3, #0]
	ldr	r3, .L129+44
	mov	r2, #7
	strb	r2, [r3, #0]
	ldr	r3, [r4, #0]
	b	.L122
.L130:
	.align	2
.L129:
	.word	oldButtons
	.word	buttons
	.word	character
	.word	BG512x512Pal
	.word	loadPalette
	.word	DMANow
	.word	BG512x512Tiles
	.word	BG512x512Map
	.word	cutScene1Tiles
	.word	cutScene1Map
	.word	cut
	.word	state
	.size	charSelect, .-charSelect
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r5, .L141
	ldr	r2, [r5, #0]
	mov	r4, #67108864
	mov	r3, #7680
	cmp	r2, #0
	mov	r2, #23296	@ movhi
	strh	r2, [r4, #10]	@ movhi
	add	r3, r3, #8
	mov	r2, #4864	@ movhi
	strh	r2, [r4, #0]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	blt	.L132
	ldr	r3, .L141+4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r4, .L141+8
	ldreq	r4, .L141+8
	beq	.L133
.L134:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	bne	.L137
	ldr	r0, .L141+12
	ldr	r3, .L141+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L141+20
	mov	r0, #3
	ldr	r1, .L141+24
	mov	r2, #100663296
	mov	r3, #2000
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L141+28
	add	r2, r2, #55296
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r3, #5056
	mov	r0, #3
	ldr	r1, .L141+32
	add	r2, r2, #32768
	add	r3, r3, #16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L141+36
	add	r2, r2, #61440
	mov	r3, #2048
	mov	lr, pc
	bx	r4
.L137:
	ldr	r3, .L141+40
	mov	r2, #32768
	strh	r2, [r3, #146]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #144]	@ movhi
	mov	r2, #25	@ movhi
	strh	r2, [r3, #148]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L132:
	ldr	r3, .L141+44
	ldr	r0, .L141+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L141+52
	mov	lr, pc
	bx	r3
	ldr	r2, .L141+56
	ldr	ip, .L141+60
	ldr	sl, [r4, #304]
	mov	r4, #32
	str	r4, [r2, #24]
	str	r4, [ip, #28]
	mov	r4, #115
	str	r4, [ip, #0]
	mov	r4, #176
	mov	r3, #0
	mov	r6, #64
	str	r4, [ip, #4]
	mov	r4, #80
	str	r6, [ip, #24]
	str	r3, [ip, #20]
	str	r3, [ip, #32]
	str	r3, [ip, #48]
	str	r3, [ip, #36]
	str	r3, [ip, #52]
	str	r4, [ip, #44]
	strb	r3, [ip, #16]
	ldr	ip, .L141+64
	str	sl, [ip, #0]
	ldr	ip, .L141+68
	mov	r8, #1
	str	r3, [ip, #0]
	ldr	r9, .L141+4
	ldr	ip, .L141+72
	str	r8, [r2, #8]
	str	r8, [r2, #12]
	ldr	r8, .L141+76
	str	r3, [ip, #0]
	ldr	lr, .L141+80
	strb	r3, [r9, #0]
	ldr	ip, .L141+84
	ldr	r7, .L141+88
	mov	r9, #10
	mov	r1, r3
	mov	r0, #110
	str	r9, [r8, #0]
	mov	r8, #18
	str	r6, [r2, #28]
	str	r3, [r2, #20]
	str	r8, [r2, #4]
	str	r3, [r2, #32]
	str	r3, [r2, #48]
	str	r3, [r2, #36]
	str	r3, [r2, #52]
	str	r3, [r2, #44]
	str	r3, [r5, #0]
	str	r3, [ip, #0]
	str	r0, [r2, #0]
	str	r2, [lr, #0]
	mov	r3, r7
	mov	r4, lr
	mov	ip, #300
	mvn	r5, #0
	mov	r2, r1
	mov	sl, #20
	mov	r8, #40
	mov	r6, #4
.L135:
	add	r1, r1, #1
	sub	lr, r1, #1
	rsb	lr, lr, lr, asl #4
	add	lr, r7, lr, asl #2
	cmp	r1, #5
	stmia	r3, {r0, ip}	@ phole stm
	str	r5, [r3, #12]
	str	r2, [r3, #20]
	str	sl, [r3, #24]
	str	r8, [r3, #28]
	strb	r2, [r3, #16]
	str	r2, [r3, #32]
	str	r6, [r3, #36]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #8]
	str	r1, [r3, #44]
	add	r0, r0, #2
	str	lr, [r4, #4]!
	add	r3, r3, #60
	add	ip, ip, #120
	bne	.L135
	ldr	r3, .L141+92
	mov	r0, r2
	str	r2, [r3, #0]
	ldr	r3, .L141+96
	ldr	r2, .L141+100
	mov	r1, #8
	mov	r7, r0
	mov	sl, #115
	mov	r4, #1
	mov	lr, #16
	mov	r9, #2
.L136:
	str	r1, [r3, #44]
	add	r8, r1, #92
	add	r1, r1, #1
	mov	ip, #0
	cmp	r1, #13
	str	r0, [r2, #-16]
	strb	r7, [r3, #16]
	str	sl, [r3, #0]
	str	r4, [r3, #12]
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	r7, [r3, #32]
	str	r6, [r3, #36]
	str	r9, [r3, #48]
	strb	ip, [r2, #0]
	stmdb	r2, {r4, r5}	@ phole stm
	str	r8, [r2, #28]
	add	r3, r3, #60
	add	r2, r2, #60
	sub	r0, r0, #10
	bne	.L136
	ldr	r3, .L141+104
	mov	r2, #50
	str	r2, [r3, #0]
	mov	r2, #240
	str	r2, [r3, #4]
	mov	r2, #19
	str	r2, [r3, #48]
	mov	r2, #20
	ldr	r4, .L141+8
	strb	ip, [r3, #16]
	str	r5, [r3, #12]
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	r6, [r3, #36]
	str	r2, [r3, #44]
	ldr	r3, .L141+108
	str	ip, [r4, #0]
	str	ip, [r3, #0]
.L133:
	ldr	r5, .L141+112
	ldr	r3, [r5, #4]
	mov	r2, #83886080
	add	r3, r3, r3, lsr #31
	ldr	r1, [r5, #0]
	ldr	r6, .L141+20
	mov	r0, #3
	add	r2, r2, #512
	mov	r3, r3, asr #1
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #12]
	mov	r2, #100663296
	add	r3, r3, r3, lsr #31
	mov	r0, #3
	ldr	r1, [r5, #8]
	add	r2, r2, #65536
	mov	r3, r3, asr #1
	mov	lr, pc
	bx	r6
	ldr	r3, .L141+116
	mov	lr, pc
	bx	r3
	b	.L134
.L142:
	.align	2
.L141:
	.word	.LANCHOR0
	.word	cheat
	.word	stage
	.word	BG512x512Pal
	.word	loadPalette
	.word	DMANow
	.word	BG512x512Tiles
	.word	BG512x512Map
	.word	bg2Tiles
	.word	bg2Map
	.word	shadowOAM
	.word	time
	.word	t
	.word	srand
	.word	player
	.word	boss
	.word	buttons
	.word	hOff
	.word	vOff
	.word	power
	.word	sprites
	.word	goingUp
	.word	ninja
	.word	countShots
	.word	bul
	.word	bossBul+16
	.word	powerUp
	.word	powerTime
	.word	currentSSheet
	.word	hideSprites
	.size	initGame, .-initGame
	.align	2
	.global	cutScene
	.type	cutScene, %function
cutScene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L153
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L150
	ldr	r3, .L153+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L146
.L150:
	ldr	r3, .L153+8
	ldr	r3, [r3, #0]
.L145:
	cmp	r3, #1
	ble	.L151
.L147:
	bl	initGame
	ldr	r3, .L153+12
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L152
.L149:
	ldr	r3, .L153+16
	mov	r2, #1
	strb	r2, [r3, #0]
.L143:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L146:
	ldr	r5, .L153+8
	ldr	r3, [r5, #0]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r5, #0]
	bne	.L145
	ldr	r0, .L153+20
	ldr	r3, .L153+24
	mov	lr, pc
	bx	r3
	ldr	r6, .L153+28
	mov	r0, #3
	ldr	r1, .L153+32
	mov	r2, #100663296
	mov	r3, #2000
	mov	lr, pc
	bx	r6
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L153+36
	add	r2, r2, #55296
	mov	r3, #2048
	mov	lr, pc
	bx	r6
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L153+40
	add	r2, r2, #32768
	mov	r3, #3968
	mov	lr, pc
	bx	r6
	mov	r2, #100663296
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L153+44
	add	r2, r2, #61440
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #0]
	b	.L145
.L152:
	mov	r1, #1409024
	mov	r2, #11008
	ldr	r0, .L153+48
	add	r1, r1, #3072
	add	r2, r2, #17
	ldr	r3, .L153+52
	mov	lr, pc
	bx	r3
	b	.L149
.L151:
	ldr	r3, [r4, #0]
	tst	r3, #4
	beq	.L143
	ldr	r3, .L153+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L147
	b	.L143
.L154:
	.align	2
.L153:
	.word	oldButtons
	.word	buttons
	.word	cut
	.word	mute
	.word	state
	.word	BG512x512Pal
	.word	loadPalette
	.word	DMANow
	.word	BG512x512Tiles
	.word	BG512x512Map
	.word	cutScene2Tiles
	.word	cutScene2Map
	.word	Stage_12
	.word	playSoundA
	.size	cutScene, .-cutScene
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L168
	ldr	r3, [r4, #0]
	mov	r2, #67108864
	mov	r1, #0	@ movhi
	tst	r3, #8
	strh	r1, [r2, #16]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	beq	.L156
	ldr	r2, .L168+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L163
.L156:
	tst	r3, #4
	beq	.L159
	ldr	r2, .L168+4
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L164
.L159:
	tst	r3, #1
	beq	.L155
	ldr	r3, .L168+4
	ldr	r3, [r3, #0]
	ands	r3, r3, #1
	bne	.L155
	ldr	r2, .L168+8
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L165
	mov	r3, #1
	strb	r3, [r2, #0]
	ldr	r3, .L168+12
	mov	lr, pc
	bx	r3
.L155:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L164:
	ldr	r3, .L168+16
	mvn	r2, #0
	str	r2, [r3, #0]
	bl	initGame
	ldr	r3, .L168+8
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L166
.L160:
	ldr	r3, .L168+20
	mov	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, [r4, #0]
	b	.L159
.L163:
	bl	initGame
	bl	stageUpdate
	ldr	r3, .L168+24
	ldr	r3, [r3, #0]
	cmp	r3, #1
	ble	.L167
.L157:
	ldr	r3, .L168+28
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r3, .L168+20
	ldreq	r3, .L168+20
	movne	r2, #6
	moveq	r2, #1
	strneb	r2, [r3, #0]
	streqb	r2, [r3, #0]
	ldrne	r3, [r4, #0]
	ldreq	r3, [r4, #0]
	b	.L156
.L165:
	strb	r3, [r2, #0]
	ldr	r3, .L168+32
	mov	lr, pc
	bx	r3
	b	.L155
.L166:
	mov	r1, #1409024
	mov	r2, #11008
	ldr	r0, .L168+36
	add	r1, r1, #3072
	add	r2, r2, #17
	ldr	r3, .L168+40
	mov	lr, pc
	bx	r3
	b	.L160
.L167:
	ldr	r3, .L168+8
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L157
	mov	r1, #1409024
	mov	r2, #11008
	ldr	r0, .L168+36
	add	r1, r1, #3072
	add	r2, r2, #17
	ldr	r3, .L168+40
	mov	lr, pc
	bx	r3
	b	.L157
.L169:
	.align	2
.L168:
	.word	oldButtons
	.word	buttons
	.word	mute
	.word	pauseSound
	.word	.LANCHOR0
	.word	state
	.word	stage
	.word	cheat
	.word	unpauseSound
	.word	Stage_12
	.word	playSoundA
	.size	pause, .-pause
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L197
	mov	lr, pc
	bx	r3
	ldr	r3, .L197+4
	mov	lr, pc
	bx	r3
	bl	initialize
	ldr	fp, .L197+8
	ldr	r4, .L197+12
	ldr	r7, .L197+16
	ldr	r5, .L197+20
	ldr	sl, .L197+24
	ldr	r9, .L197+28
	ldr	r8, .L197+32
	mov	r6, #67108864
.L192:
	ldr	r2, [r4, #0]
	ldrb	r3, [r7, #0]	@ zero_extendqisi2
.L172:
	ldr	ip, [r6, #304]
	str	r2, [r5, #0]
	str	ip, [r4, #0]
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L189
.L181:
	.word	.L173
	.word	.L174
	.word	.L175
	.word	.L176
	.word	.L177
	.word	.L178
	.word	.L179
	.word	.L180
.L180:
	bl	cutScene
	b	.L192
.L179:
	ldr	r3, [r8, #0]
	add	r3, r3, #1
	tst	r3, #1
	str	r3, [r8, #0]
	bne	.L193
.L186:
	tst	r2, #4
	beq	.L187
	tst	ip, #4
	beq	.L194
.L187:
	tst	r2, #1
	beq	.L188
	tst	ip, #1
	bne	.L188
	ldr	r3, [fp, #52]
	cmp	r3, #0
	ldreq	lr, .L197+8
	moveq	r0, #40
	streq	r0, [lr, #52]
.L188:
	tst	r2, #256
	beq	.L192
	ands	ip, ip, #256
	bne	.L192
	ldr	r1, .L197+36
	mov	lr, #1
	ldr	r3, [r1, #4]
	strb	lr, [r7, #0]
	ldr	lr, .L197+40
	mov	r2, #83886080
	add	r3, r3, r3, lsr #31
	strb	ip, [lr, #0]
	ldr	r1, [r1, #0]
	mov	r3, r3, asr #1
	mov	r0, #3
	add	r2, r2, #512
	mov	lr, pc
	bx	sl
	ldr	r0, .L197+36
	ldr	r3, [r0, #12]
	ldr	ip, .L197+36
	mov	r2, #100663296
	add	r3, r3, r3, lsr #31
	mov	r0, #3
	ldr	r1, [ip, #8]
	add	r2, r2, #65536
	mov	r3, r3, asr #1
	mov	lr, pc
	bx	sl
	b	.L192
.L175:
	bl	lose
	b	.L192
.L177:
	bl	instruc
	b	.L192
.L176:
	bl	pause
	b	.L192
.L178:
	bl	charSelect
	mov	r0, #3
	ldr	r1, .L197+44
	mov	r2, #117440512
	mov	r3, #512
	mov	lr, pc
	bx	sl
	mov	lr, pc
	bx	r9
	b	.L192
.L173:
	bl	splash
	b	.L192
.L189:
	mov	r2, ip
	b	.L172
.L174:
	ldr	r3, [r8, #0]
	add	r3, r3, #1
	tst	r3, #1
	str	r3, [r8, #0]
	bne	.L195
.L183:
	tst	r2, #4
	beq	.L184
	tst	ip, #4
	beq	.L196
.L184:
	tst	r2, #1
	beq	.L185
	tst	ip, #1
	bne	.L185
	ldr	r3, [fp, #52]
	cmp	r3, #0
	ldreq	r0, .L197+8
	moveq	r1, #40
	streq	r1, [r0, #52]
.L185:
	tst	r2, #256
	beq	.L192
	tst	ip, #256
	bne	.L192
	mov	ip, #6
	strb	ip, [r7, #0]
	ldr	ip, .L197+40
	mov	lr, #1
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L197+48
	add	r2, r2, #512
	mov	r3, #256
	strb	lr, [ip, #0]
	mov	lr, pc
	bx	sl
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L197+52
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	sl
	b	.L192
.L195:
	bl	game
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L197+44
	mov	r3, #512
	mov	lr, pc
	bx	sl
	mov	lr, pc
	bx	r9
	ldr	r2, [r5, #0]
	ldr	ip, [r4, #0]
	b	.L183
.L193:
	bl	game
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L197+44
	mov	r3, #512
	mov	lr, pc
	bx	sl
	mov	lr, pc
	bx	r9
	ldr	r2, [r5, #0]
	ldr	ip, [r4, #0]
	b	.L186
.L196:
	mov	r3, #3
	strb	r3, [r7, #0]
	bl	initPause
	ldr	r2, [r5, #0]
	ldr	ip, [r4, #0]
	b	.L184
.L194:
	mov	r3, #3
	strb	r3, [r7, #0]
	bl	initPause
	ldr	r2, [r5, #0]
	ldr	ip, [r4, #0]
	b	.L187
.L198:
	.align	2
.L197:
	.word	setupInterrupts
	.word	setupSounds
	.word	player
	.word	buttons
	.word	state
	.word	oldButtons
	.word	DMANow
	.word	waitForVblank
	.word	.LANCHOR0
	.word	currentSSheet
	.word	cheat
	.word	shadowOAM
	.word	TuxedoSpritesPal
	.word	TuxedoSpritesTiles
	.size	main, .-main
	.global	gameCounter
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	soundA,32,4
	.comm	soundB,32,4
	.comm	scanLineCounter,2,2
	.comm	player,60,4
	.comm	boss,60,4
	.comm	currentSSheet,16,4
	.comm	ninja,300,4
	.comm	sprites,24,4
	.comm	powerUp,60,4
	.comm	bul,300,4
	.comm	state,1,1
	.comm	bossBul,300,4
	.comm	character,4,4
	.comm	stage,4,4
	.comm	cheat,1,1
	.comm	t,4,4
	.comm	mute,1,1
	.comm	cut,4,4
	.comm	shadowOAM,1024,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	gameCounter, %object
	.size	gameCounter, 4
gameCounter:
	.word	-1
	.ident	"GCC: (devkitARM release 31) 4.5.0"

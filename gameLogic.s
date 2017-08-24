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
	.file	"gameLogic.c"
	.text
	.align	2
	.global	ninjaHit
	.type	ninjaHit, %function
ninjaHit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #12]
	cmp	r3, #0
	blt	.L8
	ldr	ip, [r1, #24]
	ldr	r3, [r1, #4]
	ldr	r2, [r0, #4]
	add	r3, ip, r3
	cmp	r3, r2
	blt	.L5
	ldr	r0, [r0, #24]
	add	r0, r2, r0
	cmp	r3, r0
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L5:
	mov	r0, #0
	bx	lr
.L8:
	ldr	r2, [r0, #4]
	ldr	r3, [r1, #4]
	cmp	r3, r2
	movlt	r0, #0
	bxlt	lr
	ldr	r0, [r0, #24]
	add	r0, r2, r0
	cmp	r3, r0
	movgt	r0, #0
	movle	r0, #1
	bx	lr
	.size	ninjaHit, .-ninjaHit
	.align	2
	.global	allNinjasDead
	.type	allNinjasDead, %function
allNinjasDead:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L14
	add	r1, r3, #300
.L11:
	ldrb	r2, [r3, #16]	@ zero_extendqisi2
	cmp	r2, #0
	add	r3, r3, #60
	bne	.L12
	cmp	r3, r1
	bne	.L11
	mov	r0, #1
	bx	lr
.L12:
	mov	r0, #0
	bx	lr
.L15:
	.align	2
.L14:
	.word	ninja
	.size	allNinjasDead, .-allNinjasDead
	.align	2
	.global	move
	.type	move, %function
move:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L37
	str	r4, [sp, #-4]!
	ldr	r3, [r2, #0]
	cmp	r3, #0
	str	r0, [r1, #12]
	ble	.L17
	ldr	ip, [r1, #24]
	ldr	r4, [r1, #4]
	add	ip, ip, ip, lsr #31
	add	ip, r4, ip, asr #1
	cmp	ip, #120
	ble	.L33
.L17:
	cmp	r0, #0
	blt	.L34
.L18:
	cmp	r3, #512
	bge	.L20
	ldr	ip, [r1, #24]
	ldr	r4, [r1, #4]
	add	ip, ip, ip, lsr #31
	add	ip, r4, ip, asr #1
	cmp	ip, #119
	ble	.L20
	ldr	ip, .L37+4
	ldr	ip, [ip, #0]
	cmp	ip, #2
	beq	.L20
.L21:
	ldr	ip, .L37+8
	ldrb	r4, [ip, #16]	@ zero_extendqisi2
	add	r3, r0, r3
	cmp	r4, #0
	str	r3, [r2, #0]
	ldrne	r3, [ip, #4]
	rsbne	r3, r0, r3
	strne	r3, [ip, #4]
	ldr	r3, .L37+12
	add	ip, r3, #300
.L29:
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	cmp	r2, #0
	ldrne	r2, [r3, #-12]
	rsbne	r0, r0, r2
	strne	r0, [r3, #-12]
	add	r3, r3, #60
	ldrne	r0, [r1, #12]
	cmp	r3, ip
	beq	.L35
	ldr	r0, [r1, #12]
	b	.L29
.L20:
	cmp	r0, #0
	ble	.L21
	ldr	r3, [r1, #24]
	ldr	r4, [r1, #4]
	rsb	r3, r3, #240
	cmp	r4, r3
	blt	.L22
	ldr	r3, .L37+16
	add	ip, r3, #300
.L23:
	ldrb	r2, [r3, #16]	@ zero_extendqisi2
	cmp	r2, #0
	add	r3, r3, #60
	bne	.L16
	cmp	r3, ip
	bne	.L23
	ldr	r3, .L37+20
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L16
	cmp	r4, #512
	bgt	.L16
.L22:
	add	r0, r0, r4
	str	r0, [r1, #4]
.L16:
	ldmfd	sp!, {r4}
	bx	lr
.L33:
	ldr	ip, .L37+4
	ldr	ip, [ip, #0]
	cmp	ip, #2
	bne	.L18
	cmp	r0, #0
	bge	.L18
.L34:
	ldr	r3, [r1, #4]
	cmp	r3, #0
	addgt	r0, r0, r3
	strgt	r0, [r1, #4]
	b	.L16
.L35:
	ldr	r4, .L37+16
	mov	r3, #0
	add	r2, r4, r3
	ldr	ip, [r2, #4]
	add	r3, r3, #60
	rsb	r0, r0, ip
	cmp	r3, #300
	str	r0, [r2, #4]
	beq	.L16
.L36:
	add	r2, r4, r3
	ldr	ip, [r2, #4]
	ldr	r0, [r1, #12]
	add	r3, r3, #60
	rsb	r0, r0, ip
	cmp	r3, #300
	str	r0, [r2, #4]
	bne	.L36
	b	.L16
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.word	stage
	.word	powerUp
	.word	bul+16
	.word	ninja
	.word	boss
	.size	move, .-move
	.align	2
	.global	updateBullet
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #12
	ldrb	r3, [r0, #16]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r6, r0
	beq	.L39
	ldr	r1, [r0, #44]
	ldr	fp, [r0, #12]
	ldrb	r3, [r0, #0]	@ zero_extendqisi2
	ldr	r9, .L53
	cmn	fp, #1
	mov	r4, r1, asl #3
	strh	r3, [r9, r4]	@ movhi
	ldreq	r3, [r0, #4]
	ldrne	r3, [r0, #4]
	str	r1, [sp, #4]
	moveq	r1, r3, asl #23
	movne	r1, r3, asl #23
	moveq	r1, r1, lsr #23
	movne	r1, r1, lsr #23
	add	r2, r9, r4
	orreq	r1, r1, #20480
	orrne	r1, r1, #16384
	streqh	r1, [r2, #2]	@ movhi
	strneh	r1, [r2, #2]	@ movhi
	ldr	r2, [r0, #36]
	add	r3, fp, r3
	ldr	ip, [r0, #48]
	add	r2, r2, r2, asl #1
	sub	r0, r3, #1
	cmp	r0, #218
	add	r2, r2, ip, asl #8
	add	r1, r9, r4
	strh	r2, [r1, #4]	@ movhi
	str	r3, [r6, #4]
	movhi	r3, #0
	strhib	r3, [r6, #16]
	ldr	r5, .L53+4
	ldrhi	r3, .L53
	movhi	r2, #512	@ movhi
	strhih	r2, [r3, r4]	@ movhi
	ldrb	r3, [r5, #16]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L51
.L44:
	ldr	sl, .L53+8
	mov	r4, #0
	mov	r5, sl
.L49:
	ldrb	r3, [r5, #16]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L45
	mov	r8, r4, asl #4
	ldr	r3, [r5, #52]
	rsb	r7, r4, r8
	add	r7, sl, r7, asl #2
	cmp	r3, #0
	mov	r0, r7
	mov	r1, r6
	blt	.L45
	bl	ninjaHit
	cmp	r0, #0
	bne	.L52
.L45:
	add	r4, r4, #1
	cmp	r4, #5
	add	r5, r5, #60
	bne	.L49
.L39:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L51:
	mov	r0, r5
	mov	r1, r6
	bl	ninjaHit
	cmp	r0, #0
	beq	.L44
	ldr	r3, [r5, #20]
	add	r3, r3, #6
	str	r3, [r5, #20]
	mov	r3, #0
	strb	r3, [r6, #16]
	mov	r3, #512	@ movhi
	strh	r3, [r9, r4]	@ movhi
	b	.L44
.L52:
	ldr	r2, [r7, #20]
	ldr	r1, [sp, #4]
	add	r2, r2, #1
	mov	r3, r1, asl #3
	str	r2, [r7, #20]
	mov	r1, #0
	mov	r2, #512	@ movhi
	cmp	fp, #0
	strb	r1, [r6, #16]
	strh	r2, [r9, r3]	@ movhi
	ble	.L46
	ldr	r3, [r7, #12]
	cmp	r3, r1
	blt	.L47
.L48:
	rsb	r4, r4, r8
	add	sl, sl, r4, asl #2
	mvn	r3, #0
	str	r3, [sl, #52]
	b	.L39
.L46:
	beq	.L48
	ldr	r3, [r7, #12]
	cmp	r3, #0
	ble	.L48
.L47:
	rsb	r4, r4, r8
	add	sl, sl, r4, asl #2
	mvn	r3, #1
	str	r3, [sl, #52]
	b	.L39
.L54:
	.align	2
.L53:
	.word	shadowOAM
	.word	boss
	.word	ninja
	.size	updateBullet, .-updateBullet
	.align	2
	.global	updateStats
	.type	updateStats, %function
updateStats:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8}
	mov	r2, #0
	ldr	r3, .L89
	mov	ip, #27
	mov	r1, r2
.L58:
	add	r5, r3, r2
	add	r4, r5, #256
	mov	r6, #12	@ movhi
	tst	r1, #1
	add	r5, r5, #260
	strh	r6, [r4, #0]	@ movhi
	mov	r6, #588	@ movhi
	strh	r6, [r5, #0]	@ movhi
	movne	r5, ip, asl #23
	addeq	r5, ip, #5
	movne	r5, r5, lsr #23
	orrne	r5, r5, #4096
	biceq	r5, r5, #65024
	add	ip, ip, #4
	add	r1, r1, #1
	strneh	r5, [r4, #2]	@ movhi
	streqh	r5, [r4, #2]	@ movhi
	mov	ip, ip, asl #16
	cmp	r1, #10
	add	r2, r2, #8
	mov	ip, ip, lsr #16
	bne	.L58
	ldr	r2, [r0, #20]
	cmp	r2, #0
	ble	.L59
	rsb	r2, r2, #42
	ldr	r1, .L89+4
	add	r2, r3, r2, asl #3
.L60:
	mov	ip, #512	@ movhi
	strh	ip, [r2], #8	@ movhi
	cmp	r2, r1
	bne	.L60
.L59:
	ldr	r2, .L89+8
	ldr	r5, [r2, #0]
	cmp	r5, #0
	ble	.L61
	mov	r0, #0
	mov	r8, #588
	ldr	r7, .L89+12
	ldr	r6, .L89+16
	mov	ip, #32
	mov	r2, r0
	add	r8, r8, #1
.L63:
	smull	r1, r4, r6, r2
	mov	r1, r2, asr #31
	rsb	r1, r1, r4, asr #1
	add	r1, r1, r1, asl #2
	rsb	r1, r1, r2
	rsb	r1, r1, r1, asl #4
	add	r1, r7, r1, asl #2
	ldrb	r4, [r1, #16]	@ zero_extendqisi2
	add	r1, ip, #4
	cmp	r4, #0
	add	r2, r2, #1
	mov	r1, r1, asl #16
	bne	.L62
	add	r4, r3, r0
	bic	ip, ip, #65024
	strh	ip, [r4, #170]	@ movhi
	mov	ip, #20	@ movhi
	strh	r8, [r4, #172]	@ movhi
	strh	ip, [r4, #168]	@ movhi
.L62:
	cmp	r2, r5
	add	r0, r0, #8
	mov	ip, r1, lsr #16
	bne	.L63
	cmp	r5, #10
	bgt	.L64
.L61:
	sub	r0, r5, #11
	mov	r0, r0, asl #3
	mov	r2, #0
.L65:
	add	r1, r3, r2
	sub	r2, r2, #8
	mov	r4, #512	@ movhi
	cmp	r2, r0
	strh	r4, [r1, #248]	@ movhi
	bne	.L65
.L64:
	ldr	r2, .L89+20
	ldr	r2, [r2, #0]
	cmp	r2, #2
	ldrne	r4, .L89+24
	beq	.L87
.L66:
	ldrb	r2, [r4, #16]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L70
	ldr	r2, .L89+28
	add	r0, r2, #300
.L71:
	ldrb	r1, [r2, #16]	@ zero_extendqisi2
	cmp	r1, #0
	add	r2, r2, #60
	bne	.L70
	cmp	r2, r0
	bne	.L71
	ldr	r1, .L89+32
	ldr	r2, [r1, #0]
	ldr	r4, .L89+36
	add	r2, r2, #1
	smull	r0, r4, r2, r4
	mov	ip, r2, asr #31
	rsb	r0, ip, r4, asr #5
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	subs	r0, r2, r0, asl #2
	str	r2, [r1, #0]
	beq	.L88
	rsb	ip, ip, r4, asr #4
	add	ip, ip, ip, asl #2
	add	ip, ip, ip, asl #2
	cmp	r2, ip, asl #1
	bne	.L55
	mov	r1, #680
	mvn	r0, #32512
	add	r1, r1, #2
	mov	r2, #12928
	sub	r0, r0, #65
	strh	r0, [r3, r1]	@ movhi
	add	r2, r2, #53
	mov	ip, #680
	mov	r4, #60	@ movhi
	add	r1, r1, #2
	strh	r4, [r3, ip]	@ movhi
	strh	r2, [r3, r1]	@ movhi
	b	.L55
.L70:
	ldr	r0, .L89+32
	ldr	ip, .L89+36
	ldr	r2, [r0, #0]
	smull	r6, ip, r2, ip
	mov	r1, r2, asr #31
	rsb	r1, r1, ip, asr #5
	add	r1, r1, r1, asl #2
	add	r1, r1, r1, asl #2
	subs	r1, r2, r1, asl #2
	moveq	r2, #680
	moveq	ip, #512	@ movhi
	addne	r2, r2, #1
	streqh	ip, [r3, r2]	@ movhi
	streq	r1, [r0, #0]
	strne	r2, [r0, #0]
.L55:
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
.L87:
	ldr	r4, .L89+24
	mov	r5, #12608
	ldr	r0, [r4, #20]
	mov	r1, #0
	mov	r2, #10
	add	r5, r5, #23
.L69:
	cmp	r0, r2
	add	ip, r2, #99
	blt	.L67
	cmp	r0, ip
	addgt	ip, r3, r1
	addle	ip, r3, r1
	addgt	ip, ip, #936
	movgt	r6, #512	@ movhi
	addle	ip, ip, #940
	strgth	r6, [ip, #0]	@ movhi
	strleh	r5, [ip, #0]	@ movhi
.L67:
	add	r2, r2, #10
	cmp	r2, #110
	add	r1, r1, #8
	bne	.L69
	b	.L66
.L88:
	mov	r2, #680
	mov	ip, #512	@ movhi
	strh	ip, [r3, r2]	@ movhi
	str	r0, [r1, #0]
	b	.L55
.L90:
	.align	2
.L89:
	.word	shadowOAM
	.word	shadowOAM+336
	.word	power
	.word	bul
	.word	1717986919
	.word	stage
	.word	boss
	.word	ninja
	.word	.LANCHOR1
	.word	1374389535
	.size	updateStats, .-updateStats
	.align	2
	.global	updatePowerUps
	.type	updatePowerUps, %function
updatePowerUps:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldrb	r3, [r0, #16]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L92
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #12]
	mov	r2, #256
	add	r3, r1, r3
	add	r1, r3, #9
	add	r2, r2, #2
	cmp	r1, r2
	str	r3, [r0, #4]
	bls	.L98
	ldr	r2, .L99
	ldr	r2, [r2, #44]
	cmn	r3, #10
	ldr	r3, .L99+4
	mov	r2, r2, asl #3
	mov	r1, #512	@ movhi
	strh	r1, [r3, r2]	@ movhi
	movlt	r3, #0
	strltb	r3, [r0, #16]
	b	.L91
.L92:
	ldr	r1, .L99+8
	ldr	r3, [r1, #4]
	ldr	r2, .L99+12
	add	r3, r3, #1
	smull	ip, r2, r3, r2
	mov	ip, r3, asr #31
	rsb	r2, ip, r2, asr #5
	rsb	ip, r2, r2, asl #5
	add	r2, r2, ip, asl #2
	cmp	r3, r2, asl #2
	str	r3, [r1, #4]
	ldreq	r3, .L99
	ldrne	r3, .L99
	moveq	r2, #240
	streq	r2, [r3, #4]
	moveq	r2, #1
	ldr	r3, [r3, #44]
	streqb	r2, [r0, #16]
	ldr	r2, .L99+4
	mov	r3, r3, asl #3
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
.L91:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L98:
	ldr	r2, [r0, #36]
	add	r1, r0, #44
	ldmia	r1, {r1, r5}	@ phole ldm
	ldr	ip, .L99+4
	add	r2, r2, r2, asl #1
	mov	r3, r3, asl #23
	ldrb	r4, [r0, #0]	@ zero_extendqisi2
	mov	r1, r1, asl #3
	add	r0, r2, r5, asl #5
	mov	r3, r3, lsr #23
	add	r2, ip, r1
	orr	r3, r3, #16384
	orr	r0, r0, #8192
	strh	r4, [ip, r1]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	b	.L91
.L100:
	.align	2
.L99:
	.word	powerUp
	.word	shadowOAM
	.word	.LANCHOR0
	.word	274877907
	.size	updatePowerUps, .-updatePowerUps
	.align	2
	.global	obtainedPowerUp
	.type	obtainedPowerUp, %function
obtainedPowerUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L108
	str	r4, [sp, #-4]!
	ldrb	r2, [r3, #16]	@ zero_extendqisi2
	cmp	r2, #0
	moveq	r0, r2
	beq	.L102
	ldr	r1, [r3, #4]
	ldr	ip, [r3, #24]
	ldr	r2, [r0, #4]
	add	ip, r1, ip
	sub	r4, ip, #7
	cmp	r4, r2
	ble	.L103
	ldr	r4, [r0, #24]
	sub	ip, ip, #8
	add	r4, r2, r4
	cmp	r4, ip
	blt	.L103
.L107:
	ldr	r1, [r3, #28]
	ldr	r3, [r3, #0]
	ldr	r2, [r0, #0]
	add	r0, r1, r3
	cmp	r2, r0
	movgt	r0, #0
	movle	r0, #1
.L102:
	ldmfd	sp!, {r4}
	bx	lr
.L103:
	cmp	r1, r2
	blt	.L106
	ldr	ip, [r0, #24]
	add	r2, r2, ip
	sub	r2, r2, #7
	cmp	r1, r2
	blt	.L107
.L106:
	mov	r0, #0
	b	.L102
.L109:
	.align	2
.L108:
	.word	powerUp
	.size	obtainedPowerUp, .-obtainedPowerUp
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r2, [r0, #56]
	ldr	r1, [r0, #8]
	ldr	r3, [r0, #0]
	add	r2, r1, r2
	add	r3, r2, r3
	cmp	r3, #109
	str	r3, [r0, #0]
	ldrgt	r3, .L115
	mov	r1, #2
	str	r2, [r0, #56]
	movgt	r2, #0
	strgtb	r2, [r3, #0]
	str	r1, [r0, #48]
	bl	obtainedPowerUp
	cmp	r0, #0
	beq	.L110
	ldr	r3, .L115+4
	ldr	r2, [r3, #0]
	cmp	r2, #8
	addle	r2, r2, #2
	movgt	r2, #10
	strle	r2, [r3, #0]
	strgt	r2, [r3, #0]
	ldr	r2, .L115+8
	mov	r3, #0
	strb	r3, [r2, #16]
	ldr	r2, .L115+12
	str	r3, [r2, #4]
.L110:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L116:
	.align	2
.L115:
	.word	goingUp
	.word	power
	.word	powerUp
	.word	.LANCHOR0
	.size	update, .-update
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r3, [r0, #52]
	sub	r2, r3, #1
	cmp	r2, #38
	mov	r4, r0
	bhi	.L118
	ldr	r2, .L191
	mov	r0, #0
	strb	r0, [r2, #0]
	ldr	r1, [r4, #4]
	mov	r2, #2
	cmp	r1, r0
	str	r2, [r4, #36]
	str	r2, [r4, #48]
	ldr	r2, .L191+4
	subgt	r1, r1, #1
	add	r3, r3, #1
	movgt	r0, r1, asl #23
	strgt	r1, [r4, #4]
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #3
	add	r2, r2, r2, asl #2
	ldrb	r1, [r4, #0]	@ zero_extendqisi2
	str	r3, [r4, #52]
	strle	r0, [r4, #4]
	movgt	r0, r0, lsr #23
	subs	r2, r3, r2, asl #2
	ldr	r3, [r4, #44]
	streq	r2, [r4, #52]
	mvn	r1, r1, asl #17
	ldr	r2, .L191+8
	mvn	r1, r1, lsr #17
	mov	ip, #1
	mov	r3, r3, asl #3
	str	ip, [r4, #12]
	strh	r1, [r2, r3]	@ movhi
	mov	r1, #528
.L170:
	mvn	r0, r0, asl #18
	add	ip, r2, r3
	mvn	r0, r0, lsr #18
	strh	r0, [ip, #2]	@ movhi
.L171:
	add	r3, r2, r3
	strh	r1, [r3, #4]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L118:
	cmp	r3, #0
	blt	.L180
	cmp	r3, #40
	ble	.L126
	ldr	r2, .L191+4
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #2
	add	r2, r2, r2, asl #2
	subs	r2, r3, r2, asl #1
	str	r3, [r0, #52]
	bne	.L179
	ldr	r1, [r0, #48]
	ldr	r3, [r0, #36]
	ldr	r0, [r0, #4]
	add	r1, r3, r1, asl #5
	mov	r1, r1, asl #19
	mov	r0, r0, asl #23
	str	r2, [r4, #52]
	ldr	r5, [r4, #12]
	mov	r1, r1, lsr #16
	mov	r0, r0, lsr #23
.L128:
	ldrb	ip, [r4, #0]	@ zero_extendqisi2
	ldr	r3, [r4, #44]
	ldr	r2, .L191+8
	mvn	ip, ip, asl #17
	mov	r3, r3, asl #3
	mvn	ip, ip, lsr #17
	cmp	r5, #0
	strh	ip, [r2, r3]	@ movhi
	bge	.L170
.L172:
	orr	r0, r0, #-16777216
	orr	r0, r0, #16711680
	add	ip, r2, r3
	orr	r0, r0, #53248
	strh	r0, [ip, #2]	@ movhi
	b	.L171
.L126:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #512
	beq	.L129
	ldr	r5, .L191
	ldrb	r2, [r5, #0]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L176
	cmp	r3, #40
	beq	.L134
	ldr	r2, [r0, #32]
	ldr	r0, .L191+4
	smull	r1, r0, r2, r0
	mov	r1, r2, asr #31
	rsb	r1, r1, r0, asr #3
	add	r1, r1, r1, asl #2
	cmp	r2, r1, asl #2
	mov	r2, #1
	str	r2, [r4, #36]
	bne	.L134
	ldr	r1, [r4, #48]
	add	r1, r1, r2
	mov	r2, r1, asr #31
	mov	r2, r2, lsr #30
	add	r1, r1, r2
	and	r1, r1, #3
	rsb	r2, r2, r1
	str	r2, [r4, #48]
.L134:
	mov	r2, #67108864
	ldr	r1, [r2, #304]
	tst	r1, #32
	bne	.L136
	cmp	r3, #40
	beq	.L136
	ldr	r2, [r2, #304]
	mvn	r2, r2
	ands	r2, r2, #2
	bne	.L136
	str	r2, [r4, #36]
	mvn	r0, #0
	mov	r1, r4
	bl	move
	ldr	r3, [r4, #52]
.L136:
	mov	r2, #67108864
	ldr	r1, [r2, #304]
	tst	r1, #128
	bne	.L137
	cmp	r3, #39
	bgt	.L137
	ldr	r2, [r2, #304]
	mvn	r2, r2
	ands	r2, r2, #2
	bne	.L137
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #0]
	add	r1, r1, r1, lsr #31
	add	r1, r0, r1, asr #1
	cmp	r1, #150
	addle	r0, r0, #1
	str	r2, [r4, #36]
	strle	r0, [r4, #0]
.L137:
	mov	r2, #67108864
	ldr	r1, [r2, #304]
	tst	r1, #64
	bne	.L138
	cmp	r3, #39
	bgt	.L138
	ldr	r2, [r2, #304]
	mvn	r2, r2
	ands	r2, r2, #2
	bne	.L138
	ldr	r1, [r4, #0]
	cmp	r1, #110
	subgt	r1, r1, #1
	str	r2, [r4, #36]
	strgt	r1, [r4, #0]
.L138:
	mov	r2, #67108864
	ldr	r1, [r2, #304]
	tst	r1, #16
	bne	.L139
	cmp	r3, #39
	bgt	.L139
	ldr	r2, [r2, #304]
	mvn	r2, r2
	ands	r2, r2, #2
	bne	.L140
	str	r2, [r4, #36]
	mov	r0, #1
	mov	r1, r4
	bl	move
	ldr	r3, [r4, #52]
.L139:
	cmp	r3, #40
	beq	.L181
.L140:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #2
	bne	.L177
	cmp	r3, #39
	bgt	.L177
	ldr	r8, .L191+12
	ldr	r3, [r8, #0]
	cmp	r3, #0
	ble	.L182
	ldr	r7, .L191+16
	ldr	r6, .L191+4
	ldr	r2, [r7, #0]
	smull	r3, r6, r2, r6
	mov	r3, r2, asr #31
	rsb	r6, r3, r6, asr #3
	add	r6, r6, r6, asl #2
	mov	r3, #2
	mov	r1, #1
	subs	r6, r2, r6, asl #2
	str	r3, [r4, #36]
	str	r1, [r4, #48]
	bne	.L153
	ldr	sl, .L191+20
	mov	r3, sl
.L158:
	ldrb	r1, [r3, #16]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L183
	add	r6, r6, #1
	cmp	r6, #5
	add	r3, r3, #60
	bne	.L158
	mov	r3, #2
.L153:
	add	r2, r2, #1
	str	r2, [r7, #0]
	ldrb	r2, [r5, #0]	@ zero_extendqisi2
	b	.L133
.L180:
	ldr	r3, .L191
	mov	r1, #0
	strb	r1, [r3, #0]
	ldr	r1, [r0, #4]
	mov	r3, #2
	cmp	r1, #209
	str	r3, [r0, #36]
	str	r3, [r4, #48]
	ldr	r3, .L191+4
	mvn	r0, #0
	addle	r1, r1, #1
	str	r0, [r4, #12]
	strle	r1, [r4, #4]
	movle	r0, r1, asl #23
	smull	r1, r3, r2, r3
	mov	r1, r2, asr #31
	rsb	r3, r1, r3, asr #3
	movgt	r0, #210
	add	r3, r3, r3, asl #2
	strgt	r0, [r4, #4]
	ldrb	r1, [r4, #0]	@ zero_extendqisi2
	movle	r0, r0, lsr #23
	subs	r3, r2, r3, asl #2
	str	r2, [r4, #52]
	streq	r3, [r4, #52]
	ldr	r3, [r4, #44]
	ldr	r2, .L191+8
	mvn	r1, r1, asl #17
	mvn	r1, r1, lsr #17
	mov	r3, r3, asl #3
	strh	r1, [r2, r3]	@ movhi
	mov	r1, #528
	b	.L172
.L177:
	ldrb	r2, [r5, #0]	@ zero_extendqisi2
	ldr	r3, [r4, #36]
.L133:
	cmp	r3, #1
	beq	.L184
	cmp	r3, #2
	ldrne	r3, [r4, #32]
	addne	r3, r3, #1
	strne	r3, [r4, #32]
	ldrb	r3, [r5, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L179
.L160:
	ldr	r2, .L191+24
	ldr	r3, [r2, #8]
	add	r3, r3, #1
	cmp	r3, #14
	str	r3, [r2, #8]
	ble	.L179
	tst	r3, #1
	bne	.L185
.L165:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #32
	bne	.L166
	ldr	r2, [r4, #52]
	cmp	r2, #39
	bgt	.L166
	ldr	r3, [r3, #304]
	tst	r3, #2
	bne	.L186
.L166:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #16
	bne	.L179
	ldr	r2, [r4, #52]
	cmp	r2, #39
	bgt	.L179
	ldr	r3, [r3, #304]
	tst	r3, #2
	movne	r0, #1
	movne	r1, r4
	blne	move
.L179:
	ldr	r1, [r4, #48]
	ldr	r3, [r4, #36]
	ldr	r0, [r4, #4]
	add	r1, r3, r1, asl #5
	mov	r1, r1, asl #19
	mov	r0, r0, asl #23
	ldr	r5, [r4, #12]
	mov	r1, r1, lsr #16
	mov	r0, r0, lsr #23
	b	.L128
.L182:
	ldrb	r2, [r5, #0]	@ zero_extendqisi2
.L176:
	ldr	r3, [r4, #36]
	b	.L133
.L129:
	ldr	r5, .L191
	ldrb	r2, [r5, #0]	@ zero_extendqisi2
	cmp	r2, #0
	moveq	r3, #1
	mvneq	r1, #11
	streqb	r3, [r5, #0]
	streq	r1, [r0, #56]
	streq	r3, [r0, #36]
	ldreq	r1, .L191+24
	streq	r3, [r0, #48]
	streq	r2, [r1, #8]
	moveq	r2, r3
	ldr	r3, [r4, #36]
	b	.L133
.L184:
	cmp	r2, #0
	streq	r2, [r4, #48]
	beq	.L179
	b	.L160
.L181:
	ldr	r3, [r4, #36]
	cmp	r3, #2
	beq	.L141
	ldr	r3, .L191+28
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L142
	ldr	r3, .L191+32
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L187
.L141:
	ldr	r6, .L191+36
	ldrb	r3, [r6, #16]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r3, #2
	str	r3, [r4, #36]
	mov	r3, #0
	str	r3, [r4, #48]
	beq	.L143
	mov	r0, r6
	mov	r1, r4
	bl	ninjaHit
	cmp	r0, #0
	ldrne	r3, [r6, #20]
	addne	r3, r3, #6
	strne	r3, [r6, #20]
.L143:
	ldr	sl, .L191+40
	mov	r6, #0
	mov	r7, sl
.L149:
	ldrb	r3, [r7, #16]	@ zero_extendqisi2
	rsb	r8, r6, r6, asl #4
	add	r8, sl, r8, asl #2
	cmp	r3, #0
	mov	r0, r8
	mov	r1, r4
	beq	.L144
	bl	ninjaHit
	cmp	r0, #0
	beq	.L144
	ldr	r3, [r7, #52]
	cmp	r3, #0
	bge	.L188
.L144:
	add	r6, r6, #1
	cmp	r6, #5
	add	r7, r7, #60
	bne	.L149
.L148:
	ldr	r3, [r4, #52]
	add	r3, r3, #1
	str	r3, [r4, #52]
	b	.L140
.L185:
	mov	r0, r4
	bl	update
	b	.L165
.L142:
	ldr	r3, .L191+32
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L141
	mov	r1, #12096
	mov	r2, #22016
	ldr	r0, .L191+44
	add	r1, r1, #24
	add	r2, r2, #34
	ldr	r3, .L191+48
	mov	lr, pc
	bx	r3
	b	.L141
.L186:
	mvn	r0, #0
	mov	r1, r4
	bl	move
	b	.L166
.L187:
	mov	r1, #8320
	mov	r2, #11008
	ldr	r0, .L191+52
	add	r1, r1, #56
	add	r2, r2, #17
	ldr	r3, .L191+48
	mov	lr, pc
	bx	r3
	b	.L141
.L183:
	ldr	r3, .L191+28
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L155
	ldr	r3, .L191+32
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L189
.L156:
	rsb	r6, r6, r6, asl #4
	add	r3, sl, r6, asl #2
	ldr	r2, [r3, #28]
	ldr	r1, [r4, #0]
	add	r9, r2, r2, lsr #31
	mov	r2, #1
	add	r1, r1, r9, asr r2
	ldr	r0, [r8, #0]
	ldr	ip, [r4, #12]
	sub	r0, r0, #1
	cmp	ip, #0
	str	r0, [r8, #0]
	strb	r2, [r3, #16]
	str	r1, [sl, r6, asl #2]
	blt	.L190
	ldr	r1, [r4, #24]
	ldr	r0, [r4, #4]
	add	r1, r1, r1, lsr #31
	add	r1, r0, r1, asr #1
	str	r2, [r3, #12]
	str	r1, [r3, #4]
	ldr	r3, [r4, #36]
	ldr	r2, [r7, #0]
	b	.L153
.L188:
	ldr	r3, [r8, #20]
	ldr	r2, [r4, #12]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r8, #20]
	ble	.L145
	ldr	r3, [r8, #12]
	cmp	r3, #0
	blt	.L146
.L147:
	mov	r3, #60
	mla	r6, r3, r6, sl
	mvn	r3, #0
	str	r3, [r6, #52]
	b	.L148
.L155:
	ldr	r3, .L191+32
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L156
	mov	r1, #4096
	mov	r2, #11008
	ldr	r0, .L191+56
	add	r1, r1, #40
	add	r2, r2, #17
	ldr	r3, .L191+48
	mov	lr, pc
	bx	r3
	b	.L156
.L145:
	beq	.L147
	ldr	r3, [r8, #12]
	cmp	r3, #0
	ble	.L147
.L146:
	mov	r3, #60
	mla	r6, r3, r6, sl
	mvn	r3, #1
	str	r3, [r6, #52]
	b	.L148
.L190:
	ldr	r2, [r4, #4]
	mvn	r1, #0
	str	r1, [r3, #12]
	str	r2, [r3, #4]
	ldr	r3, [r4, #36]
	ldr	r2, [r7, #0]
	b	.L153
.L189:
	add	r1, r1, #10688
	mov	r2, #22016
	ldr	r0, .L191+60
	add	r1, r1, #16
	add	r2, r2, #34
	ldr	r3, .L191+48
	mov	lr, pc
	bx	r3
	b	.L156
.L192:
	.align	2
.L191:
	.word	goingUp
	.word	1717986919
	.word	shadowOAM
	.word	power
	.word	countShots
	.word	bul
	.word	.LANCHOR0
	.word	cheat
	.word	mute
	.word	boss
	.word	ninja
	.word	PUNCH
	.word	playSoundB
	.word	EPUNCH
	.word	PUNCH2
	.word	EPUNCH2
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	enemyTurnAround
	.type	enemyTurnAround, %function
enemyTurnAround:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #12]
	rsb	r3, r3, #0
	str	r3, [r0, #12]
	bx	lr
	.size	enemyTurnAround, .-enemyTurnAround
	.align	2
	.global	hitPlayer
	.type	hitPlayer, %function
hitPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L200
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [r1, #20]
	cmp	r3, #0
	mov	r3, #12
	add	r2, r2, #1
	str	r3, [r0, #36]
	mov	r3, #0
	mov	r5, r1
	mov	r4, r0
	str	r3, [r0, #48]
	str	r2, [r1, #20]
	beq	.L195
	ldr	r3, .L200+4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L199
.L196:
	ldr	r3, [r5, #4]
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r4, #52]
	ble	.L197
	ldr	r2, [r5, #24]
	rsb	r2, r2, #240
	cmp	r3, r2
	blt	.L194
.L197:
	ldr	r3, [r4, #12]
	rsb	r3, r3, #0
	str	r3, [r4, #12]
.L194:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L195:
	ldr	r3, .L200+4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L196
	mov	r1, #11136
	mov	r2, #22016
	ldr	r0, .L200+8
	add	r1, r1, #40
	add	r2, r2, #34
	ldr	r3, .L200+12
	mov	lr, pc
	bx	r3
	b	.L196
.L199:
	mov	r1, #6464
	mov	r2, #11008
	ldr	r0, .L200+16
	add	r1, r1, #16
	add	r2, r2, #17
	ldr	r3, .L200+12
	mov	lr, pc
	bx	r3
	b	.L196
.L201:
	.align	2
.L200:
	.word	cheat
	.word	mute
	.word	HURT
	.word	playSoundB
	.word	EHURT
	.size	hitPlayer, .-hitPlayer
	.align	2
	.global	updateBoss
	.type	updateBoss, %function
updateBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #28
	ldrb	r3, [r0, #16]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r4, r0
	mov	r8, r1
	bne	.L203
	ldr	r3, [r0, #4]
	ldr	r0, [r0, #44]
	ldr	r7, .L227
	mov	r3, r3, asl #23
	ldrb	ip, [r4, #0]	@ zero_extendqisi2
	mov	r2, r0, asl #3
	mvn	r4, r3, lsr #5
	mov	r3, #13184
	add	r1, r7, r2
	mvn	r4, r4, lsr #18
	add	r3, r3, #24
	orr	ip, ip, #16384
	add	r0, r7, r0, asl #3
	strh	r4, [r1, #2]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	mov	r1, #512	@ movhi
	strh	ip, [r7, r2]	@ movhi
	strh	r1, [r0, #8]	@ movhi
.L214:
	mov	r2, #12864
	add	r2, r2, #54
	mov	r6, #0
	ldr	r4, .L227+4
	str	r2, [sp, #8]
	mov	r5, r6
.L204:
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L222
	ldr	r3, [r4, #-8]
	ldr	r1, [r4, #0]
	ldr	r2, [r4, #-4]
	ldr	r0, [r4, #36]
	add	r3, r1, r3
	ldr	ip, [r8, #4]
	mov	r0, r0, asl #3
	mov	sl, r2, asl #23
	and	fp, r3, #255
	add	r1, r7, r0
	str	r3, [r4, #-8]
	mov	sl, sl, lsr #23
	add	r9, r2, #3
	strh	fp, [r7, r0]	@ movhi
	ldr	r0, [sp, #8]
	orr	sl, sl, #16384
	cmp	r9, ip
	strh	sl, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	blt	.L216
	ldr	r0, [r8, #24]
	add	r0, r0, r0, lsr #31
	add	r2, r2, #4
	add	ip, ip, r0, asr #1
	cmp	r2, ip
	bge	.L216
	ldr	r2, [r8, #0]
	add	r0, r3, #3
	cmp	r0, r2
	bge	.L223
.L216:
	cmp	r3, #129
	ble	.L218
	ldr	r3, [r4, #36]
	mov	r1, #0
	mov	r3, r3, asl #3
	mov	r2, #512	@ movhi
	strb	r1, [r4, #8]
	str	r6, [r4, #-8]
	strh	r2, [r7, r3]	@ movhi
.L218:
	add	r5, r5, #1
	cmp	r5, #5
	sub	r6, r6, #10
	add	r4, r4, #60
	bne	.L204
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L226:
	ldr	fp, .L227+8
	rsb	r0, r5, r5, asl #4
	add	r0, fp, r0, asl #2
	mov	r1, r8
	bl	hitPlayer
	mov	ip, #1
	str	ip, [r8, #52]
.L222:
	ldr	r3, [r4, #-8]
	b	.L216
.L203:
	ldr	r0, [r0, #32]
	ldr	r3, .L227+12
	smull	r7, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #3
	add	r3, r3, r3, asl #2
	cmp	r0, r3, asl #2
	ldreq	r3, [r4, #48]
	ldreq	r9, .L227+16
	addeq	r3, r3, #1
	smulleq	fp, r9, r3, r9
	ldr	r5, .L227+20
	subeq	r9, r9, r3, asr #31
	addeq	r9, r9, r9, asl #1
	rsbeq	r9, r9, r3
	ldrb	r3, [r5, #12]	@ zero_extendqisi2
	mov	r6, r3, asr #31
	rsb	ip, r6, #0
	ldr	fp, [r4, #44]
	mov	sl, ip, asl #5
	rsb	sl, ip, sl
	add	fp, fp, #1
	add	sl, ip, sl, asl #2
	ldrb	ip, [r4, #0]	@ zero_extendqisi2
	ldrne	r9, [r4, #48]
	str	fp, [sp, #16]
	str	ip, [sp, #8]
	ldr	ip, [sp, #16]
	streq	r9, [r4, #48]
	ldr	r2, [r4, #24]
	add	r9, r9, r9, asl #2
	ldr	r1, [r4, #4]
	mov	ip, ip, asl #3
	mov	r9, r9, asl #5
	ldr	fp, [r4, #44]
	str	ip, [sp, #16]
	add	r9, r9, #348
	add	r2, r2, r2, lsr #31
	ldr	r7, .L227
	str	r9, [sp, #20]
	add	r2, r1, r2, asr #1
	ldr	r9, [sp, #16]
	mov	fp, fp, asl #3
	add	sl, sl, sl, asl #2
	mov	r1, r1, asl #23
	mov	r2, r2, asl #23
	str	sl, [sp, #12]
	str	fp, [sp, #4]
	add	sl, r7, fp
	add	r0, r0, #1
	add	fp, r7, r9
	mov	r1, r1, lsr #23
	ldr	r9, [sp, #20]
	mov	r2, r2, lsr #23
	str	r0, [r4, #32]
	orr	r1, r1, #-16777216
	ldr	r0, [sp, #12]
	orr	r2, r2, #-16777216
	orr	r9, r9, #12288
	orr	r1, r1, #16711680
	orr	r2, r2, #16711680
	orr	r1, r1, #36864
	orr	r2, r2, #36864
	str	r9, [sp, #20]
	subs	r0, r3, r0, asl #3
	strh	r1, [sl, #2]	@ movhi
	mov	ip, #12416
	str	r0, [sp, #12]
	ldr	r9, [sp, #4]
	ldr	r0, [sp, #8]
	ldr	r1, [sp, #16]
	strh	r2, [fp, #2]	@ movhi
	ldr	r2, [sp, #20]
	add	ip, ip, #60
	strh	r0, [r7, r9]	@ movhi
	strh	ip, [sl, #4]	@ movhi
	strh	r0, [r7, r1]	@ movhi
	strh	r2, [fp, #4]	@ movhi
	bne	.L207
	ldr	r0, .L227+24
	ldr	sl, [sp, #12]
	mov	r2, r0
.L210:
	ldrb	r1, [r2, #16]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L224
	add	sl, sl, #1
	cmp	sl, #5
	add	r2, r2, #60
	bne	.L210
.L207:
	rsb	r6, r6, #0
	add	r6, r6, r6, asl #2
	add	r6, r6, r6, asl #2
	rsb	r6, r6, r6, asl #4
	cmp	r3, r6, asl #4
	bne	.L211
	ldr	r6, .L227+8
	ldr	fp, .L227+28
	add	sl, r6, #300
	mov	r9, #1
.L213:
	ldrb	r3, [r6, #16]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L225
.L212:
	add	r6, r6, #60
	cmp	r6, sl
	bne	.L213
	ldrb	r3, [r5, #12]	@ zero_extendqisi2
.L211:
	add	r3, r3, #1
	strb	r3, [r5, #12]
	ldr	r3, [r4, #20]
	cmp	r3, #200
	movgt	r3, #0
	strgtb	r3, [r4, #16]
	b	.L214
.L223:
	ldr	ip, [r8, #28]
	add	r0, r3, #4
	add	r2, r2, ip
	cmp	r0, r2
	bge	.L216
	ldr	r2, .L227+32
	ldrb	r3, [r2, #0]	@ zero_extendqisi2
	mov	r9, #0
	cmp	r3, #0
	mov	r3, #512	@ movhi
	strh	r3, [r1, #0]	@ movhi
	strb	r9, [r4, #8]
	str	r6, [r4, #-8]
	beq	.L226
	mov	r0, #2
	str	r0, [r8, #36]
	str	r0, [r8, #48]
	mov	r3, r6
	b	.L216
.L225:
	ldr	r3, .L227+36
	strb	r9, [r6, #16]
	mov	lr, pc
	bx	r3
	smull	ip, r2, fp, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #6
	add	r2, r3, r3, asl #1
	rsb	r3, r3, r2, asl #3
	add	r3, r3, r3, asl #2
	sub	r0, r0, r3, asl #1
	str	r0, [r6, #4]
	b	.L212
.L224:
	rsb	sl, sl, sl, asl #4
	add	r6, r0, sl, asl #2
	ldr	r3, .L227+36
	str	r1, [r6, #20]
	mov	lr, pc
	bx	r3
	tst	r0, #1
	ldreqb	r3, [r5, #12]	@ zero_extendqisi2
	moveq	r2, #1
	ldrneb	r3, [r5, #12]	@ zero_extendqisi2
	streq	r2, [r6, #12]
	movne	r2, #245
	mvneq	r2, #59
	streq	r2, [r6, #4]
	strne	r2, [r6, #4]
	moveq	r6, r3, asr #31
	movne	r6, r3, asr #31
	b	.L207
.L228:
	.align	2
.L227:
	.word	shadowOAM
	.word	bossBul+8
	.word	bossBul
	.word	1717986919
	.word	1431655766
	.word	.LANCHOR0
	.word	ninja
	.word	1195121335
	.word	goingUp
	.word	rand
	.size	updateBoss, .-updateBoss
	.align	2
	.global	updateBadies
	.type	updateBadies, %function
updateBadies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r3, .L304
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r4, r0
	mov	r5, r1
	bne	.L230
	ldr	r3, [r0, #4]
	ldr	r0, [r0, #20]
	ldr	r2, [r1, #4]
	mov	r1, r3
.L231:
	rsb	ip, r3, r2
	add	ip, ip, #300
	cmp	ip, #600
	movls	ip, #1
	strlsb	ip, [r4, #16]
	cmp	r0, #19
	bgt	.L234
.L297:
	ldrb	r0, [r4, #16]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L236
	cmp	r3, #0
	bne	.L294
.L237:
	mov	r1, #1
	str	r1, [r4, #12]
.L239:
	ldr	r0, .L304+4
	ldrb	r0, [r0, #0]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L242
	cmp	r1, #0
	ble	.L243
	ldr	ip, [r4, #0]
	ldr	r1, [r5, #0]
	add	r7, r3, #32
	rsb	r7, r2, r7
	rsb	r6, r1, ip
	cmp	r7, #0
	rsblt	r7, r7, #0
	cmp	r6, #0
	rsblt	r6, r6, #0
	cmp	r7, r6
	strge	r0, [r4, #8]
	bge	.L249
	cmp	ip, r1
	movlt	r1, #1
	strlt	r1, [r4, #8]
	blt	.L249
	mvngt	r1, #0
	strgt	r1, [r4, #8]
.L249:
	ldr	r1, [r4, #24]
	add	r0, r2, #5
	add	r1, r3, r1
	cmp	r0, r1
	bge	.L260
	add	r2, r2, #8
	cmp	r1, r2
	bgt	.L260
	ldr	r1, [r5, #0]
	ldr	r2, [r4, #0]
	rsb	r2, r2, r1
	add	r2, r2, #1
	cmp	r2, #2
	bhi	.L260
	ldr	r2, [r5, #52]
	cmp	r2, #0
	bne	.L260
	mov	r0, r4
	mov	r1, r5
	bl	hitPlayer
	ldr	r3, [r5, #52]
	sub	r3, r3, #1
	str	r3, [r5, #52]
	ldr	r3, [r4, #4]
.L260:
	ldr	r2, [r4, #52]
	cmp	r2, #0
	blt	.L295
	sub	r1, r2, #1
	cmp	r1, #38
	bhi	.L263
.L291:
	mov	r1, #-369098752
	add	r1, r1, #958464
	add	r1, r1, #235
	smull	r5, r1, r2, r1
	mov	r0, r2, asr #31
	add	r1, r1, r2
	rsb	r1, r0, r1, asr #5
	add	r1, r1, r1, asl #2
	rsb	r1, r1, r1, asl #3
	subs	r1, r2, r1
	movne	ip, #0
	addne	r2, r2, #1
	movne	r1, #12
	bne	.L285
	ldr	r0, [r4, #12]
	ldr	ip, [r4, #48]
	str	r1, [r4, #52]
	mov	r1, r3
.L253:
	add	r3, r1, #64
	cmp	r3, #304
	bls	.L269
.L303:
	ldr	r3, [r4, #44]
	ldr	r2, .L304+8
	mov	r3, r3, asl #3
	mov	r5, #512	@ movhi
	cmp	r0, #1
	strh	r5, [r2, r3]	@ movhi
	bne	.L272
.L298:
	mov	r1, r1, asl #23
	mov	r1, r1, lsr #23
	orr	r1, r1, #-16777216
	orr	r1, r1, #16711680
	add	r0, r2, r3
	orr	r1, r1, #53248
	strh	r1, [r0, #2]	@ movhi
	b	.L273
.L230:
	ldr	r1, [r1, #24]
	ldr	r3, [r0, #4]
	ldr	r2, [r5, #4]
	add	r1, r1, r1, lsr #31
	rsb	r1, r3, r1, asr #1
	add	r1, r1, r2
	add	r1, r1, #10
	cmp	r1, #20
	mov	r1, r3
	bhi	.L296
	ldr	r0, [r4, #20]
	add	r0, r0, #20
	str	r0, [r4, #20]
.L299:
	rsb	ip, r3, r2
	add	ip, ip, #300
	cmp	ip, #600
	movls	ip, #1
	strlsb	ip, [r4, #16]
	cmp	r0, #19
	ble	.L297
.L234:
	mov	r2, #0
	strb	r2, [r4, #16]
	mov	r2, #12
	str	r2, [r4, #36]
	mov	r2, #3
	str	r2, [r4, #48]
.L236:
	add	r3, r3, #64
	cmp	r3, #304
	bls	.L271
	ldr	r3, [r4, #44]
	ldr	r2, .L304+8
	mov	r0, #512	@ movhi
	mov	r3, r3, asl #3
	strh	r0, [r2, r3]	@ movhi
	ldr	ip, [r4, #48]
	ldr	r0, [r4, #12]
.L270:
	cmp	r0, #1
	beq	.L298
.L272:
	mov	r1, r1, asl #23
	mvn	r1, r1, lsr #5
	add	r0, r2, r3
	mvn	r1, r1, lsr #18
	strh	r1, [r0, #2]	@ movhi
.L273:
	ldr	r1, [r4, #36]
	add	ip, r1, ip, asl #8
	add	r3, r2, r3
	orr	ip, ip, #4096
	strh	ip, [r3, #4]	@ movhi
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L294:
	sub	r1, r2, #60
	cmp	r1, r3
	bgt	.L237
	cmp	r3, #210
	beq	.L240
	add	r1, r2, #70
	cmp	r1, r3
	ldrge	r1, [r4, #12]
	bge	.L239
.L240:
	mvn	r1, #0
	str	r1, [r4, #12]
	b	.L239
.L296:
	ldr	r0, [r0, #24]
	rsb	ip, r3, r2
	add	r0, r0, r0, lsr #31
	sub	r0, ip, r0, asr #1
	add	r0, r0, #10
	cmp	r0, #20
	ldrhi	r0, [r4, #20]
	bhi	.L231
	ldr	r0, [r4, #20]
	add	r0, r0, #20
	str	r0, [r4, #20]
	b	.L299
.L271:
	ldr	r3, [r4, #44]
	ldrb	r0, [r4, #0]	@ zero_extendqisi2
	ldr	r2, .L304+8
	mov	r3, r3, asl #3
	strh	r0, [r2, r3]	@ movhi
	ldr	ip, [r4, #48]
	ldr	r0, [r4, #12]
	b	.L270
.L243:
	ldr	r6, [r4, #0]
	ldr	ip, [r5, #0]
	sub	r8, r3, #32
	rsb	r8, r2, r8
	rsb	r7, ip, r6
	cmp	r8, #0
	rsblt	r8, r8, #0
	cmp	r7, #0
	rsblt	r7, r7, #0
	cmp	r8, r7
	strgt	r0, [r4, #8]
	bgt	.L242
	cmp	r6, ip
	movlt	r0, #1
	strlt	r0, [r4, #8]
	blt	.L242
	mvngt	r0, #0
	strgt	r0, [r4, #8]
.L242:
	cmn	r1, #1
	bne	.L249
	add	r1, r2, #5
	cmp	r1, r3
	bge	.L250
	add	r2, r2, #8
	cmp	r2, r3
	blt	.L250
	ldr	r1, [r5, #0]
	ldr	r2, [r4, #0]
	rsb	r2, r2, r1
	add	r2, r2, #1
	cmp	r2, #2
	bhi	.L250
	ldr	r2, [r5, #52]
	cmp	r2, #0
	bne	.L250
	mov	r0, r4
	mov	r1, r5
	bl	hitPlayer
	ldr	r3, [r5, #52]
	add	r3, r3, #1
	str	r3, [r5, #52]
	ldr	r3, [r4, #4]
.L250:
	ldr	r2, [r4, #52]
	cmp	r2, #0
	blt	.L300
	sub	r1, r2, #1
	cmp	r1, #38
	bls	.L291
	cmp	r2, #39
	bgt	.L293
	ldr	r2, [r4, #32]
	ldr	r0, .L304+12
	smull	r1, r0, r2, r0
	mov	r1, r2, asr #31
	rsb	r1, r1, r0, asr #3
	add	r1, r1, r1, asl #2
	cmp	r2, r1, asl #2
	ldreq	ip, [r4, #48]
	mov	r1, #4
	str	r1, [r4, #36]
	ldreq	r1, .L304+16
	addeq	ip, ip, #1
	smulleq	r0, r1, ip, r1
	ldr	r6, .L304+20
	subeq	r1, r1, ip, asr #31
	addeq	r1, r1, r1, asl #1
	ldr	sl, [r6, #16]
	ldr	r7, [r4, #0]
	rsbeq	ip, r1, ip
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #12]
	ldr	r8, [r4, #8]
	add	sl, r7, sl
	add	sl, sl, r1
	ldr	r6, [r6, #0]
	add	r1, r0, r3
	add	r3, sl, r8
	add	r3, r1, r3, asl #9
	add	r3, r3, r6
	ldr	r6, .L304+24
	mov	r3, r3, asl #1
	ldrh	r6, [r6, r3]
	mov	r3, #32512
	add	r3, r3, #255
	ldrne	ip, [r4, #48]
	streq	ip, [r4, #48]
	add	r2, r2, #1
	cmp	r6, r3
	str	r2, [r4, #32]
	str	r1, [r4, #4]
	beq	.L301
.L259:
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #24]
	rsb	r2, r2, r1
	add	r3, r3, r3, lsr #31
	sub	r3, r2, r3, asr #1
	cmp	r3, #6
	bne	.L253
.L284:
	mov	r3, #40
	str	r3, [r4, #52]
	b	.L253
.L263:
	cmp	r2, #39
	bgt	.L293
	ldr	r2, [r4, #32]
	ldr	r1, .L304+12
	smull	r0, r1, r2, r1
	mov	r0, r2, asr #31
	rsb	r1, r0, r1, asr #3
	add	r1, r1, r1, asl #2
	cmp	r2, r1, asl #2
	ldreq	ip, [r4, #48]
	mov	r1, #4
	str	r1, [r4, #36]
	ldreq	r1, .L304+16
	addeq	ip, ip, #1
	smulleq	r0, r1, ip, r1
	ldr	r6, .L304+20
	subeq	r1, r1, ip, asr #31
	addeq	r1, r1, r1, asl #1
	ldr	sl, [r6, #16]
	ldr	r7, [r4, #0]
	rsbeq	ip, r1, ip
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #12]
	ldr	r8, [r4, #8]
	add	sl, r7, sl
	add	sl, sl, r1
	ldr	r6, [r6, #0]
	add	r1, r0, r3
	add	r3, sl, r8
	add	r3, r1, r3, asl #9
	add	r3, r3, r6
	ldr	r6, .L304+24
	mov	r3, r3, asl #1
	ldrh	r6, [r6, r3]
	mov	r3, #32512
	add	r3, r3, #255
	ldrne	ip, [r4, #48]
	streq	ip, [r4, #48]
	add	r2, r2, #1
	cmp	r6, r3
	str	r2, [r4, #32]
	str	r1, [r4, #4]
	beq	.L302
.L268:
	ldr	r3, [r4, #24]
	ldr	r2, [r5, #4]
	add	r3, r3, r3, lsr #31
	add	r3, r1, r3, asr #1
	rsb	r3, r2, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, #6
	bne	.L253
	b	.L284
.L293:
	ldr	r1, .L304+28
	smull	r0, r1, r2, r1
	mov	r0, r2, asr #31
	add	r1, r1, r2
	rsb	r1, r0, r1, asr #5
	rsb	r1, r1, r1, asl #4
	subs	ip, r2, r1, asl #2
	movne	ip, #3
	addne	r2, r2, #1
	movne	r1, #4
	bne	.L285
	ldr	r0, [r4, #12]
	add	r1, r0, r3
	str	ip, [r4, #52]
	str	r1, [r4, #4]
	ldr	ip, [r4, #48]
	b	.L253
.L285:
	str	r1, [r4, #36]
	mov	r1, r3
	add	r3, r1, #64
	cmp	r3, #304
	str	ip, [r4, #48]
	str	r2, [r4, #52]
	ldr	r0, [r4, #12]
	bhi	.L303
.L269:
	ldrb	r5, [r4, #0]	@ zero_extendqisi2
	ldr	r3, [r4, #44]
	ldr	r2, .L304+8
	mvn	r5, r5, asl #17
	mov	r3, r3, asl #3
	mvn	r5, r5, lsr #17
	strh	r5, [r2, r3]	@ movhi
	b	.L270
.L295:
	cmn	r2, #1
	beq	.L287
	ldr	r5, .L304+12
	sub	r2, r2, #1
	smull	r1, r5, r2, r5
.L289:
	mov	r1, r2, asr #31
	rsb	r5, r1, r5, asr #3
	ldr	r0, [r4, #12]
	add	r5, r5, r5, asl #2
	subs	ip, r2, r5, asl #2
	rsb	r1, r0, r3
	str	r2, [r4, #52]
	mov	r3, #0
	mov	r2, #21
	str	r1, [r4, #4]
	str	r2, [r4, #36]
	str	r3, [r4, #48]
	movne	ip, r3
	streq	ip, [r4, #52]
	b	.L253
.L302:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #64
	beq	.L268
	ldr	r3, [r3, #304]
	tst	r3, #128
	addne	r7, r8, r7
	strne	r7, [r4, #0]
	b	.L268
.L287:
	ldr	r0, [r4, #12]
	rsb	r0, r0, #0
	rsb	r1, r0, r3
	mvn	r3, #1
	mov	ip, #0
	str	r3, [r4, #52]
	mov	r3, #21
	str	r0, [r4, #12]
	str	r1, [r4, #4]
	str	r3, [r4, #36]
	str	ip, [r4, #48]
	b	.L253
.L300:
	cmn	r2, #1
	beq	.L287
	ldr	r5, .L304+12
	sub	r2, r2, #1
	smull	r0, r5, r2, r5
	b	.L289
.L301:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #64
	beq	.L259
	ldr	r3, [r3, #304]
	tst	r3, #128
	addne	r7, r8, r7
	strne	r7, [r4, #0]
	b	.L259
.L305:
	.align	2
.L304:
	.word	cheat
	.word	goingUp
	.word	shadowOAM
	.word	1717986919
	.word	1431655766
	.word	.LANCHOR0
	.word	collisionMapBitmap
	.word	-2004318071
	.size	updateBadies, .-updateBadies
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L309
	mov	r3, #0
.L307:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L307
	bx	lr
.L310:
	.align	2
.L309:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.global	hOff
	.global	vOff
	.global	count
	.global	powerTime
	.global	flashCounter
	.global	release
	.comm	soundA,32,4
	.comm	soundB,32,4
	.comm	scanLineCounter,2,2
	.comm	goingUp,1,1
	.comm	countShots,4,4
	.comm	power,4,4
	.comm	shadowOAM,1024,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	flashCounter, %object
	.size	flashCounter, 4
flashCounter:
	.word	10
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	powerTime, %object
	.size	powerTime, 4
powerTime:
	.space	4
	.type	count, %object
	.size	count, 4
count:
	.space	4
	.type	release, %object
	.size	release, 1
release:
	.space	1
	.space	3
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"

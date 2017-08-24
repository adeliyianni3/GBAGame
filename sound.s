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
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L3+8
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	ip, [r3, #0]
	mov	r8, r0
	mov	r5, #0
	mov	r4, #67108864
	add	ip, ip, #12
	add	r9, r4, #256
	mov	r6, r2
	mov	sl, r1
	add	r2, r4, #160
	mov	r1, r8
	mov	r3, #910163968
	mov	r0, #1
	str	r5, [ip, #8]
	ldr	ip, .L3+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	strh	r5, [r9, #2]	@ movhi
	ldr	r3, .L3+16
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	rsb	r2, r0, #0
	mov	r2, r2, asl #16
	ldr	r4, .L3+20
	mov	r2, r2, lsr #16
	strh	r2, [r9, #0]	@ movhi
	mov	r3, #1
	mov	r2, #128	@ movhi
	str	r8, [r4, #0]
	ldr	r7, .L3+24
	strh	r2, [r9, #2]	@ movhi
	mov	r0, sl
	str	r3, [r4, #12]
	str	r3, [r4, #16]
	str	sl, [r4, #4]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	r7
	adr	r3, .L3
	ldmia	r3, {r2-r3}
	ldr	ip, .L3+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L3+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L3+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L4:
	.align	3
.L3:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L6+8
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	ip, [r3, #0]
	mov	r5, #0
	mov	r8, r0
	mov	r4, #67108864
	add	ip, ip, #24
	add	r9, r4, #256
	mov	r6, r2
	mov	sl, r1
	add	r2, r4, #164
	mov	r1, r8
	mov	r3, #910163968
	mov	r0, #2
	str	r5, [ip, #8]
	ldr	ip, .L6+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	strh	r5, [r9, #6]	@ movhi
	ldr	r3, .L6+16
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L6+20
	mov	r3, r3, lsr #16
	strh	r3, [r9, #4]	@ movhi
	mov	r3, #128	@ movhi
	str	r8, [r4, #0]
	strh	r3, [r9, #6]	@ movhi
	mov	r3, #1
	ldr	r7, .L6+24
	str	r3, [r4, #12]
	mov	r0, sl
	str	sl, [r4, #4]
	str	r6, [r4, #8]
	str	r5, [r4, #16]
	mov	lr, pc
	bx	r7
	adr	r3, .L6
	ldmia	r3, {r2-r3}
	ldr	ip, .L6+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L6+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L6+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L7:
	.align	3
.L6:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	add	r3, r3, #512
	stmfd	sp!, {r4, lr}
	ldrh	r2, [r3, #2]
	tst	r2, #1
	mov	r2, #0	@ movhi
	strh	r2, [r3, #8]	@ movhi
	beq	.L9
	ldr	r4, .L20
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #20]
	cmp	r3, r2
	blt	.L11
	ldr	r2, [r4, #16]
	cmp	r2, #0
	bne	.L17
	ldr	r1, .L20+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #12
	add	r1, r1, #256
	str	r2, [r0, #8]
	strh	r2, [r1, #2]	@ movhi
	str	r2, [r4, #12]
.L11:
	add	r3, r3, #1
	str	r3, [r4, #28]
.L10:
	ldr	r4, .L20+8
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L18
.L13:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L9:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L18:
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #20]
	cmp	r3, r2
	blt	.L14
	ldr	r2, [r4, #16]
	cmp	r2, #0
	bne	.L19
	ldr	r1, .L20+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #24
	add	r1, r1, #256
	str	r2, [r0, #8]
	strh	r2, [r1, #6]	@ movhi
	str	r2, [r4, #12]
.L14:
	add	r3, r3, #1
	str	r3, [r4, #28]
	b	.L13
.L17:
	ldmia	r4, {r0, r1, r2}	@ phole ldm
	bl	playSoundA
	ldr	r3, [r4, #28]
	b	.L11
.L19:
	ldmia	r4, {r0, r1, r2}	@ phole ldm
	bl	playSoundB
	ldr	r3, [r4, #28]
	b	.L14
.L21:
	.align	2
.L20:
	.word	soundA
	.word	dma
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	mov	r3, #0
	add	r2, r2, #256
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	ldr	r2, .L23
	str	r3, [r2, #12]
	ldr	r2, .L23+4
	str	r3, [r2, #12]
	bx	lr
.L24:
	.align	2
.L23:
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	mov	r1, #128
	strh	r1, [r3, #2]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	ldr	r3, .L26
	mov	r2, #1
	str	r2, [r3, #12]
	ldr	r3, .L26+4
	str	r2, [r3, #12]
	bx	lr
.L27:
	.align	2
.L26:
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L29
	ldr	r1, [r3, #0]
	mov	r2, #67108864
	mov	r3, #0
	add	r2, r2, #256
	add	r0, r1, #12
	str	r3, [r0, #8]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	ldr	r2, .L29+4
	add	r1, r1, #24
	str	r3, [r1, #8]
	str	r3, [r2, #12]
	ldr	r2, .L29+8
	str	r3, [r2, #12]
	bx	lr
.L30:
	.align	2
.L29:
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L32
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L33:
	.align	2
.L32:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	soundA,32,4
	.comm	soundB,32,4
	.comm	scanLineCounter,2,2
	.ident	"GCC: (devkitARM release 31) 4.5.0"
	.file	1 "rearrange.c"
	.section .mdebug.eabi32
	.previous
	.section .gcc_compiled_long32
	.previous
	.gnu_attribute 4, 1
	.text
	.align	2
	.globl	compare
	.set	nomips16
	.ent	compare
	.type	compare, @function
compare:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	j	$31
	li	$2,1			# 0x1

	.set	macro
	.set	reorder
	.end	compare
	.size	compare, .-compare
	.align	2
	.globl	exchange
	.set	nomips16
	.ent	exchange
	.type	exchange, @function
exchange:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(buffer)
	addiu	$2,$2,%lo(buffer)
	addu	$4,$2,$4
	lb	$3,0($4)
	addu	$2,$2,$5
	lbu	$5,0($2)
	nop
	sb	$5,0($4)
	sb	$3,0($2)
	j	$31
	li	$2,1			# 0x1

	.set	macro
	.set	reorder
	.end	exchange
	.size	exchange, .-exchange
	.align	2
	.globl	markTwo
	.set	nomips16
	.ent	markTwo
	.type	markTwo, @function
markTwo:
	.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-8
	sw	$31,4($sp)
	sw	$16,0($sp)
	move	$16,$4
	lw	$4,0($4)
	li	$2,-1			# 0xffffffffffffffff
	beq	$4,$2,.L6
	addiu	$5,$5,-48

	bne	$5,$4,.L7
	nop

	j	.L8
	sw	$2,0($16)

.L6:
	j	.L8
	sw	$5,0($16)

.L7:
	jal	exchange
	nop

	li	$2,-1			# 0xffffffffffffffff
	sw	$2,0($16)
.L8:
	move	$2,$0
	lw	$31,4($sp)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,8

	.set	macro
	.set	reorder
	.end	markTwo
	.size	markTwo, .-markTwo
	.align	2
	.globl	markInsert
	.set	nomips16
	.ent	markInsert
	.type	markInsert, @function
markInsert:
	.frame	$sp,16,$31		# vars= 0, regs= 4/0, args= 0, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-16
	sw	$31,12($sp)
	sw	$18,8($sp)
	sw	$17,4($sp)
	sw	$16,0($sp)
	move	$18,$4
	lw	$4,0($4)
	li	$2,-1			# 0xffffffffffffffff
	beq	$4,$2,.L11
	addiu	$17,$5,-48

	bne	$17,$4,.L12
	nop

	j	.L13
	sw	$2,0($18)

.L11:
	j	.L13
	sw	$17,0($18)

.L12:
	slt	$2,$4,$17
	bne	$2,$0,.L14
	slt	$2,$17,$4

	bne	$2,$0,.L23
	addiu	$16,$4,-1

	j	.L22
	li	$2,-1			# 0xffffffffffffffff

.L14:
	addiu	$17,$17,-1
	slt	$2,$4,$17
	beq	$2,$0,.L22
	li	$2,-1			# 0xffffffffffffffff

	addiu	$16,$4,1
.L24:
	jal	exchange
	move	$5,$16

	slt	$2,$16,$17
	beq	$2,$0,.L16
	move	$4,$16

	j	.L24
	addiu	$16,$4,1

.L18:
	addiu	$16,$4,-1
.L23:
	jal	exchange
	move	$5,$16

	slt	$2,$17,$16
	bne	$2,$0,.L18
	move	$4,$16

.L16:
	li	$2,-1			# 0xffffffffffffffff
.L22:
	sw	$2,0($18)
.L13:
	move	$2,$0
	lw	$31,12($sp)
	lw	$18,8($sp)
	lw	$17,4($sp)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,16

	.set	macro
	.set	reorder
	.end	markInsert
	.size	markInsert, .-markInsert
	.align	2
	.globl	clearStdinBuf
	.set	nomips16
	.ent	clearStdinBuf
	.type	clearStdinBuf, @function
clearStdinBuf:
	.frame	$sp,16,$31		# vars= 0, regs= 4/0, args= 0, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-16
	sw	$31,12($sp)
	sw	$18,8($sp)
	sw	$17,4($sp)
	sw	$16,0($sp)
	lui	$16,%hi(stdin)
	li	$17,10			# 0xa
	li	$18,-1			# 0xffffffffffffffff
.L27:
	lw	$4,%lo(stdin)($16)
	jal	_IO_getc
	nop

	beq	$2,$17,.L28
	nop

	bne	$2,$18,.L27
	nop

.L28:
	lw	$31,12($sp)
	lw	$18,8($sp)
	lw	$17,4($sp)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,16

	.set	macro
	.set	reorder
	.end	clearStdinBuf
	.size	clearStdinBuf, .-clearStdinBuf
	.align	2
	.globl	getInput
	.set	nomips16
	.ent	getInput
	.type	getInput, @function
getInput:
	.frame	$sp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-16
	sw	$31,12($sp)
	move	$4,$sp
	lui	$2,%hi(stdin)
	lw	$6,%lo(stdin)($2)
	jal	fgets
	li	$5,2			# 0x2

	jal	clearStdinBuf
	nop

	lb	$2,0($sp)
	lw	$31,12($sp)
	nop
	j	$31
	addiu	$sp,$sp,16

	.set	macro
	.set	reorder
	.end	getInput
	.size	getInput, .-getInput
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.ascii	"Select the method:\000"
	.align	2
.LC1:
	.ascii	"1 to markTwo\000"
	.align	2
.LC2:
	.ascii	"2 to markInsert\000"
	.align	2
.LC3:
	.ascii	"Choose %c\012\000"
	.text
	.align	2
	.globl	chooseExchangeMethod
	.set	nomips16
	.ent	chooseExchangeMethod
	.type	chooseExchangeMethod, @function
chooseExchangeMethod:
	.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-8
	sw	$31,4($sp)
	sw	$16,0($sp)
	lui	$4,%hi(.LC0)
	jal	puts
	addiu	$4,$4,%lo(.LC0)

	lui	$4,%hi(.LC1)
	jal	puts
	addiu	$4,$4,%lo(.LC1)

	lui	$4,%hi(.LC2)
	jal	puts
	addiu	$4,$4,%lo(.LC2)

	jal	getInput
	nop

	move	$16,$2
	lui	$4,%hi(.LC3)
	addiu	$4,$4,%lo(.LC3)
	sll	$5,$2,24
	jal	printf
	sra	$5,$5,24

	li	$2,49			# 0x31
	beq	$16,$2,.L34
	lui	$3,%hi(markTwo)

	li	$2,50			# 0x32
	bne	$16,$2,.L38
	nop

	j	.L39
	lui	$3,%hi(markInsert)

.L34:
	addiu	$3,$3,%lo(markTwo)
	lui	$2,%hi(exchangeFunc)
	sw	$3,%lo(exchangeFunc)($2)
	j	.L36
	move	$2,$0

.L39:
	addiu	$3,$3,%lo(markInsert)
	lui	$2,%hi(exchangeFunc)
	sw	$3,%lo(exchangeFunc)($2)
	j	.L36
	move	$2,$0

.L38:
	addiu	$3,$3,%lo(markTwo)
	lui	$2,%hi(exchangeFunc)
	sw	$3,%lo(exchangeFunc)($2)
	li	$2,-1			# 0xffffffffffffffff
.L36:
	lw	$31,4($sp)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,8

	.set	macro
	.set	reorder
	.end	chooseExchangeMethod
	.size	chooseExchangeMethod, .-chooseExchangeMethod
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Input the index of the char you want to exchange\000"
	.align	2
.LC5:
	.ascii	"\012Or choose option:\000"
	.align	2
.LC6:
	.ascii	"x to exit the program\000"
	.align	2
.LC7:
	.ascii	"m to choose exchange method\000"
	.align	2
.LC8:
	.ascii	"c to compare the string with list\000"
	.align	2
.LC9:
	.ascii	"\011\011%s\012\000"
	.align	2
.LC10:
	.ascii	"Input: %c\012\000"
	.align	2
.LC11:
	.ascii	"newline\000"
	.align	2
.LC12:
	.ascii	"Invalid input\000"
	.text
	.align	2
	.globl	rearrange
	.set	nomips16
	.ent	rearrange
	.type	rearrange, @function
rearrange:
	.frame	$sp,72,$31		# vars= 32, regs= 10/0, args= 0, gp= 0
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-72
	sw	$31,68($sp)
	sw	$fp,64($sp)
	sw	$23,60($sp)
	sw	$22,56($sp)
	sw	$21,52($sp)
	sw	$20,48($sp)
	sw	$19,44($sp)
	sw	$18,40($sp)
	sw	$17,36($sp)
	sw	$16,32($sp)
	move	$22,$5
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,0($sp)
	li	$18,-1			# 0xffffffffffffffff
	lui	$23,%hi(.LC4)
	addiu	$23,$23,%lo(.LC4)
	lui	$fp,%hi(stdout)
	lui	$17,%hi(buffer)
	addiu	$17,$17,%lo(buffer)
	lui	$2,%hi(.LC5)
	addiu	$2,$2,%lo(.LC5)
	sw	$2,8($sp)
	lui	$2,%hi(.LC6)
	addiu	$2,$2,%lo(.LC6)
	sw	$2,12($sp)
	lui	$2,%hi(.LC7)
	addiu	$2,$2,%lo(.LC7)
	sw	$2,16($sp)
	lui	$2,%hi(.LC8)
	addiu	$2,$2,%lo(.LC8)
	sw	$2,20($sp)
	lui	$19,%hi(.LC9)
	addiu	$19,$19,%lo(.LC9)
	lui	$20,%hi(.LC10)
	addiu	$20,$20,%lo(.LC10)
	lui	$2,%hi(.LC12)
	addiu	$2,$2,%lo(.LC12)
	sw	$2,24($sp)
	lui	$2,%hi(.LC11)
	addiu	$2,$2,%lo(.LC11)
	sw	$2,28($sp)
	lui	$21,%hi(exchangeFunc)
.L52:
	lw	$2,0($sp)
	nop
	bne	$2,$18,.L42
	nop

	jal	putchar
	li	$4,10			# 0xa

	jal	puts
	move	$4,$23

	move	$4,$17
	li	$5,1			# 0x1
	lw	$7,%lo(stdout)($fp)
	jal	fwrite
	move	$6,$22

	lw	$4,8($sp)
	jal	puts
	nop

	lw	$4,12($sp)
	jal	puts
	nop

	lw	$4,16($sp)
	jal	puts
	nop

	lw	$4,20($sp)
	jal	puts
	nop

.L42:
	jal	putchar
	li	$4,10			# 0xa

	move	$4,$19
	jal	printf
	move	$5,$17

	jal	putchar
	li	$4,10			# 0xa

	jal	getInput
	nop

	move	$16,$2
	move	$4,$20
	sll	$5,$2,24
	jal	printf
	sra	$5,$5,24

	addiu	$2,$16,-48
	sltu	$2,$2,10
	beq	$2,$0,.L43
	li	$2,101			# 0x65

	lw	$2,%lo(exchangeFunc)($21)
	move	$4,$sp
	jalr	$2
	move	$5,$16

	j	.L52
	nop

.L43:
	beq	$16,$2,.L46
	slt	$2,$16,102

	beq	$2,$0,.L49
	li	$2,109			# 0x6d

	li	$2,10			# 0xa
	beq	$16,$2,.L45
	li	$2,99			# 0x63

	bne	$16,$2,.L44
	nop

	j	.L52
	nop

.L49:
	beq	$16,$2,.L47
	li	$2,120			# 0x78

	bne	$16,$2,.L44
	move	$2,$0

	j	.L50
	nop

.L45:
	lw	$4,28($sp)
	jal	printf
	nop

	j	.L52
	nop

.L47:
	jal	chooseExchangeMethod
	move	$4,$0

	j	.L52
	nop

.L44:
	lw	$4,24($sp)
	jal	puts
	nop

	j	.L52
	nop

.L46:
	li	$2,1			# 0x1
.L50:
	lw	$31,68($sp)
	lw	$fp,64($sp)
	lw	$23,60($sp)
	lw	$22,56($sp)
	lw	$21,52($sp)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	j	$31
	addiu	$sp,$sp,72

	.set	macro
	.set	reorder
	.end	rearrange
	.size	rearrange, .-rearrange
	.globl	exchangeFunc
	.data
	.align	2
	.type	exchangeFunc, @object
	.size	exchangeFunc, 4
exchangeFunc:
	.word	markTwo
	.local	buffer
	.comm	buffer,16,4
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"

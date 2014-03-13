
.data
.align	2
.LC0:
	.ascii	"Select the method:\000"
.LC1:
	.ascii	"1 to markTwo\000"
.LC2:
	.ascii	"2 to markInsert\000"
.LC3:
	.ascii	"Choose %c\012\000"
.LC4:
	.ascii	"Input the index of the char you want to exchange\000"
.LC5:
	.ascii	"\012Or choose option:\000"
.LC6:
	.ascii	"x to exit the program\000"
.LC7:
	.ascii	"m to choose exchange method\000"
.LC8:
	.ascii	"c to compare the string with list\000"
.LC9:
	.ascii	"\011\011%s\012\000"
.LC10:
	.ascii	"Input: %c\012\000"
.LC11:
	.ascii	"newline\000"
.LC12:
	.ascii	"Invalid input\000"
sInputFormat:
	.ascii	"Input format: ./rearrange {WORD}\012\000"

.globl	exchangeFunc
	.data
exchangeFunc:
	.word	markTwo
numChars:
	.word	7
buffer:
	.space	16

	.text
.align	2
.globl	compare
compare:
	#.frame	$sp, 0, $ra		# vars= 0,  regs= 0/0,  args= 0,  gp= 0

	j	$ra
	li	$v0, 1			# 0x1


.align	2
.globl	exchange
exchange:
	#.frame	$sp, 0, $ra		# vars= 0,  regs= 0/0,  args= 0,  gp= 0
	la	$v0, buffer
	addu	$a0, $v0, $a0
	lb	$v1, 0($a0)
	addu	$v0, $v0, $a1
	lbu	$a1, 0($v0)
	#nop
	sb	$a1, 0($a0)
	sb	$v1, 0($v0)
	j	$ra
	li	$v0, 1			# 0x1

	
	.align	2
	.globl	markTwo
markTwo:
	#.frame	$sp, 8, $ra		# vars= 0,  regs= 2/0,  args= 0,  gp= 0
	addiu	$sp, $sp, -8		# a0 is mark status, a1 is the input
	sw	$ra, 4($sp)
	sw	$s0, 0($sp)
	move	$s0, $a0		# copy a0 to s0
	lw	$a0, 0($a0)		# load data at address a0 to a0
	li	$v0, -1			# 0xffffffffffffffff
	
	beq	$a0, $v0, markFirst		# mark = -1, then goto markFirst
	addiu	$a1, $a1, -48
	
	bne	$a1, $a0, markSecond		# mark and input are not equal
	
	j	okMarkTwo		# if equal, then return and set mark = -1, which means unmark
	sw	$v0, 0($s0)

markFirst:
	j	okMarkTwo
	sw	$a1, 0($s0)

markSecond:
	jal	exchange
	li	$v0, -1			# 0xffffffffffffffff
	sw	$v0, 0($s0)		# set mark to unmark (-1) after exchanging
okMarkTwo:
	move	$v0, $zero
	lw	$ra, 4($sp)
	lw	$s0, 0($sp)
	j	$ra
	addiu	$sp, $sp, 8

	
.align	2
.globl	markInsert
markInsert:
	#.frame	$sp, 16, $ra		# vars= 0,  regs= 4/0,  args= 0,  gp= 0
	addiu	$sp, $sp, -16
	sw	$ra, 12($sp)
	sw	$s2, 8($sp)
	sw	$s1, 4($sp)
	sw	$s0, 0($sp)
	move	$s2, $a0		# mark status is on a0 and s2
	lw	$a0, 0($a0)
	li	$v0, -1			# 0xffffffffffffffff
	beq	$a0, $v0, markFirstInsert		# mark = -1, then mark first
	addiu	$s1, $a1, -48			# s1 is the index repre of input

	bne	$s1, $a0, markSecondInsert	# mark and input are not equal
	
	j	okMarkInsert
	sw	$v0, 0($s2)

markFirstInsert:
	j	okMarkInsert
	sw	$s1, 0($s2)

markSecondInsert:
	slt	$v0, $a0, $s1		# compare mark and input
	bne	$v0, $zero, markLessThanInput	# mark =< input
	slt	$v0, $s1, $a0		# compare input and mark
					
	bne	$v0, $zero, markLargerThanInput	# input <= mark
	addiu	$s0, $a0, -1

	j	endInsertLoop			# end
	li	$v0, -1			# 0xffffffffffffffff

markLessThanInput:
	addiu	$s1, $s1, -1
	slt	$v0, $a0, $s1
	beq	$v0, $zero, endInsertLoop
	li	$v0, -1			# 0xffffffffffffffff

	addiu	$s0, $a0, 1
insertLoop:
	jal	exchange
	move	$a1, $s0

	slt	$v0, $s0, $s1
	beq	$v0, $zero, insertResetMark
	move	$a0, $s0

	j	insertLoop
	addiu	$s0, $a0, 1

insertSecondConditionLoop:
	addiu	$s0, $a0, -1
markLargerThanInput:
	jal	exchange
	move	$a1, $s0

	slt	$v0, $s1, $s0
	bne	$v0, $zero, insertSecondConditionLoop
	move	$a0, $s0

insertResetMark:
	li	$v0, -1			# 0xffffffffffffffff
endInsertLoop:
	sw	$v0, 0($s2)
okMarkInsert:
	move	$v0, $zero
	lw	$ra, 12($sp)
	lw	$s2, 8($sp)
	lw	$s1, 4($sp)
	lw	$s0, 0($sp)
	j	$ra
	addiu	$sp, $sp, 16

	
	.align	2
	.globl	getInput
getInput:
	#.frame	$sp, 16, $ra		# vars= 8,  regs= 1/0,  args= 0,  gp= 0
	addiu	$sp, $sp, -16
	sw	$ra, 12($sp)
	move	$a0, $sp
	lw	$a2, stdin
	jal	fgets
	li	$a1, 2			# 0x2

	jal	clearStdinBuf
	lb	$v0, 0($sp)
	lw	$ra, 12($sp)
	#nop
	j	$ra
	addiu	$sp, $sp, 16

.macro readChar
li	$v0, 12
syscall
.end_macro
	
	
	.text
	.align	2
	.globl	chooseExchangeMethod
chooseExchangeMethod:
	#.frame	$sp, 8, $ra		# vars= 0,  regs= 2/0,  args= 0,  gp= 0
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)
	la	$a0, .LC0
	jal	puts
	sw	$s0, 0($sp)

	la	$a0, .LC1
	jal	puts
	la	$a0, .LC2
	jal	puts
	jal	getInput
	move	$s0, $v0
	la	$a0, .LC3
	sll	$a1, $v0, 24
	jal	printf
	sra	$a1, $a1, 24

	li	$v0, 49			# 0x31
	beq	$s0, $v0, .L34
	li	$v0, 50			# 0x32
	bne	$s0, $v0, .L38
	j	.L39
.L34:
	la	$v0, markTwo
	sw	$v0, exchangeFunc
	j	.L36
	move	$v0, $zero

.L39:
	la	$v0, markInsert
	sw	$v0, exchangeFunc
	j	.L36
	move	$v0, $zero

.L38:
	la	$v0, markTwo
	sw	$v0, exchangeFunc
	li	$v0, -1			# 0xffffffffffffffff
.L36:
	lw	$ra, 4($sp)
	lw	$s0, 0($sp)
	j	$ra
	addiu	$sp, $sp, 8

	
	
	
	.text
	.align	2
	.globl	rearrange
rearrange:
	#.frame	$sp, 56, $ra		# vars= 16,  regs= 10/0,  args= 0,  gp= 0
	#.mask	0xc0ff0000, -4
	#.fmask	0x00000000, 0
	addiu	$sp, $sp, -56
	sw	$ra, 52($sp)
	sw	$fp, 48($sp)
	sw	$s7, 44($sp)
	sw	$s6, 40($sp)
	sw	$s5, 36($sp)
	sw	$s4, 32($sp)
	sw	$s3, 28($sp)
	sw	$s2, 24($sp)
	sw	$s1, 20($sp)
	sw	$s0, 16($sp)
	sw	$a1, 8($sp)
	li	$v0, -1			# 0xffffffffffffffff
	sw	$v0, 0($sp)
	li	$s2, -1			# 0xffffffffffffffff
	la	$s1, buffer
	la	$s3, .LC9
	la	$s4, .LC10
	li	$s5, 101			# 0x65
	li	$s6, 109			# 0x6d
	li	$s7, 120			# 0x78
	li	$fp, 99			# 0x63
inputLoop:
	lw	$v0, 0($sp)
	#nop
	bne	$v0, $s2, noPrintManual		# mark = -1?
	nop
	print_str("\n")

	print_str("Input the index of the char you want to exchange")
	print_str_r($s1)	# print buffer
	
	print_str("\012Or choose option:\n")
	print_str("x to exit the program\n")
	print_str("m to choose exchange method\n")
	print_str("c to compare the string with list\n")

noPrintManual:
	print_str("\n")
	print_str("\t")
	print_str_r($s1)	# print buffer
	print_str("\n")
	print_str("\n")

	jal	getInput
	move	$s0, $v0
	move	$a0, $s4
	sll	$a1, $v0, 24
	jal	printf
	sra	$a1, $a1, 24

	addiu	$v0, $s0, -48
	sltu	$v0, $v0, 10
	beq	$v0, $zero, .L43
	move	$a0, $sp

	lw	$v0, exchangeFunc
	#nop
	jalr	$v0
	move	$a1, $s0

	j	inputLoop
.L43:
	beq	$s0, $s5, .L46
	slt	$v0, $s0, 102

	beq	$v0, $zero, .L49
	li	$v0, 10			# 0xa

	beq	$s0, $v0, .L45
	bne	$s0, $fp, .L44
	j	inputLoop
.L49:
	beq	$s0, $s6, .L47
	bne	$s0, $s7, .L44
	move	$v0, $zero

	j	.L50
.L45:
	la	$a0, .LC11
	jal	printf
	j	inputLoop
.L47:
	jal	chooseExchangeMethod
	move	$a0, $zero

	j	inputLoop
.L44:
	la	$a0, .LC12
	jal	puts
	j	inputLoop
.L46:
	li	$v0, 1			# 0x1
.L50:
	lw	$ra, 52($sp)
	lw	$fp, 48($sp)
	lw	$s7, 44($sp)
	lw	$s6, 40($sp)
	lw	$s5, 36($sp)
	lw	$s4, 32($sp)
	lw	$s3, 28($sp)
	lw	$s2, 24($sp)
	lw	$s1, 20($sp)
	lw	$s0, 16($sp)
	j	$ra
	addiu	$sp, $sp, 56


.macro	print_str_r(%reg)
	addi	$sp, $sp, -4
	sw	$v0, $sp
	move	$a0, %reg
	li	$v0, 4
	syscall
	lw	$v0, $sp
	addi	$sp, $sp, 4
.end_macro	

.macro print_str (%str)
	addi	$sp, $sp, -4
	sw	$v0, $sp
	.data
myLabel: .asciiz %str
	.text
	li $v0, 4
	la $a0, myLabel
	syscall
	lw	$v0, $sp
	addi	$sp, $sp, 4
.end_macro

.macro exit()
	li	$v0, 10
	syscall
.end_macro

.globl	strlen
strlen:
	li 	$t0, 0 # initialize the count to zero
strlenLoop:
	lbu 	$t1, 0($a0) # load the next character into t1
	beqz 	$t1, exitStrlen # check for the null character
	addi 	$a0, $a0, 1 # increment the string pointer
	addi 	$t0, $t0, 1 # increment the count
	j 	strlenLoop # return to the top of the loop
	nop
exitStrlen:
	j	$ra
	move	$v0, $t0
	
.globl strcpy
strcpy:
	addi $sp, $sp, -4
	sw $s0, 0($sp)	
	add $s0, $zero, $zero
L1: 
	add $t1, $s0, $a1
	lb $t2, 0($t1)
	add $t3, $s0, $a0
	sb $t2, 0($t3)
	beq $t2, $zero, L2
	j L1
	addi $s0, $s0, 1
L2: 	
	lw $s0, 0($sp)
	jr $ra
	addi $sp, $sp, 4
				
	.text
	.align	2
	.globl	main
main:
	#.frame	$sp, 16, $ra		# vars= 0,  regs= 3/0,  args= 0,  gp= 0
	addiu	$sp, $sp, -16
	sw	$ra, 12($sp)
	sw	$s1, 8($sp)
	slt	$a0, $a0, 2
	beq	$a0, $zero, valid
	sw	$s0, 4($sp)

	print_str("Input format: ./rearrange {WORD}\n")
	exit()

valid:
	lw	$s1, 4($a1)
	jal	strlen
	move	$a0, $s1

	move	$s0, $v0
	sw	$v0, numChars
	la	$a0, buffer
	move	$a1, $s1
	jal	strncpy
	move	$a2, $v0

	move	$a0, $s1
	jal	rearrange
	move	$a1, $s0

	move	$v0, $zero
	lw	$ra, 12($sp)
	lw	$s1, 8($sp)
	lw	$s0, 4($sp)
	jr	$ra
	addiu	$sp, $sp, 16

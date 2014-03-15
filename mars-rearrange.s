
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

read_char:
	li	$v0, 12
	syscall
	jr	$ra



.macro	print_char_r(%reg)
	addi	$sp, $sp, -8
	sw	$a0, 4($sp)
	sw	$v0, 0($sp)
	move	$a0, %reg
	li	$v0, 11
	syscall
	lw	$a0, 4($sp)
	lw	$v0, 0($sp)
	addi	$sp, $sp, 8
.end_macro

.macro	print_str_r(%reg)
	addi	$sp, $sp, -4
	sw	$v0, 0($sp)
	move	$a0, %reg
	li	$v0, 4
	syscall
	lw	$v0, 0($sp)
	addi	$sp, $sp, 4
.end_macro	

.macro print_str (%str)
	addi	$sp, $sp, -4
	sw	$v0, 0($sp)
	.data
myLabel: .asciiz %str
	.text
	li $v0, 4
	la $a0, myLabel
	syscall
	lw	$v0, 0($sp)
	addi	$sp, $sp, 4
.end_macro

.macro exit()
	li	$v0, 10
	syscall
.end_macro



.globl main

strlen:
	li 	$t0, 0 # initialize the count to zero
strlenLoop:
	lbu 	$t1, 0($a0) # load the next character into t1
	beqz 	$t1, exitStrlen # check for the null character
	addi 	$a0, $a0, 1 # increment the string pointer
	addi 	$t0, $t0, 1 # increment the count
	j 	strlenLoop # return to the top of the loop
exitStrlen:
	move	$v0, $t0
	jr	$ra
	
	
	
strcpy:
	addi $sp, $sp, -4
	sw $s0, 0($sp)	
	add $s0, $zero, $zero
strcpyL1: 
	add $t1, $s0, $a1
	lb $t2, 0($t1)
	add $t3, $s0, $a0
	sb $t2, 0($t3)
	beq $t2, $zero, strcpyL2
	addi $s0, $s0, 1
	j strcpyL1
strcpyL2: 	
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	jr $ra

.globl	compare
compare:
	#.frame	$sp, 0, $ra		# vars= 0,  regs= 0/0,  args= 0,  gp= 0

	jr	$ra
	li	$v0, 1			# 0x1


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
	li	$v0, 1			# 0x1
	jr	$ra
	

	
	.globl	markTwo
markTwo:
	#.frame	$sp, 8, $ra		# vars= 0,  regs= 2/0,  args= 0,  gp= 0
	addi	$sp, $sp, -8		# a0 is mark status, a1 is the input
	sw	$ra, 4($sp)
	sw	$s0, 0($sp)
	move	$s0, $a0		# copy a0 to s0
	
	lw	$t0, 0($a0)		# load data at address a0 to t0
	move	$a0, $t0		# may be used for markSecond
	li	$t1, -1			
	
	addi	$a1, $a1, -48
	beq	$t0, $t1, markFirst		# mark = -1, then goto markFirst
	
	bne	$t0, $a1, markSecond		# mark and input are not equal
	
	sw	$t1, 0($s0)
	j	okMarkTwo		# if equal, then return and set mark = -1, which means unmark	

markFirst:
	sw	$a1, 0($s0)
	j	okMarkTwo	

markSecond:
	jal	exchange
	li	$t0, -1
	sw	$t0, 0($s0)		# set mark to unmark (-1) after exchanging
okMarkTwo:
	move	$v0, $zero
	lw	$ra, 4($sp)
	lw	$s0, 0($sp)
	addi	$sp, $sp, 8
	jr	$ra


markInsert:
	#.frame	$sp, 16, $ra		# vars= 0,  regs= 4/0,  args= 0,  gp= 0
	addi	$sp, $sp, -20
	sw	$ra, 16($sp)
	sw	$s3, 12($sp)
	sw	$s2, 8($sp)
	sw	$s1, 4($sp)
	sw	$s0, 0($sp)
	move	$s2, $a0		# mark status address is on s2
	lw	$s0, 0($s2)		# mark value in s0
	li	$t0, -1			# 0xffffffffffffffff
	addi	$s1, $a1, -48			# s1 is the index repre of input
	beq	$s0, $t0, markFirstInsert		# mark = -1, then mark first
	
	bne	$s1, $s0, markSecondInsert	# mark and input are not equal
	
	sw	$t0, 0($s2)
	j	okMarkInsert

markFirstInsert:
	sw	$s1, 0($s2)
	j	okMarkInsert

markSecondInsert:
	slt	$t1, $s0, $s1		# compare mark and input
	bne	$t1, $zero, markLessThanInput	# mark =< input

	slt	$t1, $s1, $s0		# compare input and mark				
	addi	$s0, $s0, -1
	bne	$t1, $zero, markLargerThanInput	# input <= mark
	
	li	$v0, -1
	j	endInsertLoop			# end

markLessThanInput:
	addi	$s1, $s1, -1
	slt	$t0, $s0, $s1
	beq	$t0, $zero, insertResetMark
	move	$s3, $s0
	addi	$s1, $s1, -1
insertLoop:
	move	$a0, $s3
	addi	$a1, $s3, 1
	jal	exchange
	
	slt	$v0, $s3, $s1
	beq	$v0, $zero, insertResetMark
	addi	$s3, $s3, 1
	j	insertLoop
	

insertSecondConditionLoop:
	addi	$s0, $a0, -1
markLargerThanInput:
	jal	exchange
	move	$a1, $s0

	slt	$v0, $s1, $s0
	bne	$v0, $zero, insertSecondConditionLoop
	move	$a0, $s0

insertResetMark:
	li	$t2, -1			# 0xffffffffffffffff
	sw	$t2, 0($s2)
endInsertLoop:
	nop
okMarkInsert:
	move	$v0, $zero
	lw	$ra, 16($sp)
	lw	$s3, 12($sp)
	lw	$s2, 8($sp)
	lw	$s1, 4($sp)
	lw	$s0, 0($sp)
	addi	$sp, $sp, 20
	jr	$ra
	


chooseExchangeMethod:
	#.frame	$sp, 8, $ra		# vars= 0,  regs= 2/0,  args= 0,  gp= 0
	addi	$sp, $sp, -4
	sw	$ra, 0($sp)
	print_str("Select the method:\n")

	print_str("1 to markTwo\n")
	print_str("2 to markInsert\n")
	
	print_str("Select method: ")
	jal	read_char
	print_str("\n")
	#move	$s0, $v0
	
	print_str("Method ")
	print_char_r($v0)
	print_str("\n")

	li	$t0, 49			# 0x31  1
	beq	$v0, $t0, chooseMarkTwo
	li	$t0, 50			# 0x32  2
	bne	$v0, $t0, chooseMarkInsert
	j	chooseOthers
	
chooseMarkTwo:
	la	$t1, markTwo
	sw	$t1, exchangeFunc
	move	$v0, $zero
	j	endChoose

chooseOthers:
	la	$t1, markInsert
	sw	$t1, exchangeFunc
	move	$v0, $zero
	j	endChoose

chooseMarkInsert:
	la	$t1, markTwo
	sw	$t1, exchangeFunc
	li	$v0, -1			# 0xffffffffffffffff
endChoose:
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra

	
.globl rearrange	
rearrange:
	#.frame	$sp, 56, $ra		# vars= 16,  regs= 10/0,  args= 0,  gp= 0
	#.mask	0xc0ff0000, -4
	#.fmask	0x00000000, 0
	
	addi	$sp, $sp, -28
	sw	$ra, 24($sp)
	sw	$s3, 20($sp)
	sw	$s2, 16($sp)
	sw	$s1, 12($sp)
	sw	$s0, 8($sp)
	sw	$v0, 4($sp)
	
	li	$t1, -1
	
	#move	$s0, $sp
	move	$s0, $a0		# mark addr is $a0 and $s0, value is in $s3
	move	$s1, $a1
	move	$s3, $t1
	sw	$t1, 0($sp)		# mark
	la	$s2, buffer
	
inputLoop:
	
	bne	$s3, $t1, noPrintManual		# mark = -1?
	
	print_str("\n")

	print_str("Input the index of the char you want to exchange")
	print_str_r($s2)	# print buffer
	
	print_str("\012Or choose option:\n")
	print_str("x to exit the program\n")
	print_str("m to choose exchange method\n")
	print_str("c to compare the string with list\n")

noPrintManual:
	print_str("\n")
	print_str("\t")
	print_str_r($s2)	# print buffer
	print_str("\n")
	print_str("\n")

	print_str("Please input a character: ")
	
	jal	read_char
	move	$s5, $v0	# newly read char in t0
	print_str("\n")

	print_str("Input: ")
	print_char_r($s5)
	print_str("\n")

	addi	$v0, $s5, -48		 # char - '0'
	sltiu	$v0, $v0, 10
	beq	$v0, $zero, notANumber	 # not a number
	
	move	$a0, $sp	# addr of mark
	move	$a1, $s5
	lw	$v0, exchangeFunc
	jalr	$v0
	
	j	inputLoop

notANumber:
	li	$t3, 99		# 99 c
	beq	$t3, $s5, compareBuffer
	
	li	$t3, 101
	beq	$t3, $s5, endRearrange		# 101 e
	
	li	$t3, 109			# 109 m
	beq	$t3, $s5, chooseInputMethod
	
	li	$t3, 120		# 120 x
	beq	$t3, $s5, endRearrange
	
	print_str("Invalid input\n")
	j	inputLoop
	
compareBuffer:
	jal	compare
chooseInputMethod:
	li	$t7, -1
	sw	$t7, 0($sp)	
	jal	chooseExchangeMethod
	j	inputLoop
endRearrange:
	li	$v0, 1			# 0x1
	lw	$ra, 24($sp)
	lw	$s3, 20($sp)
	lw	$s2, 16($sp)
	lw	$s1, 12($sp)
	lw	$s0, 8($sp)
	lw	$v0, 4($sp)
	addi	$sp, $sp, 28
	jr	$ra



main:
	#.frame	$sp, 16, $ra		# vars= 0,  regs= 3/0,  args= 0,  gp= 0

	.data
	testStr:	.asciiz "ASDFGHJ"
	.text

	#print_str("Input format: ./rearrange {WORD}\n")
	j	valid
	
	exit()
valid:
	la	$s0, testStr
	move	$a0, $s0
	jal	strlen
	#move	$a0, $s0

	move	$s1, $v0
	sw	$v0, numChars
	la	$a0, buffer
	move	$a1, $s0
	jal	strcpy

	move	$a1, $s1
	jal	rearrange
	

	move	$v0, $zero
	exit()

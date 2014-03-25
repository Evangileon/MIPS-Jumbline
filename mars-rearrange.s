
#############################################################
.data
ArrayOfString: .asciiz "cafe,caf,ace,face" # $a0
.align 2
LIST:.space 4096
LISTSZ:.word 0
COUNT: .space 24 # categories of n-length word count
.align 2
HITLIST:.space 4096
HITLISTSZ:.word 0
CANDIDATE:.asciiz "ace" # $a0
.align 2
CANDIDATE_LENGTH:.word 3 # $a1
current:.word HITLIST
#############################################################
.text

MACROS:
##############################
.macro print_str(%str)
.data
myLabel:.asciiz %str
.text
li $v0,4
la $a0,myLabel
syscall
.end_macro 
###############################
.macro print_int(%x)
li $v0,1
add $a0,$zero,%x
syscall
.end_macro
###############################
.macro correct_sound()
li $a0,60
li $a1,1000
li $a2,0
li $a3,30
li $v0,31
syscall
.end_macro
################################
.macro repeat_sound()
li $a0,60
li $a1,1000
li $a2,120
li $a3,100
li $v0,31
syscall
.end_macro 
##########################################################################
.macro display() #display the current status of remaining words list
addi $sp,$sp,-20
sw $s0,($sp)
sw $s1,4($sp)
sw $s2,8($sp)
sw $s3,12($sp)
sw $s4,16($sp)

la $s0,LIST
la $s1,LISTSZ
la $s2,COUNT
la $s3, HITLIST
la $s4, HITLISTSZ

print_str("The remaining words: ")
lw $t0,($s1)
print_int($t0)
print_str("\n")
print_str("The words you find: ")
lw $t0,($s4)
print_int($t0)
print_str("\n")
li $t0,2
L0OP:
print_str("The remaining words of length-")
print_int($t0)
print_str("is: ")
add $t1,$t0,-2
sll $t1,$t1,2
add $t1,$t1,$s2
lw $t2,($t1)
print_int($t2)
print_str("\n")
addi $t0,$t0,1
li $t1,7
bge $t1,$t0,L0OP

lw $s0,($sp)
lw $s1,4($sp)
lw $s2,8($sp)
lw $s3,12($sp)
lw $s4,16($sp)
addi $sp,$sp,20
.end_macro
################################################################################
.macro summary(%a)  #read from ArrayOfString and make a answer list
addi $sp,$sp,-20
sw $s0,($sp)
sw $s1,4($sp)
sw $s2,8($sp)
sw $s3,12($sp)
sw $s4,16($sp)

la $s0,LIST
la $s1,LISTSZ
la $s2,COUNT
la $s3, HITLIST
la $s4, HITLISTSZ

addi $sp,$sp,-4
sw $s0,($sp)
L1:
move $t0,%a  # $t0:iterator of char in a word; $a0:iterator of ArrayOfString
move $t1,$s0  # $s1: list address
L2:
lb $t2,($t0) 
beq $t2,$zero,MOVE #if str[i]='\0' ,EXIT L2
beq $t2,44,MOVE #if str[i]=','; EXIT L2
sb $t2,($t1)  #store char in LIST[k]
addi $t0,$t0,1
addi $t1,$t1,1
j L2
MOVE:
addi $s0,$s0,8 # move to the next word of the LIST
# LIST_SIZE ++
lw $t1,($s1)
addi $t1,$t1,1
sw $t1,($s1)
# COUNT[length]++
sub $t1,$t0,%a
subi $t1,$t1,2
sll $t1,$t1,2
add $t1,$t1,$s2
lw $t2,($t1)
addi $t2,$t2,1
sw $t2,($t1)
# move to the next word in the ArrayOfString
addi %a,$t0,1
#if reach EOF, END L1
lb $t1,($t0)
beq $t1,$zero,END 
j L1
END:
 #restore old $a0,$s0,$s1,$s2
lw $s0,0($sp)
addi $sp,$sp,4
# display the current status of the LIST and HITLIST
display() # display LISTSZ, HITLISTSZ, COUNT
lw $s0,($sp)
lw $s1,4($sp)
lw $s2,8($sp)
lw $s3,12($sp)
lw $s4,16($sp)
addi $sp,$sp,20
.end_macro 
########################################################################################################################
.macro check(%candidate,%length) # check if the user has made a repeated guess, if non-repeated return 1, else return 0
addi $sp,$sp,-20
sw $s0,($sp)
sw $s1,4($sp)
sw $s2,8($sp)
sw $s3,12($sp)
sw $s4,16($sp)

la $s0,LIST
la $s1,LISTSZ
la $s2,COUNT
la $s3, HITLIST
la $s4, HITLISTSZ

addi $sp,$sp,-12
sw %candidate,($sp) # store $a0
sw %length,4($sp)
sw $s3,8($sp) # store $s3
lw $t5,($s4) # $t5:HITLISTSZ
move $t6,%length # $t6:length of CANDIDATE
li $t0,1 # $t0:word iterator in the HITLIST
L3:
bgt $t0,$t5,EXIT # if reach the end of HITLIST,break
lw %candidate,($sp)  # $a0:char iterator in candidate word
li $t1,0     # $t1:match char counter in a word
move $t2,$s3 # $t2:char iterator in a word
L4:
lb $t3,($t2) 
lb $t4,(%candidate)
bne $t3,$t4,NEXT #if char not match, check the next entry in the HITLIST
beq $t1,$t6,REPEAT #if all chars match, break, print error message
addi $t1,$t1,1
addi $t2,$t2,1
addi %candidate,%candidate,1
j L4
NEXT:
addi $s3,$s3,8
addi $t0,$t0,1
j L3
REPEAT:
print_str ("\nInvalid Guess!\n")
repeat_sound()
li $v0,0 # if the user makes an invalid guess, return 0
j nonrepeat
EXIT:
li $v0,1
nonrepeat:
lw %candidate,($sp)  
lw %length,4($sp)
lw $s3,8($sp)
addi $sp,$sp,12


lw $s0,($sp)
lw $s1,4($sp)
lw $s2,8($sp)
lw $s3,12($sp)
lw $s4,16($sp)
addi $sp,$sp,20
.end_macro
####################################################################################################################
.macro search(%candidate,%length)  #search the candidate in answer list, if guess correct return 1, else return 0
addi $sp,$sp,-20
sw $s0,($sp)
sw $s1,4($sp)
sw $s2,8($sp)
sw $s3,12($sp)
sw $s4,16($sp)

la $s0,LIST
la $s1,LISTSZ
la $s2,COUNT
la $s3, current
la $s4, HITLISTSZ


addi $sp,$sp,-16
sw %candidate,($sp)
sw %length,4($sp)
sw $s0,8($sp)
sw $s3,12($sp)
li $t0,1 #  $t0:word iterator in the list
lw $t5,($s1) # $t5:LISTSZ
move $t6,%length # $t6:length of CANDIDATE
lw $s0,8($sp) # $s0:LIST address
L5:
bgt $t0,$t5,QUIT # if reach the end of LIST,break
lw %candidate,($sp) # $a0:char iterator in candidate word
li $t1,0 # $t1:match alphabet counter
move $t2,$s0 # $t2:character iterator in a word 
L6:
lb $t3,($t2)
lb $t4,(%candidate)
bne $t3,$t4,CHECK_NEXT # if char does not match, break L6 and move to the next word 
beq $t1,$t6,STORE # if all chars match, break L5 and store the word in HITLIST
addi $t1,$t1,1
addi $t2,$t2,1
addi %candidate,%candidate,1
j L6
CHECK_NEXT:
addi $s0,$s0,8
addi $t0,$t0,1
j L5
STORE: #store the word in HITLIST
correct_sound()	
lw $t0,($s0)
lw $s3, current
sw $t0,($s3)
lw $t0,4($s0)
sw $t0,4($s3)
addi $s3,$s3,8
sw $s3, current
#rewrite the current answer with the last word
lw $t0,8($sp) #load the addr of LIST $s0 in $t0
lw $t1,($s1)  #load the LISTSZ in $t1
sll $t1,$t1,3
add $t1,$t1,$t0
lw $t2,-8($t1) #t2
sw $t2,($s0)
lw $t2,-4($t1)
sw $t2,4($s0)
#  LISTSZ --
lw $t0,($s1)
addi $t0,$t0,-1
sw $t0,($s1)
#   HITLISTSZ ++
lw $t0,($s4)
addi $t0,$t0,1
sw $t0,($s4)
# COUNT[length]--
move $t0,$t6
subi $t1,$t0,2
sll $t1,$t1,2
add $t1,$t1,$s2
lw $t2,($t1)
addi $t2,$t2,-1
sw $t2,($t1)
print_str("\nYou got one point!\n\n")
display()
li $v0,1
j incorrect
QUIT:
print_str("Sorry, wrong guess!")
li $v0,0
incorrect:
lw %candidate,($sp)
lw %length,4($sp)
lw $s0,8($sp)
lw $s3,12($sp)
addi $sp,$sp,16

lw $s0,($sp)
lw $s1,4($sp)
lw $s2,8($sp)
lw $s3,12($sp)
lw $s4,16($sp)
addi $sp,$sp,20
.end_macro 
################################################################3

#main:

# receive ArrayOfString and generate LIST of all possible answers
la $a0,ArrayOfString
summary($a0)

# Check if the user made a repeated candidate input and search the candidate input in LIST
la $a0,CANDIDATE
la $a1,CANDIDATE_LENGTH
check($a0,$a1)
search($a0,$a1)







.data
.align	2

.globl	exchangeFunc		# This word used to store the address of the exchange method 
				#and the function to selecr substring to compare
.data
exchangeFunc:
	.word	markTwo
numChars:
	.word	7
buffer:
	.space	16
compareBuffer:
	.space	16
zeroBuffer:
	.space	16

.text

read_char:
	li	$v0, 12
	syscall
	jr	$ra

.macro clearCmpBuffer()
	la	$t0, compareBuffer
	sw	$zero, 0($t0)
	sw	$zero, 4($t0)
.end_macro

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

#.macro print_str (%str)
#	addi	$sp, $sp, -4
#	sw	$v0, 0($sp)
#	.data
#myLabel: .asciiz %str
#	.text
#	li $v0, 4
#	la $a0, myLabel
#	syscall
#	lw	$v0, 0($sp)
#	addi	$sp, $sp, 4
#.end_macro

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
	addi	$sp, $sp, -12
	sw	$ra, 8($sp)
	sw	$s1, 4($sp)
	sw	$s0, 0($sp)
		
	sub	$s1, $a1, $a0			# length
	slt	$t0, $a0, $a1
	bne	$t1, $zero, readyToCompare
	
	move	$t2, $a0			# if a0 smaller than a1, then do swap
	move	$a0, $a1,
	move	$a1, $t2
	
readyToCompare:
	move	$a2, $a0
	move	$a3, $a1
	addi	$a3, $a3, 1
	clearCmpBuffer()
	la	$a0, compareBuffer
	la	$a1, buffer
	jal	substringCpy
	
	la	$s0, compareBuffer
	
	move	$a0, $s0
	move	$a1, $s1
	check($a0, $a1)
	search($a0, $a1)
	lw	$ra, 8($sp)
	lw	$s1, 4($sp)
	lw	$s0, 0($sp)
	addi	$sp, $sp, 12
	jr	$ra
	


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
	

substringCpy:				# a0 dest, a1, src, a2 start, a3 end(exclusive)
	sub	$t0, $a3, $a2		# length
	add	$t1, $a0, $zero
	add	$t2, $a1, $a2		# start address of src
	add	$t3, $a1, $a3		# end address of src
substrCpyLoop:
	lb	$t4, 0($t2)
	sb	$t4, 0($t1)
	addi	$t2, $t2, 1
	addi	$t1, $t1, 1
	bne	$t2, $t3, substrCpyLoop
	
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

markLargerThanInput:
	slt	$t0, $s1, $s0
	beq	$t0, $zero, insertResetMark
	move	$s3, $s0
	addi	$s1, $s1, 1
secondInsertLoop:
	move	$a0, $s3
	addi	$a1, $s3, -1
	jal	exchange
	
	slt	$t0, $s1, $s3
	beq	$t0, $zero, insertResetMark
	addi	$s3, $s3, -1
	j	secondInsertLoop

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


substringToCompare:
	#.frame	$sp, 8, $ra		# vars= 0,  regs= 2/0,  args= 0,  gp= 0
	addi	$sp, $sp, -8		# a0 is mark status, a1 is the input
	sw	$ra, 4($sp)
	sw	$s0, 0($sp)
	move	$s0, $a0		# copy a0 to s0
	
	lw	$t0, 0($a0)		# load data at address a0 to t0
	move	$a0, $t0		# may be used for markSecond
	li	$t1, -1			
	
	addi	$a1, $a1, -48
	beq	$t0, $t1, substringMarkFirst		# mark = -1, then goto markFirst
	
	bne	$t0, $a1, subtringMarkSecond		# mark and input are not equal
	
	sw	$t1, 0($s0)
	j	okSubstringMarkTwo		# if equal, then return and set mark = -1, which means unmark	
substringMarkFirst:
	sw	$a1, 0($s0)
	j	okSubstringMarkTwo	
subtringMarkSecond:
	move	$a0, $t0
	move	$a1, $a1
	jal	compare
	li	$t0, -1
	sw	$t0, 0($s0)		# set mark to unmark (-1) after exchanging
okSubstringMarkTwo:
	move	$v0, $zero
	lw	$ra, 4($sp)
	lw	$s0, 0($sp)
	addi	$sp, $sp, 8
	jr	$ra


selectSubstringOption:
#.frame	$sp, 8, $ra		# vars= 0,  regs= 2/0,  args= 0,  gp= 0
	la	$t1, substringToCompare
	sw	$t1, exchangeFunc
	print_str("Switch to substring mode\n")
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
	
	#bne	$s3, $t1, noPrintManual		# mark = -1?
	
	print_str("\n")
	print_str("Input the index of the char you want to exchange\n")
	print_str("Choose option:\n")
	print_str("x to exit the program\n")
	print_str("m to choose exchange method\n")
	print_str("c to compare the string with list\n")
	print_str("s to select the substring to compare with dictionary\n")

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
	beq	$t3, $s5, compareBufferAll
	
	li	$t3, 101
	beq	$t3, $s5, endRearrange		# 101 e
	
	li	$t3, 109			# 109 m
	beq	$t3, $s5, chooseInputMethod
	
	li	$t3, 115			# 115 s
	beq	$t3, $s5, chooseSubstring
	
	li	$t3, 120		# 120 x
	beq	$t3, $s5, endRearrange
	
	print_str("Invalid input\n")
	j	inputLoop
	
compareBufferAll:
	li	$t7, -1
	sw	$t7, 0($sp)
	jal	compare
chooseInputMethod:
	li	$t7, -1
	sw	$t7, 0($sp)	
	jal	chooseExchangeMethod
	j	inputLoop	
chooseSubstring:
	li	$t7, -1
	sw	$t7, 0($sp)
	jal	selectSubstringOption
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
	testStr:	.asciiz "cafe"
	.text

	#print_str("Input format: ./rearrange {WORD}\n")
	j	valid
	
	exit()
valid:
	la	$t3, HITLIST
	sw	$t3, current	
	la $a0,ArrayOfString
	summary($a0)
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

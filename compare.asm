#############################################################
.data
	ArrayOfString: .asciiz "cafe,caf,ace,face" # $a0
.align 2
	LIST:.space 4096
	LISTSZ:.word 0
	COUNT: .space 24 # categories of n-length word count
.align 2
	RECORD:.space 4096
	RECORDSZ:.word 0
.align 2
	HITLIST:.space 4096
	HITLISTSZ:.word 0
	CANDIDATE:.asciiz "caf" # $a0
.align 2
	CANDIDATE_LENGTH:.word 3 # $a1
#############################################################
.text
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
	
	print_str("The remaining words: ")
	lw $t0,LISTSZ
	print_int($t0)
	print_str("\n")
	
	print_str("The words you find: ")
	lw $t0,HITLISTSZ
	print_int($t0)
	print_str("\n")

	li $t0,2
	
	L0OP:
	print_str("The remaining words of length-")
	print_int($t0)
	print_str("is: ")
	add $t1,$t0,-2
	sll $t1,$t1,2
	lw $t2,	COUNT($t1)
	print_int($t2)
	print_str("\n")
	addi $t0,$t0,1
	li $t1,7
	bge $t1,$t0,L0OP
	
	.end_macro
################################################################################
	.macro summary(%a)  #read from ArrayOfString and make a answer list
	
	addi $sp,$sp,-4
	sw %a,($sp)
	li $t3,0
	
	L1:
	move $t0,%a  # $t0:iterator of char in a word; $a0:iterator of ArrayOfString
	move $t1,$t3  # $s1: list address
	L2:
	lb $t2,($t0) 
	beq $t2,$zero,MOVE #if str[i]='\0' ,EXIT L2
	beq $t2,44,MOVE #if str[i]=','; EXIT L2
	sb $t2,LIST($t1)  #store char in LIST[k]
	addi $t0,$t0,1
	addi $t1,$t1,1
	j L2
	
	MOVE:
	addi $t3,$t3,8 # move to the next word of the LIST
	
	# LIST_SIZE ++
	lw $t1,LISTSZ
	addi $t1,$t1,1
	sw $t1,LISTSZ
	
	# COUNT[length]++
	sub $t1,$t0,%a
	subi $t1,$t1,2
	sll $t1,$t1,2
	lw $t2,COUNT($t1)
	addi $t2,$t2,1
	sw $t2,COUNT($t1)
	
	# move to the next word in the ArrayOfString
	addi %a,$t0,1
	#if reach EOF, END L1
	lb $t1,($t0)
	beq $t1,$zero,END 
	j L1
	
	END:
	# display the current status of the LIST and HITLIST
	display() 
	lw %a,($sp)
	addi $sp,$sp,4
	
	.end_macro 
	
########################################################################################################################
	.macro  check(%candidate,%length) # check if the user has made a repeated guess, if non-repeated return 1, else return 0

    	addi $sp,$sp,-16
    	sw %candidate,($sp) # store $a0
    	sw %length, 4($sp)
    	sw $s0, 8($sp)
    	sw $s1, 12($sp)
    	
	lw $s0,	RECORDSZ # $s0:record SZ
	lw $s1,	(%length) # $s1:length of CANDIDATE
	li $t0,1 # $t0:entry iterator in the record
	
	L3:
	bgt $t0, $s0, EXIT # if reach the end of record,break
	lw  %candidate,($sp)  # $a0:char iterator in candidate word
	addi $t1,$t0,-1
	sll $t1,$t1,3	
	move $t2, $t1   # $t2:char iterator in a word
	li   $t3, 0     # $t2:match char counter in a word	
	L4:
	lb $t4, RECORD($t2)
	lb $t5, (%candidate)
	bne $t4,$t5,NEXT    #if char not match, check the next entry in the HITLIST
	beq $t3,$s1,REPEAT  #if all chars match, break, print error message
	addi $t2,$t2,1
	addi $t3,$t3,1
	addi %candidate,%candidate,1
	j L4
	NEXT:
	addi $t0,$t0,1
	j L3
	
	REPEAT:
	print_str ("\nInvalid Guess!\n")
	repeat_sound()
	li $v0,0 # if the user makes an invalid guess, return 0
	j nonrepeat
	
	EXIT:
	li $v0,1
	
	addi $t1, $t0, -1
	sll  $t1, $t1, 3
	lw   $t2, (%candidate) 
	lw   $t3, 4(%candidate)
	sw   $t2, RECORD($t1)
	sw   $t3, RECORD+4($t1)
	
	# update record size
	sw   $t0,RECORDSZ 
	
	nonrepeat:
	lw %candidate,($sp) # store $a0
	lw %length,4($sp)
	lw $s0, 8($sp)
    	lw $s1, 12($sp)
	addi $sp, $sp, 16
	
	.end_macro
		
####################################################################################################################
	
	.macro search(%candidate,%length)  #search the candidate in answer list, if guess correct return 1, else return 0
	
	addi $sp,$sp,-16
	sw %candidate,($sp) 
    	sw %length, 4($sp)
    	sw $s0, 8($sp)
    	sw $s1, 12($sp)

	li $t0,1 #  $t0:word iterator in the list
	lw $s0, LISTSZ # $s0:LISTSZ
	lw $s1, (%length) # $s1:length of CANDIDATE
	
	L5:
	bgt $t0,$s0,QUIT # if reach the end of LIST,break
	lw %candidate,($sp) # $a0:char iterator in candidate word
	addi $t1,$t0,-1
	sll $t1,$t1,3	
	move $t2, $t1 
	li $t3,0 # $t3:match alphabet counter
	L6:
	lb $t4, LIST($t2)
	lb $t5,(%candidate)
	bne $t4,$t5,CHECK_NEXT # if char does not match, break L6 and move to the next word 
	beq $t3,$s1,STORE # if all chars match, break L5 and store the word in HITLIST
	addi $t2,$t2,1
	addi $t3,$t3,1
	addi %candidate,%candidate,1
	j L6
	CHECK_NEXT:
	addi $t0,$t0,1
	j L5
	
# store the word in HITLIST	
	STORE: 
	correct_sound()		
	lw %candidate,($sp)
	lw $t2, (%candidate)
	lw $t3, 4(%candidate)
	lw $t1, HITLISTSZ
	sll $t1,$t1,3
	sw $t2, HITLIST($t1)
	sw $t3, HITLIST+4($t1)
	
#rewrite the current answer with the last word
	addi $t1,$t0,-1
	sll $t1,$t1,3
	addi $t0,$s0,-1
	sll $t0,$t0,3
	lw $t2, LIST($t0)
	lw $t3, LIST+4($t0) 
	sw $t2, LIST($t1)
	sw $t3, LIST+4($t1)
	
#  LISTSZ --
	lw $t0,LISTSZ
	addi $t0,$t0,-1
	sw $t0,LISTSZ
	
#   HITLISTSZ ++
	lw $t0, HITLISTSZ
	addi $t0,$t0,1
	sw $t0, HITLISTSZ
	
# COUNT[length]--
	subi $t0,$s1,2
	sll $t0,$t0,2
	lw $t1,COUNT($t0)
	addi $t1,$t1,-1
	sw $t1,COUNT($t0)

# print the score board
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
	lw $s1,12($sp)
	addi $sp,$sp,16
	
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






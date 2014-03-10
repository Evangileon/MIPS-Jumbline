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
li $a3,100
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
.end_macro
################################################################################
.macro summary(%a)  #read from ArrayOfString and make a answer list
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
.end_macro 
########################################################################################################################
.macro check(%candidate,%length) # check if the user has made a repeated guess, if non-repeated return 1, else return 0
addi $sp,$sp,-12
sw %candidate,($sp) # store $a0
sw %length,4($sp)
sw $s3,8($sp) # store $s3
lw $s5,($s4) # $s5:HITLISTSZ
lw $s6,(%length) # length of CANDIDATE
li $t0,1 # $t0:word iterator in the HITLIST
L3:
bgt $t0,$s5,EXIT # if reach the end of HITLIST,break
lw %candidate,($sp)  # $a0:char iterator in candidate word
li $t1,0     # $t1:match char counter in a word
move $t2,$s3 # $t2:char iterator in a word
L4:
lb $t3,($t2) 
lb $t4,(%candidate)
bne $t3,$t4,NEXT #if char not match, check the next entry in the HITLIST
beq $t1,$s6,REPEAT #if all chars match, break, print error message
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
.end_macro
####################################################################################################################
.macro search(%candidate,%length)  #search the candidate in answer list, if guess correct return 1, else return 0
addi $sp,$sp,-16
sw %candidate,($sp)
sw %length,4($sp)
sw $s0,8($sp)
sw $s3,12($sp)
li $t0,1 #  $t0:word iterator in the list
lw $s5,($s1) # $s5:LISTSZ
lw $s0,8($sp) # $s0:LIST address
L5:
bgt $t0,$s5,QUIT # if reach the end of LIST,break
lw %candidate,($sp) # $a0:char iterator in candidate word
li $t1,0 # $t1:match alphabet counter
move $t2,$s0 # $t2:character iterator in a word 
L6:
lb $t3,($t2)
lb $t4,(%candidate)
bne $t3,$t4,CHECK_NEXT # if char does not match, break L6 and move to the next word 
beq $t1,$s6,STORE # if all chars match, break L5 and store the word in HITLIST
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
sw $t0,($s3)
lw $t0,4($s0)
sw $t0,4($s3)
addi $s3,$s3,8
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
move $t0,$s6
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
.end_macro 
################################################################3

main:
la $s0,LIST
la $s1,LISTSZ
la $s2,COUNT
la $s3, HITLIST
la $s4, HITLISTSZ

# receive ArrayOfString and generate LIST of all possible answers
la $a0,ArrayOfString
summary($a0)

# Check if the user made a repeated candidate input and search the candidate input in LIST
la $a0,CANDIDATE
la $a1,CANDIDATE_LENGTH
check($a0,$a1)
search($a0,$a1)






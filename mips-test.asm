
.data
.align 2
var:
.word 17

.text
.globl main
main:
	lw	$t0, var
	li	$s0, 14
	
	jal	minus
	nop
	
	addiu	$t0, $t0, 1
	addiu	$s0, $s0, 1
minus:
	addi	$t0, $t0, -1
	addi	$s0, $s0, -1

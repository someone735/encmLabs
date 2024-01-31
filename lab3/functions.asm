# stub1.asm
# ENCM 369 Winter 2024
# This program has complete start-up and clean-up code, and a "stub"
# main function.

# BEGINNING of start-up & clean-up code.  Do NOT edit this code.
	.data
exit_msg_1:
	.asciz	"***About to exit. main returned "
exit_msg_2:
	.asciz	".***\n"
main_rv:
	.word	0
	
	.text
	# adjust sp, then call main
	andi	sp, sp, -32		# round sp down to multiple of 32
	jal	main
	
	# when main is done, print its return value, then halt the program
	sw	a0, main_rv, t0	
	la	a0, exit_msg_1
	li      a7, 4
	ecall
	lw	a0, main_rv
	li	a7, 1
	ecall
	la	a0, exit_msg_2
	li	a7, 4
	ecall
        lw      a0, main_rv
	addi	a7, zero, 93	# call for program exit with exit status that is in a0
	ecall
# END of start-up & clean-up code.

# Below is the stub for main. Edit it to give main the desired behaviour.
	.text
	.globl	main
main:
	#epilouge 
	addi 	sp, sp, -12	
	sw	ra, 8(sp)	#save ra for return to caller
	sw	s1, 4(sp)	#save s1 for some other procedure
	sw	s0, (sp)	#save s0 for some other procedure
	add	s0, a0, zero
	add	s1, a1, zero
	#body
	#prolouge
funcA:
	addi 
funcB

end:
	li      a0, 0   # return value from main = 0
	jr	ra

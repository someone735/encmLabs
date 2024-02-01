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
	.globl	main, cherry

cherry: .word 0x30000
main:
	#epilouge
	addi 	sp, sp, -12	
	sw	ra, 8(sp)	#save ra for return to caller
	sw	s1, 4(sp)	#save s1 for some other procedure
	sw	s0, (sp)	#save s0 for some other procedure
	add	s0, a0, zero	
	add	s1, a1, zero
	#body
	addi	a0, zero, 3
	addi	a1, zero, 5
	addi 	a2, zero, 6
	addi	a3, zero, 4
	jal	funcA
	add	s1, s1, a0
	add	t0, 

funcA:
	#epilouge
	addi 	sp, sp, -32	
	sw	ra, 28(sp)	#save ra for return to caller
	sw	s6, 24(sp)	
	sw	s5, 20(sp)
	sw	s4, 16(sp)	
	sw	s3, 12(sp)
	sw	s2, 8(sp)
	sw	s1, 4(sp)	#save s1 for some other procedure
	sw	s0, (sp)	#save s0 for some other procedure
	add	s0, a0, zero	
	add	s1, a1, zero
	add	s2, a2, zero	
	add	s3, a3, zero
	add	s4, a4, zero	
	add	s5, a5, zero
	add	s6, a6, zero	
	#body
	jal	funcB
	
funcB:
	addi 	t0, zero,  128
	mul 	a1, a1, t0
	add 	a0, a0,a1
	jr	ra

end:
	li      a0, 0   # return value from main = 0
	jr	ra

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
	.globl	funcA
	.globl	funcB
	.globl	cherry
	.globl	end
	
main:
	#s0 = apple
	#s1 = banana
	#s2 = cherry
	#prolouge
	addi 	sp, sp, -16
	sw	ra, 12(sp)
	sw	s2, 8(sp)	#save s2 for cherry
	sw	s1, 4(sp)	#save s1 for banana
	sw	s0, (sp)	#save s0 for apple
	li	s0, 0x700	#apple = 0x700
	li	s1, 0x600	#banana = 0x600
	lw	s2, 0x30000	#cherry = 0x300000
	
	#body
	li	a0, 3
	li	a1, 5
	li	a2, 6
	li 	a3, 4
	jal	funcA
	add	s1, s1, a0
	sub	t0, s1, s0
	add	s2, s2, t1
	
	#epilouge
	lw	ra, 12(sp)
	lw	s2, 8(sp)	
	lw	s1, 4(sp)	
	lw	s0, (sp)
	addi	sp, sp, 16
	j	end	
funcA:
	#prolouge
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
	#prep for orange	
	lw	a0, s1
	lw	a2, s0
	jal	funcB
	lw	s6, a0
	#insert after function
	lw	a0, s3
	lw	a1, s2
	jal	funcB
	lw	s4, a0	
	
	lw	a0, s2
	lw	a1, s3
	jal 	funcB
	lw	s5, a0
	#body
	
funcB:
	addi 	t0, zero,  128
	mul 	a1, a1, t0
	add 	a0, a0,a1
	jr	ra

end:
	li      a0, 0   # return value from main = 0
	jr	ra

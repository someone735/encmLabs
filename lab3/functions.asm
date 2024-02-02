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
	.data
	.globl cherry
cherry: .word 0x30000  
	
	.text
	.globl	main 
	.globl	funcA
	.globl	funcB

	
main:
	#s0 = apple
	#s1 = banana
	#s2 = cherry
	#prolouge
	addi 	sp, sp, -16
	sw	ra, 12(sp)	#save ra for return to caller
	sw	s2, 8(sp)	#save s2 for cherry
	sw	s1, 4(sp)	#save s1 for banana
	sw	s0, (sp)	#save s0 for apple
	li	s0, 0x700	#apple = 0x700
	li	s1, 0x600	#banana = 0x600
	lw	s2, cherry	#cherry = 0x300000
	
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
	li      a0, 0   # return value from main = 0
	jr	ra	
funcA:
	#s0 = first
	#s1 = second
	#s2 = third
	#s3 = fourth
	#s4 = kiwi 
	#s5 = mango
	#s6 = orange
	#prolouge
	addi 	sp, sp, -32	#increase stack by 32 bytes
	sw	ra, 44(sp)	#save ra for return to caller
	sw	s6, 40(sp)	#save s6 for orange 
	sw	s5, 36(sp)	#save s5 for mango
	sw	s4, 32(sp)	#save s4 for kiwi
	sw	s3, 28(sp)	#save s3 for fourth
	sw	s2, 24(sp)	#save s2 for third
	sw	s1, 20(sp)	#save s1 for second
	sw	s0, 16(sp)	#save s0 for first
	add	s0, a0, zero	#s0 = first 
	add	s1, a1, zero	#s1 = second
	add	s2, a2, zero	#s2 = third 
	add	s3, a3, zero	#s3 = fourth
	
	#body
	#for orange	
	mv	a0, s1		#y = second
	mv 	a2, s0		#z = first
	jal	funcB
	mv	s6, a0		#orange = rv of funcB(second, first)
	#for kiwi
	mv	a0, s3		#y = fourth
	mv	a1, s2		#z = third
	jal	funcB
	mv	s4, a0		#kiwi = rv of funcB(fourth, third)
	#for mango
	mv	a0, s2		#y = third
	mv	a1, s3		#z = fourth
	jal 	funcB
	mv	s5, a0		#mango = rv of funcB(third, fourth)
	
	add 	t1, s5, s6	#t1 = mango + orange
	add 	a0, t1, s4	#a0 = t1 + kiwi
	
	#epilouge
	lw	ra, 44(sp)	#save ra for return to caller
	lw	s6, 40(sp)	#save s6 for orange 
	lw	s5, 36(sp)	#save s5 for mango
	lw	s4, 32(sp)	#save s4 for kiwi
	lw	s3, 28(sp)	#save s3 for fourth
	lw	s2, 24(sp)	#save s2 for third
	lw	s1, 20(sp)	#save s1 for second
	lw	s0, 16(sp)	#save s0 for first
	addi	sp, sp, 32	#decrease stack by 32 bytes 
	jr 	ra
	
funcB:
	slli	a1, a1, 7
	add 	a0, a0,a1	#y = y+z
	jr	ra		#return to funcA


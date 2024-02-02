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
	.globl 	sat
	.globl 	sum_of_seats
	.globl	firstCase
	.globl	secondCase
	
	.data 
	.globl aaa
	.globl bbb
	.globl ccc
aaa: .word 11,11,3,-11
bbb: .word 200, -300, 400, 500
ccc: .word -2,-3,2,1,2,3



main:
	
	add 	sp, sp, -16
	sw 	ra, 12(sp)
	sw 	s2, 8(sp)
	sw 	s1, 4(sp)
	sw	s0, (sp)
	li 	s2, 2000
	
	#body
	la 	a0, aaa
	li 	a1, 4
	li 	a2, 9
	jal 	sum_of_seats
	add	s0, zero, a0
	
	la 	a0, bbb
	li 	a1, 4
	li 	a2, 250
	jal	sum_of_seats
	add	s1, zero, a0
	
	la	a0, ccc
	li 	a1, 6
	li	a2, 2
	jal	sum_of_seats
	add	s2, s2, a0
	add	s2, s2, s1
	add	s2, s2, s0

	#after
	lw 	ra, 12(sp)
	lw 	s2, 8(sp)
	lw 	s1, 4(sp)
	lw 	s0, (sp)
	add 	sp, sp, 16
	li      a0, 0   # return value from main = 0
	jr	ra
		
sat:
	blt	a1, a0, firstCase
	sub	t0, zero, a1
	ble	t0, a0, secondCase
	add	a0, zero, t0
	jr	ra
	
firstCase:
	add 	a0, zero, a1
	jr	ra

secondCase:
	jr 	ra
	
sum_of_seats: 
	add	sp, sp, -20
	sw	s4, 32(sp)
	sw	s3, 28(sp)
	sw	s2, 24(sp)
	sw	s1, 20(sp)
	sw	s0, 16(sp)
	addi	s4, zero, 0
	addi	s3, zero, 0
	lw	s2, a2
	lw	s1, a1
	la	s0, a0
	j	forLoop

endSum_of_seats:
	lw	s4, 32(sp)
	lw	s3, 28(sp)
	lw	s2, 24(sp)
	lw	s1, 20(sp)
	lw	s0, 16(sp)
	add	sp, sp, 20
	jr 	ra
	
forLoop:
`	ble	s3, s2, endSum_of_seats
	add 	a0, s0, s3
	add	a1, s1, zero
	jal	sat
	add	s4, s4, a0
	addi	s3, s3, 4
	j forLoop
	
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
	.globl aaa
	.globl bbb
	.globl ccc
aaa: .word 11,11,3,-11
bbb: .word 200, -300, 400, 500
ccc: .word -2,-3,2,1,2,3

	.text
	.globl	main
	.globl 	sat
	.globl 	sum_of_seats
	.globl	firstCase
	.globl	secondCase
	.globl	endSum_of_seats
	.globl 	forLoop

main:
	
	addi 	sp, sp, -16	#increase stack by 16 bytes 
	sw 	ra, 12(sp)	#save ra for return to caller
	sw 	s2, 8(sp)	#save s2 for gamma
	sw 	s1, 4(sp)	#save s1 for beta 
	sw	s0, (sp)	#save s0 for alpha
	li 	s2, 2000	#s2 = 2000
	
	#body
	la 	a0, aaa		#a0 = &aaa
	li 	a1, 4		#a1 = 4
	li 	a2, 9		#a2 = 9
	jal 	sum_of_seats	
	add	s0, zero, a0	#s0 = rv of sum_of_seat(aaa,4,9)
	
	la 	a0, bbb		#a0 = &bbb
	li 	a1, 4		#a1 = 4
	li 	a2, 250		#a2 = 250
	jal	sum_of_seats
	add	s1, zero, a0	#s1 = rv of sum_of_seat(bbb,4,250)
	
	la	a0, ccc		#a0 = &ccc
	li 	a1, 6		#a1 = 6
	li	a2, 2		#a2 = 2
	jal	sum_of_seats
	add	s2, s2, a0	#s2 = s2 + rv of sum_of_seat
	add	s2, s2, s1	#s2 = s2 + s1
	add	s2, s2, s0	#s2 = s2 + s0

	#after
	lw 	ra, 12(sp)
	lw 	s2, 8(sp)
	lw 	s1, 4(sp)
	lw 	s0, (sp)
	addi 	sp, sp, 16
	li      a0, 0   # return value from main = 0
	jr	ra
		
sat:
	bgt	a0, a1, firstCase	#if (b < x), goto firstCase
	sub	t0, zero, a1		#t0 = -b
	blt	a0, t0, secondCase	#if (x <= -b), goto secondCase
	jr	ra
	
firstCase:
	add 	a0, a1, zero		#a0 = b
	jr	ra

secondCase:
	sub	t0, zero, a1		#t0 = -b
	add	a0, zero, t0		#a0 = t0 
	jr 	ra
	
sum_of_seats: 
	addi	sp, sp, -24	#increase stack by 24
	sw	ra, 20(sp)	#save ra for return to caller 
	sw	s4, 16(sp)	#save s4 for result
	sw	s3, 12(sp)	#save s3 for i
	sw	s2, 8(sp)	#save s2 for max_mag
	sw	s1, 4(sp)	#save s1 for n
	sw	s0, (sp)	#save s0 for a
	addi	s4, zero, 0	#result = 0
	addi	s3, zero, 0	#i = 0
	add	s2, zero, a2	#s2 = a2
	add	s1, zero, a1	#s1 = a1
	add	s0, zero, a0	#s0 = a0
	j	forLoop

forLoop:
	ble	s1, s3, endSum_of_seats	#if (i < n) goto endSum_of_seats
	slli	t1, s3, 2		#t1 = s3 * 2^2 
	add 	t2, s0, t1		#a0 = &a[t1]
	lw	a0, (t2)
	add	a1, s2, zero		#a1 = max_mag
	jal	sat
	add	s4, s4, a0		#result += rv of sat
	addi	s3, s3, 1		#i++
	j forLoop
	
endSum_of_seats:
	mv	a0, s4	
	lw	ra, 20(sp)	#load ra
	lw	s4, 16(sp)	#load s4
	lw	s3, 12(sp)	#load s3
	lw	s2, 8(sp)	#load s2
	lw	s1, 4(sp)	#load s1
	lw	s0, (sp)	#load s0
	addi	sp, sp, 24	#decrease stack
	jr 	ra

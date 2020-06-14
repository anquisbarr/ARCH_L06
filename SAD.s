	.file	1 "SAD.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	abs_diff
	.set	nomips16
	.set	nomicromips
	.ent	abs_diff
	.type	abs_diff, @function
abs_diff:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	sw	$5,20($fp)
	lw	$3,16($fp)
	lw	$2,20($fp)
	subu	$2,$3,$2
	bgez	$2,$L2
	nop

	subu	$2,$0,$2
$L2:
	sw	$2,4($fp)
	lw	$2,4($fp)
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	abs_diff
	.size	abs_diff, .-abs_diff
	.align	2
	.globl	recursive_sum
	.set	nomips16
	.set	nomicromips
	.ent	recursive_sum
	.type	recursive_sum, @function
recursive_sum:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	sw	$5,36($fp)
	lw	$2,36($fp)
	bne	$2,$0,$L5
	nop

	move	$2,$0
	.option	pic0
	b	$L6
	nop

	.option	pic2
$L5:
	lw	$2,36($fp)
	addiu	$2,$2,-1
	move	$5,$2
	lw	$4,32($fp)
	.option	pic0
	jal	recursive_sum
	nop

	.option	pic2
	move	$4,$2
	lw	$3,36($fp)
	li	$2,1073676288			# 0x3fff0000
	ori	$2,$2,0xffff
	addu	$2,$3,$2
	sll	$2,$2,2
	lw	$3,32($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	addu	$2,$4,$2
$L6:
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	recursive_sum
	.size	recursive_sum, .-recursive_sum
	.rdata
	.align	2
$LC0:
	.word	5
	.word	16
	.word	7
	.word	1
	.word	1
	.word	13
	.word	2
	.word	8
	.word	10
	.align	2
$LC1:
	.word	4
	.word	15
	.word	8
	.word	0
	.word	2
	.word	12
	.word	3
	.word	7
	.word	11
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,160,$31		# vars= 128, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-160
	sw	$31,156($sp)
	sw	$fp,152($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,148($fp)
	li	$2,9			# 0x9
	sw	$2,32($fp)
	lui	$2,%hi($LC0)
	addiu	$3,$fp,76
	addiu	$2,$2,%lo($LC0)
	li	$4,36			# 0x24
	move	$6,$4
	move	$5,$2
	move	$4,$3
	lw	$2,%call16(memcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lui	$2,%hi($LC1)
	addiu	$3,$fp,112
	addiu	$2,$2,%lo($LC1)
	li	$4,36			# 0x24
	move	$6,$4
	move	$5,$2
	move	$4,$3
	lw	$2,%call16(memcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$0,28($fp)
	.option	pic0
	b	$L8
	nop

	.option	pic2
$L9:
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$3,$fp,152
	addu	$2,$3,$2
	lw	$3,-76($2)
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$4,$fp,152
	addu	$2,$4,$2
	lw	$2,-40($2)
	move	$5,$2
	move	$4,$3
	.option	pic0
	jal	abs_diff
	nop

	.option	pic2
	lw	$28,16($fp)
	move	$3,$2
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$4,$fp,152
	addu	$2,$4,$2
	sw	$3,-112($2)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L8:
	lw	$3,28($fp)
	lw	$2,32($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L9
	nop

	addiu	$2,$fp,40
	lw	$5,32($fp)
	move	$4,$2
	.option	pic0
	jal	recursive_sum
	nop

	.option	pic2
	lw	$28,16($fp)
	sw	$2,36($fp)
	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,148($fp)
	lw	$3,0($3)
	beq	$4,$3,$L11
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L11:
	move	$sp,$fp
	lw	$31,156($sp)
	lw	$fp,152($sp)
	addiu	$sp,$sp,160
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"

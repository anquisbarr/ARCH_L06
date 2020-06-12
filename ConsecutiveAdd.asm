main:
	addi $s1, $s1,5		#A
	addi $s2, $s2,10	#B
	
	j consecutiveAdd
consecutiveAdd:
	addi $t2, $t2,0		#sum
	addi $t1,$s1,0		#i = a
	addi $t3,$s2,1		#b+1
	j Loop			#Initialazing loop
Loop:
	beq $t1,$t3,end		# if i == b+1
	add $t2,$t2,$t1		# sum = sum + i
	addi $t1,$t1,1		# i = i + 1
	j Loop
end:
	
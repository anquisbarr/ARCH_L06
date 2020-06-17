#
# Sum of Absolute Differences Algorithm
#
# Authors: 
#	 Sebastian Quispe Barriga, Johan Tanta 

.text

main:

# Initializing data in memory... 
# Store in $s0 the address of the first element in memory
	# lui sets the upper 16 bits of thte specified register
	# ori the lower ones
	# (to be precise, lui also sets the lower 16 bits to 0, ori ORs it with the given immediate)
	     lui    $s0,0x00000000 # Address of first element in the vector
	     ori    $s0,0x10010000
	     addi   $t0,$0,5	# left_image[0]	
	     sw     $t0,0($s0)
	     addi   $t0,$0,16	# left_image[1]		
	     sw     $t0,4($s0)
	     # TODO1: initilize the rest of the memory.
	     addi   $t0, $0, 7	# left_image[2]	
	     sw      $t0, 8($s0)
	     addi   $t0, $0, 1	# left_image[3]	
	     sw      $t0, 12($s0)
	     addi   $t0, $0, 1	# left_image[4]	
	     sw      $t0, 16($s0)
	     addi   $t0, $0, 13	# left_image[5]	
	     sw      $t0, 20($s0)
	     addi   $t0, $0, 2	# left_image[6]	
	     sw      $t0, 24($s0)
	     addi   $t0, $0, 8	# left_image[7]	
	     sw      $t0, 28($s0)	
	     addi   $t0, $0, 10	# left_image[8]	
	     sw      $t0, 32($s0)
	          
	     lui $s1, 0x00000000 #Addres of firt element in the vector
	     ori $s1, 0x10010024
	     
	     addi   $t0, $0, 4 	# right_image[0]	
	     sw      $t0, 0($s1)
	     addi   $t0, $0, 15	# right_image[1]		
	     sw      $t0, 4($s1)
	     addi   $t0, $0, 8	# right_image[2]	
	     sw      $t0, 8($s1)
	     addi   $t0, $0, 0	# right_image[3]	
	     sw      $t0, 12($s1)
	     addi   $t0, $0, 2	# right_image[4]	
	     sw      $t0, 16($s1)
	     addi   $t0, $0, 12	# right_image[5]	
	     sw      $t0, 20($s1)
	     addi   $t0, $0, 3	# right_image[6]	
	     sw      $t0, 24($s1)
	     addi   $t0, $0, 7	# right_image[7]	
	     sw      $t0, 28($s1)
	     addi   $t0, $0, 11	# right_image[8]	
	     sw      $t0, 32($s1)
	     
	     lui $s2,0x00000000	#sad array
	     ori $s2,0x10010048
	     	     
	# TODO4: Loop over the elements of left_image and right_image
	
	addi $s3, $0, 0 # $s3 = i = 0
	addi $s4, $0, 9	# $s4 = image_size = 9
	j loop

#TODO 2
abs_diff:
	sub $t1,$a0,$a1  
	abs $v0,$t1	#t2 = abs(pixel_left - pixel_right)
	jr $ra
loop:
	# Check if we have traverse all the elements 
	# of the loop. If so, jump to end_loop:
	slt $t0,$s3,$s4		# i < image_size
	beq $t0,$0,end_loop	# $t0 = 0
	# Load left_image{i} and put the value in the corresponding register
	# before doing the function call
	sll $t4,$s3,2
	add $t1,$s0,$t4	#base address de left_image
	lw $a0,0($t1)	#load 
	# Load right_image{i} and put the value in the corresponding register
	add $t2,$s1,$t4	#base addres de right_image
	lw $a1,0($t2)	#load
	# Call abs_diff
	jal abs_diff
	#Store the returned value in sad_array[i]
	add $t3,$s2,$t4
	sw  $v0,0($t3)
	# Increment variable i and repeat loop:
	addi $s3,$s3,1
	j loop

	
#TODO 3
recursive_sum:
	addi  $sp, $sp, -8 	#stackpointer
       	sw $ra, 0($sp)
       	sw $a1, 4($sp)
      	beq $a2,$0,return
      	addi $a2,$a2,-1 	# size - 1
      	sll $t2,$a2,2		# sll del ba
      	add $t3,$a1,$t2		# 
      	lw $t4,0($t3)		# sad_array[size - 1]	
      	jal recursive_sum
      	add $t5,$v0,$t4		# 
	jr $ra
return:
	lw $ra,0($sp)
	lw $a1,4($sp)
	add $v0,$v0,$0
	jr $ra			#####################
	
		
end_loop:

	#TODO5: Call recursive_sum and store the result in $t2
	#Calculate the base address of sad_array (first argument
	#of the function call)and store in the corresponding register   
	addi $a1,$s2,0
	add $a2,$s4,$0
	jal recursive_sum
	
	# ...
	
	# Prepare the second argument of the function call: the size of the array
	
	#..... 
	
	# Call to funtion
	
	# ....
	  
	
	#Store the returned value in $t2
	
	# .....
	

end:	
	j	end	# Infinite loop at the end of the program. 

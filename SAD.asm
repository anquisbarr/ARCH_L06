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
	     lui    $s0, 0x0000 # Address of first element in the vector
	     ori    $s0, 0x0000
	     addi   $t0, $0, 5	# left_image[0]	
	     sw     $t0, 0($s0)
	     addi   $t0, $0, 16	# left_image[1]		
	     sw     $t0, 4($s0)
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
	          
	     lui $s1, 0x0000	#Addres of firt element in the vector
	     ori $s1, 0x0024
	     
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
	     
	     lui $s2,0x0000	#sad array
	     ori $s2,0x0044
	     	     
	# TODO4: Loop over the elements of left_image and right_image
	
	addi $s3, $0, 0 # $s3 = i = 0
	addi $s4, $0, 9	# $s4 = image_size = 9

#TODO 2

abs_diff:
	sub $t1,$a0,$a1  
	abs $v0,$t1	#t2 = abs(pixel_left - pixel_right)
loop:

	# Check if we have traverse all the elements 
	# of the loop. If so, jump to end_loop:
	addi $t0, $t0,0
	slt $t0,$s3,$s4		# i < image_size
	beq $t0,$0,end_loop	# $t0 = 0
	# Load left_image{i} and put the value in the corresponding register
	# before doing the function call
	addi $t1,$s0,0	#base address de left_image
	lw $a0,0($t1)	#load 
	# Load right_image{i} and put the value in the corresponding register
	addi $t2,$s1,0	#base addres de right_image
	lw $a1,0($t2)	#load
	# Call abs_diff
	jal   abs_diff
	#Store the returned value in sad_array[i]
	addi $t3,$s2,0
	sw  $v0,0($t3)
	# Increment variable i and repeat loop:
	addi $s3,$s3,1
	j loop

	
end_loop:

	#TODO5: Call recursive_sum and store the result in $t2
	#Calculate the base address of sad_array (first argument
	#of the function call)and store in the corresponding register   
	
	# ...
	
	# Prepare the second argument of the function call: the size of the array
	
	#..... 
	
	# Call to funtion
	
	# ....
	  
	
	#Store the returned value in $t2
	
	# .....
	

end:	
	j	end	# Infinite loop at the end of the program. 




# TODO2: Implement the abs_diff routine here, or use the one provided


# TODO3: Implement the recursive_sum routine here, or use the one provided

.globl relu

.text
# ==============================================================================
# FUNCTION: Array ReLU Activation
#
# Applies ReLU (Rectified Linear Unit) operation in-place:
# For each element x in array: x = max(0, x)
#
# Arguments:
#   a0: Pointer to integer array to be modified
#   a1: Number of elements in array
#
# Returns:
#   None - Original array is modified directly
#
# Validation:
#   Requires non-empty array (length ≥ 1)
#   Terminates (code 36) if validation fails
#
# Example:
#   Input:  [-2, 0, 3, -1, 5]
#   Result: [ 0, 0, 3,  0, 5]
# ==============================================================================
relu:
    li t0, 1             
    blt a1, t0, error     
    li t1, 0             

loop_start:
    # Loop until all elements are processed
    bge t1, a1, end       # If index t1 >= array length, exit loop

    # Calculate the address of the current element
    slli t2, t1, 2        # Multiply index by 4 to get byte offset (each element is 4 bytes)
    add t3, a0, t2        # Add offset to array base address (a0), store in t3
    lw t0, 0(t3)          # Load the current element into t0

    # Apply ReLU: set to 0 if the element is negative
    blt t0, x0, set_zero  # If t0 < 0, jump to set_zero
    j next                # Otherwise, skip to next element

set_zero:
    sw x0, 0(t3)          # Store 0 at the current element's address if it was negative

next:
    addi t1, t1, 1        # Increment index to process the next element
    j loop_start          # Repeat the loop

end:
    jr ra                 # Return to the caller

error:
    li a0, 36          
    j exit          

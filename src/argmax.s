.globl argmax

.text
# =================================================================
# FUNCTION: Maximum Element First Index Finder
#
# Scans an integer array to find its maximum value and returns the
# position of its first occurrence. In cases where multiple elements
# share the maximum value, returns the smallest index.
#
# Arguments:
#   a0 (int *): Pointer to the first element of the array
#   a1 (int):  Number of elements in the array
#
# Returns:
#   a0 (int):  Position of the first maximum element (0-based index)
#
# Preconditions:
#   - Array must contain at least one element
#
# Error Cases:
#   - Terminates program with exit code 36 if array length < 1
# =================================================================
argmax:
    li t6, 1
    blt a1, t6, handle_error

    lw t0, 0(a0)
    li t1, 0  #Position of the first maximum element (0-based index)
    li t5, 0
loop_start:
    # TODO: Add your own implementation
    bge t1, a1, end         # If t1 (current index) is equal to or greater than a1 (array length), end the loop
    slli t3, t1, 2          # Calculate the byte offset of the current element (t1 * 4)
    add t3, a0, t3          # Calculate the address of the current element by adding offset to base address in a0
    lw t4, 0(t3)            # Load the current element into t4
    bge t0, t4, next        # If t0 (current maximum) is greater than or equal to t4, skip to next iteration
    mv t0, t4               # Update t0 with the new maximum value
    mv t5, t1               # Update t5 with the index of the new maximum element
next:
    addi t1, t1, 1          # Increment the index t1
    j loop_start            # Jump back to start of the loop
end:
    mv a0, t5 
    jr ra
handle_error:
    li a0, 36
    j exit

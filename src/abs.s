.globl abs

.text
# =================================================================
# FUNCTION: Absolute Value Converter
#
# Transforms any integer into its absolute (non-negative) value by
# modifying the original value through pointer dereferencing.
# For example: -5 becomes 5, while 3 remains 3.
#
# Args:
#   a0 (int *): Memory address of the integer to be converted
#
# Returns:
#   None - The operation modifies the value at the pointer address
# =================================================================
abs:
    # Prologue
    ebreak
    # Load number from memory
    lw t0 0(a0)
    bge t0, zero, done

    # TODO: Add your own implementation
    li t1,                  # Load the value -1 into register t1 to create a bitwise mask
    xor t0, t0, t1          # Perform bitwise NOT by XORing t0 with -1 (two's complement inversion)
    addi t0, t0, 1          # Add 1 to complete two's complement conversion, making the integer positive
    sw t0, 0(a0)            # Store the result back to the memory address in a0
done:
    # Epilogue
    jr ra

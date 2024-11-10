# Assignment 2: Classify
The RISC-V calling convention is crucial in this HW2, so I’ve spent most of my time learning and implementing it, especially with regard to the stack.
## Part A : Mathematical Functions
### Task 0: Multiply
1. Extract their signsfirst.
2. Then, sort them to reduce the number of additions needed.
3. Use addition to perform multiplication.
4. Finally, combine the sign with the value.

### Task 1: ReLU
$$ReLU(a) = max(a, 0)$$
1. Calculate the address of the current element.
2. Apply ReLU: set to 0 if the element is negative.
3. Repeat the loop until the entire array has been processed.

### Task 2: ArgMax
1. Calculate the address of the current element.
2. Check if the current element is greater than the maximum element.
3. If true, update the index to reflect the position of the largest element.
4. Repeat the loop until the entire array has been processed.

### Task 3.1: Dot Product
$$dot(a,b) = \Sigma_{i=0}^{n-1} (a_i,b_j)$$
1. Calculate offset for current element in first array.
2. Calculate offset for current element in second array.
3. Multiply the two values and add to result accumulator.

## Part B : File Operations and Main
### Task 1: Read Matrix
1. Replace the ``mul`` instructions with the RV32I.

### Task 2: Write Matrix
1. Replace the ``mul`` instructions with the RV32I.

## Task 3: Classification
1. Matrix Multiplication:
**hidden_layer = matmul(m0,input)**
2. ReLU Activation:
**relu(hidden_layer)**
3. Second Matrix Multiplication:
**socres = matmul(m1,hidden_layer)**
4. Classification:
Call ``armax`` to find the index of the highest score.

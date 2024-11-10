# Assignment 2: Classify
```
             _   _   _   _            _____   __      __  ____    ___    _____ 
     /\     | \ | | | \ | |          |  __ \  \ \    / / |___ \  |__ \  |_   _|
    /  \    |  \| | |  \| |  ______  | |__) |  \ \  / /    __) |    ) |   | |       |\_/|
   / /\ \   | . ` | | . ` | |______| |  _  /    \ \/ /    |__ <    / /    | |       `o.o'
  / ____ \  | |\  | | |\  |          | | \ \     \  /     ___) |  / /_   _| |_      =(_)=
 /_/    \_\ |_| \_| |_| \_|          |_|  \_\     \/     |____/  |____| |_____|       U
```
## Advisor
Jserv (Ching-Chun Huang)

## Introduction
I will implement various matrix and vector operations, such as matrix multiplication. These functions will serve as the building blocks for constructing a simple Artificial Neural Network (ANN) capable of classifying handwritten digits. 

### Note
The RISC-V calling convention is crucial in this HW2, so I’ve spent most of my time learning and implementing it.

### Warning!!
I use ChatGPT 4.0 to enhance the expressiveness of my English and to add clear, insightful comments to my code.

### HackMD
[Assignment2: Complete Applications](https://hackmd.io/igwvkHa1TMyvtc_bcri4Lg)

## Part A : Mathematical Functions
### Task 0: Multiply
1. Extract their signs first.
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

### Task 3.2: Matrix Multiplication
$$C[i][j]=dot(A[i],B[:,j])$$
1. inner_loop_end: Calculate the address of the next row.
2. outer_loop_end: Restore the stack.

## Part B : File Operations and Main
### Task 1: Read Matrix
1. Replace the ``mul`` instruction with the RV32I instructions.

### Task 2: Write Matrix
1. Replace the ``mul`` instruction with the RV32I instructions.

### Task 3: Classification
1. Matrix Multiplication:
**hidden_layer = matmul(m0,input)**
2. ReLU Activation:
**relu(hidden_layer)**
3. Second Matrix Multiplication:
**socres = matmul(m1,hidden_layer)**
4. Classification:
Call ``armax`` to find the index of the highest score.

## Result
```
beethovenjoker@Ubuntu22:~/Desktop/Computer-Architecture-2024-NCKU-HW2$ bash test.sh all
test_abs_minus_one (__main__.TestAbs) ... ok
test_abs_one (__main__.TestAbs) ... ok
test_abs_zero (__main__.TestAbs) ... ok
test_argmax_invalid_n (__main__.TestArgmax) ... ok
test_argmax_length_1 (__main__.TestArgmax) ... ok
test_argmax_standard (__main__.TestArgmax) ... ok
test_chain_1 (__main__.TestChain) ... ok
test_classify_1_silent (__main__.TestClassify) ... ok
test_classify_2_print (__main__.TestClassify) ... ok
test_classify_3_print (__main__.TestClassify) ... ok
test_classify_fail_malloc (__main__.TestClassify) ... ok
test_classify_not_enough_args (__main__.TestClassify) ... ok
test_dot_length_1 (__main__.TestDot) ... ok
test_dot_length_error (__main__.TestDot) ... ok
test_dot_length_error2 (__main__.TestDot) ... ok
test_dot_standard (__main__.TestDot) ... ok
test_dot_stride (__main__.TestDot) ... ok
test_dot_stride_error1 (__main__.TestDot) ... ok
test_dot_stride_error2 (__main__.TestDot) ... ok
test_matmul_incorrect_check (__main__.TestMatmul) ... ok
test_matmul_length_1 (__main__.TestMatmul) ... ok
test_matmul_negative_dim_m0_x (__main__.TestMatmul) ... ok
test_matmul_negative_dim_m0_y (__main__.TestMatmul) ... ok
test_matmul_negative_dim_m1_x (__main__.TestMatmul) ... ok
test_matmul_negative_dim_m1_y (__main__.TestMatmul) ... ok
test_matmul_nonsquare_1 (__main__.TestMatmul) ... ok
test_matmul_nonsquare_2 (__main__.TestMatmul) ... ok
test_matmul_nonsquare_outer_dims (__main__.TestMatmul) ... ok
test_matmul_square (__main__.TestMatmul) ... ok
test_matmul_unmatched_dims (__main__.TestMatmul) ... ok
test_matmul_zero_dim_m0 (__main__.TestMatmul) ... ok
test_matmul_zero_dim_m1 (__main__.TestMatmul) ... ok
test_read_1 (__main__.TestReadMatrix) ... ok
test_read_2 (__main__.TestReadMatrix) ... ok
test_read_3 (__main__.TestReadMatrix) ... ok
test_read_fail_fclose (__main__.TestReadMatrix) ... ok
test_read_fail_fopen (__main__.TestReadMatrix) ... ok
test_read_fail_fread (__main__.TestReadMatrix) ... ok
test_read_fail_malloc (__main__.TestReadMatrix) ... ok
test_relu_invalid_n (__main__.TestRelu) ... ok
test_relu_length_1 (__main__.TestRelu) ... ok
test_relu_standard (__main__.TestRelu) ... ok
test_write_1 (__main__.TestWriteMatrix) ... ok
test_write_fail_fclose (__main__.TestWriteMatrix) ... ok
test_write_fail_fopen (__main__.TestWriteMatrix) ... ok
test_write_fail_fwrite (__main__.TestWriteMatrix) ... ok
----------------------------------------------------------------------
Ran 46 tests in 176.965s
```

## Reference
- [Assignment2: Complete Applications](https://hackmd.io/@sysprog/2024-arch-homework2)
- [CMU CS61C](https://cs61c.org/fa24/labs/lab03/)










OK
```

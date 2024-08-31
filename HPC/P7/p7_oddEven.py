import numpy as np
import numba
from numba import cuda

N = 1024
# CUDA kernel for odd-even sort
@cuda.jit
def odd_even_sort_kernel(arr):
    n = arr.shape[0]
    is_sorted = 0
    phase = 0

    while not is_sorted:
        is_sorted = 1
        cuda.syncthreads()

        # Odd phase
        if phase % 2 == 0:
            for i in range(1, n-1, 2):
                if arr[i] > arr[i+1]:
                    arr[i], arr[i+1] = arr[i+1], arr[i]
                    is_sorted = 0
        else:
            # Even phase
            for i in range(0, n-1, 2):
                if arr[i] > arr[i+1]:
                    arr[i], arr[i+1] = arr[i+1], arr[i]
                    is_sorted = 0

        phase += 1

# Helper function to launch CUDA kernel
def cuda_odd_even_sort(arr):
    # Move array to device
    d_arr = cuda.to_device(arr)

    # Calculate block size
    block_size = 256
    num_blocks = (arr.shape[0] + block_size - 1) // block_size

    # Launch kernel
    odd_even_sort_kernel[num_blocks, block_size](d_arr)

    # Copy sorted array back to host
    d_arr.copy_to_host(arr)

# Main function to test CUDA sorting
def test_cuda_sort():
    # Generate random array with more than 10000 elements
    n = N
    arr = np.random.randint(0, 100, n).astype(np.int32)

    # Sort using CUDA
    cuda_odd_even_sort(arr)

    return arr

# Test CUDA sorting
sorted_arr_cuda = test_cuda_sort()
print("Sorted Array (CUDA):", sorted_arr_cuda)


# Serial implementation of odd-even sort
def odd_even_sort_serial(arr):
    n = len(arr)
    is_sorted = False

    while not is_sorted:
        is_sorted = True
        for i in range(0, n-1, 2):
            if arr[i] > arr[i+1]:
                arr[i], arr[i+1] = arr[i+1], arr[i]
                is_sorted = False
        for i in range(1, n-1, 2):
            if arr[i] > arr[i+1]:
                arr[i], arr[i+1] = arr[i+1], arr[i]
                is_sorted = False

# Main function to test serial sorting
def test_serial_sort():
    # Generate random array with more than 10000 elements
    n = N
    arr = np.random.randint(0, 100, n).astype(np.int32)

    # Sort using serial implementation
    odd_even_sort_serial(arr)

    return arr

# Test serial sorting
sorted_arr_serial = test_serial_sort()
print("Sorted Array (Serial):", sorted_arr_serial)


import time

# Measure CUDA sorting time
start_time_cuda = time.time()
sorted_arr_cuda = test_cuda_sort()
end_time_cuda = time.time()
cuda_time = end_time_cuda - start_time_cuda

# Measure serial sorting time
start_time_serial = time.time()
sorted_arr_serial = test_serial_sort()
end_time_serial = time.time()
serial_time = end_time_serial - start_time_serial

# Print execution times
print("CUDA Sorting Time:", cuda_time, "seconds")
print("Serial Sorting Time:", serial_time, "seconds")

import multiprocessing
import numpy as np
import random

def generate_random_vector(n):
    return [random.randint(1, 10) for _ in range(n)]

def compute_dot_product(a, b, result_queue):
    dot_product = np.dot(a, b)
    result_queue.put(('Dot product', dot_product))

def compute_cross_product(a, b, result_queue):
    cross_product = np.cross(a, b)
    result_queue.put(('Cross product', cross_product))

if __name__ == "__main__":
    # Example N-element vector arrays
    N = 3
    # a = np.array([1, 2, 3])
    # b = np.array([4, 5, 6])
    a = generate_random_vector(N)
    b = generate_random_vector(N)

    # Print the generated vectors
    print(f"Vector a: {a}")
    print(f"Vector b: {b}")

    # Split the arrays into halves for parallel computation
    half_N = N // 2
    a1, a2 = a[:half_N], a[half_N:]
    b1, b2 = b[:half_N], b[half_N:]

    # Create a multiprocessing queue to store results
    result_queue = multiprocessing.Queue()

    # Create parallel processes for dot and cross product computations
    dot_process = multiprocessing.Process(target=compute_dot_product, args=(a, b, result_queue))
    cross_process = multiprocessing.Process(target=compute_cross_product, args=(a, b, result_queue))

    # Start the processes
    dot_process.start()
    cross_process.start()

    # Wait for processes to finish
    dot_process.join()
    cross_process.join()

    # Retrieve results from the queue
    results = []
    while not result_queue.empty():
        results.append(result_queue.get())

    # Display the results
    for result_type, result_value in results:
        print(f"{result_type}: {result_value}")

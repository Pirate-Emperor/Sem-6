import threading
import multiprocessing
import random

def generate_random_vector(n):
    return [random.randint(1, 10) for _ in range(n)]

def compute_partial_dot_product(start, end, result, a, b):
    partial_sum = 0
    for i in range(start, end):
        partial_sum += a[i] * b[i]
    result.append(partial_sum)

def parallel_dot_product(a, b, num_threads):
    n = len(a)
    step = n // num_threads
    result = []
    threads = []
    for i in range(num_threads):
        start = i * step
        end = (i + 1) * step if i < num_threads - 1 else n
        thread = threading.Thread(target=compute_partial_dot_product, args=(start, end, result, a, b))
        threads.append(thread)
        thread.start()

    for thread in threads:
        thread.join()

    dot_product = sum(result)
    return dot_product


def compute_cross_product(start, end, a, b, result):
    for i in range(start, end):
        result[i] = a[i] * b[i]

def parallel_cross_product(a, b):
    n = len(a)
    result = multiprocessing.Array('d', n) 

    num_processes = multiprocessing.cpu_count()
    chunk_size = n // num_processes

    processes = []

    for i in range(num_processes):
        start = i * chunk_size
        end = (i + 1) * chunk_size if i != num_processes - 1 else n
        process = multiprocessing.Process(target=compute_cross_product, args=(start, end, a, b, result))
        processes.append(process)

    for process in processes:
        process.start()

    for process in processes:
        process.join()

    return list(result)


if __name__ == "__main__":
    N = 10
    a = generate_random_vector(N)
    b = generate_random_vector(N)

    print(f"Vector a: {a}")
    print(f"Vector b: {b}")

    num_threads = 2

    result = parallel_cross_product(a, b)
    print(f"Cross product: {result}")
    result = parallel_dot_product(a, b, num_threads)
    print(f"Dot Product: {result}")


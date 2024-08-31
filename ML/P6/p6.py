# Step 1: Search relevant datasets (MNIST) from Hugging Face

from datasets import load_dataset

# Load MNIST dataset from Hugging Face
mnist_dataset = load_dataset("mnist")

# Extract training and testing data
train_data = mnist_dataset['train']
test_data = mnist_dataset['test']

# Display basic information about the dataset
print(train_data.info)

# Step 2: Classify handwritten digits using a simple neural network with only input and output layers

import tensorflow as tf
from tensorflow.keras import layers, models

# Define the model
model_simple = models.Sequential([
    layers.Flatten(input_shape=(28, 28)),  # Input layer
    layers.Dense(10, activation='softmax')  # Output layer
])

# Compile the model
model_simple.compile(optimizer='adam', 
                     loss='sparse_categorical_crossentropy',
                     metrics=['accuracy'])

# Train the model
model_simple.fit(train_data['image'], train_data['label'], epochs=5)

# Evaluate the model on the test set
test_loss, test_acc = model_simple.evaluate(test_data['image'], test_data['label'])
print(f"Simple Model - Test Accuracy: {test_acc}")

# Step 3: Add a hidden layer and assess performance

# Define the model with a hidden layer
model_with_hidden = models.Sequential([
    layers.Flatten(input_shape=(28, 28)),  # Input layer
    layers.Dense(128, activation='relu'),    # Hidden layer
    layers.Dense(10, activation='softmax')   # Output layer
])

# Compile the model
model_with_hidden.compile(optimizer='adam', 
                          loss='sparse_categorical_crossentropy',
                          metrics=['accuracy'])

# Train the model
model_with_hidden.fit(train_data['image'], train_data['label'], epochs=5)

# Evaluate the model with a hidden layer on the test set
test_loss_hidden, test_acc_hidden = model_with_hidden.evaluate(test_data['image'], test_data['label'])
print(f"Model with Hidden Layer - Test Accuracy: {test_acc_hidden}")

# Step 4: Apply various activation functions

# List of activation functions to try
activation_functions = ['relu', 'sigmoid', 'tanh']

for activation_function in activation_functions:
    # Define the model with different activation functions
    model_activation = models.Sequential([
        layers.Flatten(input_shape=(28, 28)),  # Input layer
        layers.Dense(128, activation=activation_function),  # Hidden layer
        layers.Dense(10, activation='softmax')  # Output layer
    ])
    
    # Compile the model
    model_activation.compile(optimizer='adam', 
                             loss='sparse_categorical_crossentropy',
                             metrics=['accuracy'])
    
    # Train the model
    model_activation.fit(train_data['image'], train_data['label'], epochs=5)
    
    # Evaluate the model with different activation functions on the test set
    test_loss_activation, test_acc_activation = model_activation.evaluate(test_data['image'], test_data['label'])
    print(f"Model with {activation_function.capitalize()} Activation - Test Accuracy: {test_acc_activation}")

# Step 5: Apply various cost functions

# List of cost functions to try
cost_functions = ['sparse_categorical_crossentropy', 'categorical_crossentropy', 'binary_crossentropy']

for cost_function in cost_functions:
    # Define the model with different cost functions
    model_cost = models.Sequential([
        layers.Flatten(input_shape=(28, 28)),  # Input layer
        layers.Dense(128, activation='relu'),  # Hidden layer
        layers.Dense(10, activation='softmax')  # Output layer
    ])
    
    # Compile the model with different cost functions
    model_cost.compile(optimizer='adam', 
                       loss=cost_function,
                       metrics=['accuracy'])
    
    # Train the model
    model_cost.fit(train_data['image'], train_data['label'], epochs=5)
    
    # Evaluate the model with different cost functions on the test set
    test_loss_cost, test_acc_cost = model_cost.evaluate(test_data['image'], test_data['label'])
    print(f"Model with {cost_function.capitalize()} Loss - Test Accuracy: {test_acc_cost}")

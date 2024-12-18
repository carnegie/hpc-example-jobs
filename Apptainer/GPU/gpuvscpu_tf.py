#This code is a test displaying the difference of a TensorFlow operation on both a CPU and a GPU
#This code is an example from the Euro National Competence Center Sweden (ENCCS): https://github.com/ENCCS

# Check our container image and hardware is in line
import tensorflow as tf
print("Num of GPUs Available: ", len(tf.config.list_physical_devices('GPU')))
print("TensorFlow version: ", tf.__version__)

tf.config.list_physical_devices()

# Tensorflow will always default to using a GPU if at least one is found present
x = tf.random.uniform([3, 3])
x.device

print("Is the Tensor on CPU #0:  "),
print(x.device.endswith('CPU:0'))
print('')
print("Is the Tensor on GPU #0:  "),
print(x.device.endswith('GPU:0'))

# Tensorflow operations for add and mul
import time
def time_matadd(x):
  start = time.time()
  for loop in range(10):
      tf.add(x, x)
  result = time.time()-start
  print("Matrix addition (10 loops): {:0.2f}ms".format(1000*result))

def time_matmul(x):
  start = time.time()
  for loop in range(10):
      tf.matmul(x, x)
  result = time.time()-start
  print("Matrix multiplication (10 loops): {:0.2f}ms".format(1000*result))

# Run on CPU
print("On CPU:")
with tf.device("CPU:0"):
  x = tf.random.uniform([1000, 1000])
  assert x.device.endswith("CPU:0")
  time_matadd(x)
  time_matmul(x)

# Run on GPU
if tf.config.experimental.list_physical_devices("GPU"):
  print("On GPU:")
  with tf.device("GPU:0"):
    x = tf.random.uniform([1000, 1000])
    assert x.device.endswith("GPU:0")
    time_matadd(x)
    time_matmul(x)
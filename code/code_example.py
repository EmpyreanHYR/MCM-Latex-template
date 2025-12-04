"""
--------------------------------------------------------------------------
File Name: code_example.py
Description: This is a Python code example.

Software Information:
- Python Version: 3.10
- Operating System: Windows 10
- Libraries Used: NumPy, Pandas, Matplotlib
--------------------------------------------------------------------------
"""

# Here is the actual code of the Python script
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

for i in range(1,5):
    for j in range(1,5):
        for k in range(1,5):
            if( i != k ) and (i != j) and (j != k):
                print (i,j,k)
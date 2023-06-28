"""
An example Python file which creates random data and exports it to a location specified
by way of a 
"""
import sys

import numpy as np
import pandas as pd

# take an input from sys argsv
output_file = sys.argv[1]

# setup some rows
nrows = 10000
ncols = 500

# form a dataframe using randomized data
df = pd.DataFrame(
    np.random.rand(nrows, ncols), columns=[f"col_{num}" for num in range(0, ncols)]
)

# export the data to parquet
df.to_csv(output_file)

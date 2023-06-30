"""
An example Python file which creates random data and exports it to a location specified
by way of a
"""
import argparse

import numpy as np
import pandas as pd

# gather named input from argparse
parser = argparse.ArgumentParser()
parser.add_argument("--CSV_FILENAME", help="A filepath for storing a CSV data file.")
args = parser.parse_args()

# setup some rows
NROWS = 10000
NCOLS = 500

# form a dataframe using randomized data
df = pd.DataFrame(
    np.random.rand(NROWS, NCOLS), columns=[f"col_{num}" for num in range(0, NCOLS)]
)

# export the data to parquet
df.to_csv(args.CSV_FILENAME)

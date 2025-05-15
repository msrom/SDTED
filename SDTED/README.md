# SDTED Calculator
A SDTED calculator among several graphs that leverages a modification of the Generalized Weisfeiler-Lehman Graph Kernel.

## Dependencies
Python3.8
* numpy==1.19.1
* networkx==2.2
* POT==0.7.0
* scikit_learn==0.24.1

## Run the code (Example)
The following command runs the script on the Dataset, called "CUSTOM" formed by the 10 different graphs. Parameter h is optional and determines the maximum tree depth
`python main.py Data/CUSTOM --h 4`

Arguments are as follows:
```
positional arguments:
  dataset     Path to dataset

optional arguments:
  -h, --help  show this help message and exit
```

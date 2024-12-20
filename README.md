# SDTED Calculator
A SDTED calculator among several graphs that leverages Generalized Weisfeiler-Lehman Graph Kernel

## Dependencies (Python 3.8)
* numpy==1.19.1
* networkx==2.2
* POT==0.7.0
* scikit_learn==0.24.1

## Creation of the graph dataset
The graph dataset evaluated in the publication is created on ```create_csutom_graph_dataset.ipynb```

## Run the code (Example)
Navigate to SDTED folder. After that, the following command runs the script on the Dataset, called "CUSTOM" formed by the 10 different graphs. Parameter h is optional and determines the maximum tree depth
`python main.py Data/CUSTOM --h 2`

Additional arguments are as follows:
```
positional arguments:
  dataset     Path to dataset

optional arguments:
  -h, --help  show this help message and exit
```

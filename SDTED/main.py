import numpy as np
import GraphDataToGraphList as gc
import pandas as pd
import numpy as np
from GraphSet import GraphSet
import argparse
import time
import warnings
import math
warnings.filterwarnings("ignore", category=DeprecationWarning)


def mat_to_df(mat):
    dict_mat = {}
    for index, row in enumerate(mat):
        if index == 0:
            dict_mat["G_base"] = row
        else:
            dict_mat["G_" + str(index)] = row

    arr_nombres = ["G_base"]
    for i in range(1, len(mat)):
        arr_nombres.append("G_" + str(i))
    df = pd.DataFrame(dict_mat, columns=arr_nombres)
    df.index = arr_nombres
    return df

def vec_to_df(vec):
    dict_vec = {}
    for index, row in enumerate(vec):
        if index == 0:
            dict_vec["G_base"] = [row]
        else:
            dict_vec["G_" + str(index)] = [row]

    arr_nombres = ["G_base"]
    for i in range(1, len(vec)):
        arr_nombres.append("G_" + str(i))
    df = pd.DataFrame(dict_vec, columns=arr_nombres, index=["G_base"])
    return df

def print_mat(matriz):

    num_columnas = len(matriz[0])
    print(" ", end="\t")
    for col in range(num_columnas):
        print(f"{col}", end="\t")
    print()

    for i, fila in enumerate(matriz):
        print(f"{i}", end="\t") 
        for elemento in fila:
            print(elemento, end="\t")
        print()


def get_distance_matrix(graphset, h_max):

    for i in range(1,h_max):
        graphset.compute_next_gen_labels_type1(compute_pairwise_dists=True)

    graphset.compute_next_gen_labels_type1(compute_pairwise_dists=False)
    
    dist_mat = graphset.get_Vts(h_max)
    df_dist = vec_to_df(dist_mat)
    df_dist.to_csv('Distance_Matrix.csv', index = True, encoding='utf-8') 
    return 

def SDTED(dataset_path, h_max=4):
    start_time = time.time()

    graph_data = gc.graph_data_to_graph_list(dataset_path)
    graphset = GraphSet(graph_data)
    get_distance_matrix(graphset, h_max)

    finish_time = (time.time() - start_time)*1000
    #print("--- %s miliseconds ---" % (finish_time))
    with open("time.txt", "w") as f:
        f.write(str(finish_time))

def main():
    parser = argparse.ArgumentParser(description='Structure and Depth Preserving Tree Edit Distance')
    parser.add_argument('dataset', type=str, help='Path to dataset')
    parser.add_argument('--h', type=int, required=False, default=4, help='Max. unfolding tree depth')
    args = parser.parse_args()
    
    dataset_path = args.dataset
    h_max = args.h
    SDTED(dataset_path, h_max)
    

if __name__ == "__main__":
    main()



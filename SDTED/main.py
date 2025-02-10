import numpy as np
import GraphDataToGraphList as gc
import pandas as pd
import numpy as np
from GraphSet import GraphSet
import argparse
import time
import warnings
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
    df_dist = mat_to_df(dist_mat)
    df_dist.to_csv('Distance_Matrix.csv', index = True, encoding='utf-8') 
    print("Distances Matrix")
    print(df_dist)
    
    list_dist = df_dist.iloc[0].tolist()

    # Normalize by empty graph distance (if distance is greater, then it's similarity is 0)
    norm_list = [1 - min(x / list_dist[-1], 1) for x in list_dist][1:]

    avg = np.mean(norm_list)
    quart = np.percentile(norm_list, [3,5,10,25, 50, 75, 90, 95, 98])
    print(avg)
    print(quart)
    print(norm_list)
    print(list_dist)
    return 


def main():
    parser = argparse.ArgumentParser(description='Structure and Depth Preserving Tree Edit Distance')
    parser.add_argument('dataset', type=str, help='Path to dataset')
    parser.add_argument('--h', type=int, required=False, default=3, help='Max. unfolding tree depth')
    args = parser.parse_args()
    
    dataset_path = args.dataset
    h_max = args.h

    graph_data = gc.graph_data_to_graph_list(dataset_path)
    graphset = GraphSet(graph_data)
    get_distance_matrix(graphset, h_max)
    

if __name__ == "__main__":
    start_time = time.time()
    main()
    print("--- %s miliseconds ---" % ((time.time() - start_time)*1000))


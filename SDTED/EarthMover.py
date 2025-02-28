import numpy as np
import ot
import pandas as pd

conc_dist_mat = None
path_file_types = "SDTED/Data/CUSTOM/CUSTOM_node_types.txt"
path_file_ids = "SDTED/Data/CUSTOM/CUSTOM_node_ids.txt"

class EarthMover:
    
    # INFO: the last entry in matrices is the empty label/graph
    
    def __init__(self, initial_lbl_list, cost_a, cost_b, cost_c):
        self.initial_lbl_list = initial_lbl_list
        self.initial_dist_mat = self.get_initial_distance_matrix(initial_lbl_list, cost_a, cost_b, cost_c)
    
    # define initial pairwise distances in matrix with cost_a being cost for insertion and removal and cost_b cost for renaming
    def get_initial_distance_matrix(self, lbl_list, cost_a, cost_b, cost_c):
        dict_type_from_csv = pd.read_csv(path_file_types, header=None, index_col=0, squeeze=True).to_dict()
        dict_ids_from_csv = pd.read_csv(path_file_ids, header=None, index_col=0, squeeze=True).to_dict()

        size = len(lbl_list)+1  
        dist_mat = np.full((size,size), cost_a)
        for i in range(size-1):
            for j in range(size-1):
                if i == j:
                    dist_mat[i,j] = 0
                else:
                    coste_cel = 0
                    if dict_ids_from_csv[lbl_list[i]] != dict_ids_from_csv[lbl_list[j]]:
                        coste_cel += cost_b
                    if dict_type_from_csv[lbl_list[i]] != dict_type_from_csv[lbl_list[j]]:
                        coste_cel += cost_c 
                    dist_mat[i, j] = coste_cel
        dist_mat[size-1][size-1] = 0

        return dist_mat
    

    def get_next_generation(self, child_lbl_list, child_dist_mat, conc_lbl_list, compute_pairwise_dists):
        
        center_sparse_vectors = []
        label_clusters = []
        child_min_idx = min(child_lbl_list)
        vec_upper_size = len(self.initial_dist_mat)

        m1_size = len(self.initial_dist_mat)
        m4_size = len(child_dist_mat)

        #nmb_inf = 1 * np.max(child_dist_mat)
        nmb_inf = 10
        M1 = self.initial_dist_mat
        M2 = np.full((m1_size,m4_size), nmb_inf)
        M3 = np.full((m4_size,m1_size), nmb_inf)
        M4 = child_dist_mat
        M1cM2 = np.concatenate((M1,M2), axis=1)
        M3cM4 = np.concatenate((M3,M4), axis=1)
        global conc_dist_mat 
        conc_dist_mat = np.concatenate((M1cM2,M3cM4), axis=0)
        
        # setup sparse vectors from concatenation labels
        sparse_vectors = []
        for conc_lbl in conc_lbl_list:
                lbl, children = conc_lbl
                sparse_vec = {}
                sparse_vec[self.initial_lbl_list.index(lbl)] = 1
                for c in children:
                    nidx = c - child_min_idx + vec_upper_size
                    sparse_vec.setdefault(nidx, 0) 
                    sparse_vec[nidx] += 1
                sparse_vec = list(sparse_vec.items())
                sparse_vectors.append(sparse_vec)

        center_sparse_vectors = sparse_vectors
        label_clusters = []
        for conc_lbl in conc_lbl_list:
            label_clusters.append([conc_lbl])
                        
        # add empty label vector
        vec_upper_size = len(self.initial_dist_mat)
        empty_sparse_vec = [(vec_upper_size-1, 1)]
        center_sparse_vectors.append(empty_sparse_vec)

        # compute and return the distance matrix for center vectors
        if not compute_pairwise_dists: return None, label_clusters
        next_gen_dist_mat = self.compute_pairwise_distances(center_sparse_vectors, center_sparse_vectors)

        return next_gen_dist_mat, label_clusters
                
            
    def compute_pairwise_distances(self, sparse_vectors_a, sparse_vectors_b):
        
        # check whether distance matrix is symmetric
        symmetric = (sparse_vectors_a == sparse_vectors_b)
        
        # compute pairwise distances between vectors
        dist_list = []
        for i,vec in enumerate(sparse_vectors_a):
            dist = calc_dist(i, vec, sparse_vectors_b, symmetric)
            dist_list.append(dist)

        # put together final distance matrix
        size_a = len(sparse_vectors_a)
        size_b = len(sparse_vectors_b)
        dist_mat = np.zeros((size_a, size_b))
        for e in dist_list:
            i,row = e
            dist_mat[i,:] = row
        if symmetric: 
            dist_mat += np.transpose(dist_mat)

        return dist_mat
    
def calc_dist(i, sparse_vec_i, center_sparse_vectors, symmetric):
    dist_row = (i, [0] * len(center_sparse_vectors))
    
    for j,sparse_vec_j in enumerate(center_sparse_vectors):
        if (symmetric and i<j) or (not symmetric): 

            relevant_idcs_vec_i = set(k[0] for k in sparse_vec_i)
            relevant_idcs_vec_j = set(k[0] for k in sparse_vec_j)

            relevant_idcs = list(relevant_idcs_vec_i.union(relevant_idcs_vec_j))
            relevant_idcs.append(len(conc_dist_mat)-1)
            relevant_idcs.sort(key=None, reverse=False)
            
            # setup vectors
            vec_i = np.zeros(len(relevant_idcs))
            for p in sparse_vec_i: 
                idx = relevant_idcs.index(p[0])
                vec_i[idx] = p[1]
            vec_j = np.zeros(len(relevant_idcs))
            for p in sparse_vec_j: 
                idx = relevant_idcs.index(p[0])
                vec_j[idx] = p[1]
            # pad vectors such that they have equal l1 norm
            vec_i_norm = np.sum(vec_i)
            vec_j_norm = np.sum(vec_j)
            if vec_i_norm < vec_j_norm: vec_i[-1] = vec_j_norm - vec_i_norm
            else: vec_j[-1] = vec_i_norm - vec_j_norm

            # project concatenation distance matrix     
            proj_conc_dist_mat = conc_dist_mat[np.ix_(relevant_idcs, relevant_idcs)] 

            dist, log = ot.emd2(vec_i, vec_j, proj_conc_dist_mat, log=True,return_matrix=True)
            dist_row[1][j] = dist
    return dist_row

    
    
    
    
    
    
    
            

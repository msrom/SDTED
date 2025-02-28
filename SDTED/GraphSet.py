import numpy as np
from Graph import Graph
from WeisfeilerLehmann import WeisfeilerLehmann
from EarthMover import EarthMover
import GlobalVariables
import ot

import networkx as nx

class GraphSet: 
    
    # constructor & attributes
    def __init__(self, graph_data):
        
        # setup a  WL dictionary object
        self.wl = WeisfeilerLehmann() 
        
        # WL dictionary for temporary purposes
        self.wl_temp = WeisfeilerLehmann() 
        
        # create set of graphs
        self.graph_set = []
        start_idx_counter = self.wl.idxc

        for nxgraph, glbl in zip(graph_data[0], graph_data[1]):
            g = Graph(nxgraph, glbl)
            self.graph_set.append(g)
            # set initial labels for nodes and save initial label list
            for node in g.get_nodes():
                lbl = self.wl.get_initial_label(nxgraph, node)
                g.add_node_label(node, lbl)
        end_idx_counter = self.wl.idxc
        initial_labels = list(range(start_idx_counter, end_idx_counter))
        # lists of all labels for each generation
        self.label_lists = []
        self.conc_label_lists = []
        self.label_lists.append(initial_labels)
        
        self.conc_label_graphs_lists = []
        self.em = EarthMover(initial_labels, GlobalVariables.cost_a, GlobalVariables.cost_b, GlobalVariables.cost_c) 
        self.dist_mats = []
        self.dist_mats.append(self.em.initial_dist_mat)   
        
    
    # return all concatenated labels of the next WL generation
    def get_next_gen_conc_label_list(self):
        conc_lbls = set()
        conc_lbls_graph = []
        for index, g in enumerate(self.graph_set):
            arr_conc_lbl_g = []
            for node in g.get_nodes():
                conc_lbl = g.get_next_gen_conc_label(node)
                # is a set, add adds if they don't exist already
                # in conc_lbls is a list of all wl tags
                conc_lbls.add(conc_lbl)

                arr_conc_lbl_g.append(conc_lbl)
            #conc_lbls_graph has the labels of each graph (even repeated)
            conc_lbls_graph.append(arr_conc_lbl_g)

        self.conc_label_graphs_lists.append(conc_lbls_graph)
        conc_lbls = list(conc_lbls)
        conc_lbls.sort(key=None, reverse=False)
        return conc_lbls


    def get_conc_dist_mat(self, child_dist_mat):

        # create distance matrix made up of the parent element distance matrix M1 and the child label distance matrix M4 and inf matrices M2, M3
        m1_size = len(self.em.initial_dist_mat)
        m4_size = len(child_dist_mat)
        # 10 is a number for determining a high penalization
        nmb_inf = 10
        M1 = self.em.initial_dist_mat
        M2 = np.full((m1_size,m4_size), nmb_inf)
        M3 = np.full((m4_size,m1_size), nmb_inf)
        M4 = child_dist_mat
        M1cM2 = np.concatenate((M1,M2), axis=1)
        M3cM4 = np.concatenate((M3,M4), axis=1)
        conc_dist_mat = np.concatenate((M1cM2,M3cM4), axis=0)
        return len(conc_dist_mat) - 1, conc_dist_mat
    
     
    def compute_next_gen_labels_type1(self, compute_pairwise_dists):
        conc_lbl_list = self.get_next_gen_conc_label_list()
        child_dist_mat = self.dist_mats[-1]
        child_lbl_list = self.label_lists[-1]
        next_gen_dist_mat, label_clusters = self.em.get_next_generation(child_lbl_list, child_dist_mat, conc_lbl_list, compute_pairwise_dists)
        next_gen_labels = self.wl.put_next_gen_labels(label_clusters)
        # add distance matrix and label lists
        self.label_lists.append(next_gen_labels)
        self.conc_label_lists.append(conc_lbl_list)
        self.dist_mats.append(next_gen_dist_mat)
        # adds the new labels to each graph
        for g in self.graph_set:
            for node in g.get_nodes():
                conc_lbl = g.get_next_gen_conc_label(node)
                next_gen_lbl = self.wl.get_next_gen_label(conc_lbl)
                g.add_node_label(node, next_gen_lbl)
    
    
    def get_Vts(self, h_max):

        conc_label_graphs_lists = self.conc_label_graphs_lists[-1]

        # child_dist_mat has the distance information between the different tree substructures
        child_dist_mat = self.dist_mats[-2]
        len_conc_dist_mat, conc_dist_mat = self.get_conc_dist_mat(child_dist_mat)
         
        child_lbl_list = self.label_lists[-2]
        child_min_idx = min(child_lbl_list)
        vec_upper_size = len(self.em.initial_dist_mat)

        sparse_vectors_graphs = []
        for conc_lbl_list in conc_label_graphs_lists:
            sparse_vec = {}
            for conc_lbl in conc_lbl_list:
                lbl, children = conc_lbl
                #Initially initial_lbl_list is the types of the nodes: [1,2,3].
                sparse_vec.setdefault(self.em.initial_lbl_list.index(lbl), 1)
                for c in children:
                    nidx = c - child_min_idx + vec_upper_size
                    sparse_vec.setdefault(nidx, 0) 
                    sparse_vec[nidx] += 1
            sparse_vec = list(sparse_vec.items())
            
            empty_sparse_vec = (vec_upper_size, 1)
            sparse_vec.append(empty_sparse_vec)
            sparse_vectors_graphs.append(sparse_vec)

        dist = get_dist_bis(0, sparse_vectors_graphs[0], sparse_vectors_graphs, True, len_conc_dist_mat, conc_dist_mat)
        return dist[1]
   
        
    def get_Vts_full_matrix(self, h_max):

        conc_label_graphs_lists = self.conc_label_graphs_lists[-1]

        # child_dist_mat has the distance information between the different tree substructures
        child_dist_mat = self.dist_mats[-2]
        len_conc_dist_mat, conc_dist_mat = self.get_conc_dist_mat(child_dist_mat)
         
        child_lbl_list = self.label_lists[-2]
        child_min_idx = min(child_lbl_list)
        vec_upper_size = len(self.em.initial_dist_mat)

        sparse_vectors_graphs = []
        for conc_lbl_list in conc_label_graphs_lists:
            sparse_vec = {}
            for conc_lbl in conc_lbl_list:
                lbl, children = conc_lbl
                #Initially initial_lbl_list is the types of the nodes: [1,2,3].
                sparse_vec.setdefault(self.em.initial_lbl_list.index(lbl), 1)
                sparse_vec[self.em.initial_lbl_list.index(lbl)] += 1
                for c in children:
                    nidx = c - child_min_idx + vec_upper_size
                    sparse_vec.setdefault(nidx, 0) 
                    sparse_vec[nidx] += 1
            sparse_vec = list(sparse_vec.items())
            
            empty_sparse_vec = (vec_upper_size, 1)
            sparse_vec.append(empty_sparse_vec)
            sparse_vectors_graphs.append(sparse_vec)

        dist_list = []
        for i,vec in enumerate(sparse_vectors_graphs):
            dist = get_dist_bis(i, vec, sparse_vectors_graphs, True, len_conc_dist_mat, conc_dist_mat)
            dist_list.append(dist)
        size_a = len(sparse_vectors_graphs)
        size_b = len(sparse_vectors_graphs)
        dist_mat = np.zeros((size_a, size_b))
        for e in dist_list:
            i,row = e
            dist_mat[i,:] = row
        dist_mat += np.transpose(dist_mat)

        return dist_mat


def get_dist_bis(i, sparse_vec_i, sparse_vectors_j, symmetric, len_conc_dist_mat, conc_dist_mat):
    dist_row = (i, [0] * len(sparse_vectors_j))
    for j,sparse_vec_j in enumerate(sparse_vectors_j):
        if (symmetric and i<j) or (not symmetric): 
            
            relevant_idcs_vec_i = set(k[0] for k in sparse_vec_i)
            relevant_idcs_vec_j = set(k[0] for k in sparse_vec_j)
            #relevant_idsc has the columns with value 1 or greater (the only ones to look at)
            relevant_idcs = list(relevant_idcs_vec_i.union(relevant_idcs_vec_j))
            relevant_idcs.append(len_conc_dist_mat)
            relevant_idcs.sort(key=None, reverse=False)
            
            # We count the number of times that each of the possible ids appears in our sparse vec.
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
            # projection concatenation distance matrix     
            proj_conc_dist_mat = conc_dist_mat[np.ix_(relevant_idcs, relevant_idcs)] 
            # calculate earth moving distance
            dist = ot.emd2(vec_i, vec_j, proj_conc_dist_mat)
            dist_row[1][j] = dist
    return dist_row
    
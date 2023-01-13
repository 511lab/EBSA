# EBSA
#Fast semi-supervised self-training algorithm based on data editing

We provide the codes, the datasets and results.

Abstract：Nowadays, there is a large amount of unlabeled data in many applications. To use the potential structural information of unlabeled data to improve the performance of the classifier, researchers have proposed many semi-supervised learning algorithms. Self-training is a commonly used semi-supervised learning algorithm framework. How to select the high-confidence samples is a crucial step for algorithms based on self-training framework. To alleviate the impact of noise data, researchers have proposed many data editing methods to improve the selection quality of high confidence samples. However, the state-of-the-art data editing methods have high time complexity, which is not less than O(n^2), where  n denotes the number of samples. To improve the training speed while ensuring the quality of the selected high-confidence samples, inspired by ball-k-means algorithm, we propose a fast semi-supervised self-training algorithm based on data editing termed EBSA, which defines ball-cluster partition and data editing to improve the quality of high-confidence samples. The time complexity of the proposed EBSA is O(t( 2kn + nlog n + n + k^2 )), where k denotes the number of centers, t denotes the number of iterates. k is far less than n, EBSA has a linear time complexity with respect to n. A large number of experiments on 20 benchmark data sets have been carried out and the experimental results show that the proposed algorithm not only ran faster, but also obtained better classification performance compared with the related SETRED, STDP-CEW, STDPNaN, and STDPNF. All the codes and data sets can be found on website https://github.com/511lab/EBSA.

# Set up
## Requirements
All the experiments were conducted with 32G RAM, 64-bit Windows 10 and Inter Core i9 processor. 
All the codes are implemented with MATLAB 2019b. 

In order to keep consistent with the comparison algorithms, the decision tree of version C4.5 is chosen as the base classifier. The operating parameters of the decision tree are as follows: the Gini diversity index is used as the division criterion for attribute division, the cluster name used in training and testing is consistent with the label of label set Y, and the priority of each class is set according to the class frequency in label set Y. When the nodes are subdivided, the number of samples of each node is required to be no less than 2. The number of all features is taken as the maximum number of features considered when dividing, and the maximum number of splits is the number of all samples in the data set minus one, that is, n - 1.

# Datasets
You can also download the datasets from
link: https://github.com/511lab/EBSA/datasets

## Results
#Classification performance results on our datasets:

https://github.com/511lab/EBSA/CLA_P

and
https://github.com/511lab/EBSA/CLA_image

#Noise experiment results on our datasets:

https://github.com/511lab/EBSA/NOISE

and
https://github.com/511lab/EBSA/NOISE_image

## Source Codes on Matlab are available at,   
https://github.com/511lab/EBSA/code

1.main.m # The main function of Classification performance.

2.Ntest.m # The main function of Noise experiment.

3.EBSA.m # The function of our proposed EBSA algorithm.

4.ECSG.m # The function of the High-confidence samples selection algorithm.

5.Random_sampling.m # The function of the Stratified sampling of the Classification performance.

6.noise_sampling.m # The function of the Sampling ratio of the Noise experiment.

(1) Classification performance

 Download the codes on https://github.com/511lab/EBSA/code, then run the main.m code.
 
(2) Noise experiment

Download the codes on https://github.com/511lab/EBSA/code, then run the Ntest.m code.

# Citation:
If you use our codes or datasets in your own research, the citation can be placed as:

@incollection{FERET,
  title={Discriminant analysis of principal components for face recognition},
  author={Zhao, Wenyi and Krishnaswamy, Arvindh and Chellappa, Rama and Swets, Daniel L and Weng, John},
  booktitle={Face Recognition},
  pages={73--85},
  year={1998},
  publisher={Springer}
}

@inproceedings{MSRA,
  title={Msra-mm 2.0: A large-scale web multimedia dataset},
  author={Li, Hao and Wang, Meng and Hua, Xian-Sheng},
  booktitle={2009 IEEE International Conference on Data Mining Workshops},
  pages={164--169},
  year={2009},
  organization={IEEE}
}

@article{bib43,
   author = {Martínez, Aleix and Benavente, Robert},
   title = {The AR face database, 1998},
   journal = {Computer vision center, technical report},
   volume = {3},
   number = {5},
   year = {2007},
   type = {Journal Article}
}

@article{bib45,
   author = {Aljalbout, Elie and Golkov, Vladimir and Siddiqui, Yawar and Strobel, Maximilian and Cremers, Daniel},
   title = {Clustering with deep learning: Taxonomy and new methods},
   journal = {arXiv preprint arXiv:1801.07648},
   year = {2018},
   type = {Journal Article}
}

@inproceedings{bib49,
   author = {Xu, Jinglin and Han, Junwei and Xiong, Kai and Nie, Feiping},
   title = {Robust and sparse fuzzy k-means clustering},
   booktitle = {IJCAI},
   pages = {2224-2230},
   year = {2016},
   type = {Conference Proceedings}
}

# Contact: 
For any problem about this dataset or codes, please contact Dr. Wang (wjkweb@163.com).



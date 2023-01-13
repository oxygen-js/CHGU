import numpy as np
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
matplotlib.style.use('ggplot')
from scipy.cluster.hierarchy import dendrogram, linkage, fcluster

import os

os.chdir("C:/Users/Kazak/Desktop/codes/CH_GU/python/laba_12/Customers")
df = pd.read_csv("segmentationdata.csv", sep=',')

link = linkage(df, 'ward', 'euclidean')
print(df.head())
print(link[:5])


dn = dendrogram(link, orientation="right")
dn


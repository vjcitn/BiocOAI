#import textwrap as tr
#from typing import List, Optional
#
#import matplotlib.pyplot as plt
#import plotly.express as px
#from scipy import spatial
#from sklearn.decomposition import PCA
#from sklearn.manifold import TSNE
#from sklearn.metrics import average_precision_score, precision_recall_curve
#
#from openai import OpenAI
#import numpy as np
#import pandas as pd
#

# necessary for python module control
bsklenv <- basilisk::BasiliskEnvironment(envname="bsklenv",
    pkgname="BiocOAI",
    packages=c("numpy=2.2.3", "python=3.12.5"), pip=c("pandas==2.2.3",
      "openai==1.66.3", "scikit-learn==1.6.1", "plotly==6.0.0",
      "matplotlib==3.10.1", "scipy==1.15.2", "tiktoken==0.9.0"))


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
    packages=c("numpy=2.1.0", "python=3.12.5"), pip=c("pandas==2.2.2",
      "openai==1.51.2", "scikit-learn==1.5.2", "plotly==5.24.1",
      "matplotlib==3.9.2", "scipy==1.14.1", "tiktoken==0.8.0"))


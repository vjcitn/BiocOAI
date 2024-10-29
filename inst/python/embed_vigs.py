import pandas as pd
import tiktoken

from utils.embeddings_utils import get_embedding

embedding_model = "text-embedding-3-large"
embedding_encoding = "cl100k_base" # check
max_tokens = 8000

input_datapath = "./simple.csv"

df = pd.read_csv(input_datapath, index_col=0)

df.head(2)

encoding = tiktoken.get_encoding(embedding_encoding)

df["n_tokens"] = df.vigs.apply(lambda x: len(encoding.encode(x)))
#print(df["n_tokens"])

df["embedding"] = df.vigs.apply(lambda x: get_embedding(x, model=embedding_model))
df.to_csv("vigs1_emb_large.csv")



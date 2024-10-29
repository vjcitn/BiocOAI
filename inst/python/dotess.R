library(BiocOAI)
#x = read.csv("vigs1_emb_large.csv")
#y = extract_emb_matrix("vigs1_emb_large.csv", "embedding")
library(uwot)
set.seed(1234)
uu = umap2(y, metric="cosine")
dd = data.frame(x[,1:4])
dd$umc1 = uu[,1]
dd$umc2 = uu[,2]
kk2 = kmeans(uu, 5)
plot(dd$umc1, dd$umc2, col=kk2$cluster)
text(dd$umc1, dd$umc2, labels=dd[,2])
#ggplot(dd, aes(x=umc1, y=umc2, text=pk, colour=factor(kk2$cluster))) + geom_point() -> z4
#ggplotly(z4)

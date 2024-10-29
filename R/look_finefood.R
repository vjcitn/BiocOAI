
#' path to gzipped 'small' embedding of 1000 reviews
#' @export
path_finefood_emb = function() {
 system.file("data/fine_food_reviews_with_embeddings_1k.csv.gz", package="BiocOAI")
}

#' path to gzipped 'large' embedding of 1000 reviews
#' @export
path_finefood_emb_large = function() {
 system.file("data/fine_food_reviews_with_embeddings_1k_large.csv.gz", package="BiocOAI")
}

#' fine food embedding as a matrix
#' @note Follows the notebook from `https://github.com/openai/openai-cookbook/blob/main/examples/Get_embeddings_from_dataset.ipynb`.  Used `text-embedding-3-small`.
#' @examples
#' full = read.csv(path_finefood_emb())
#' mat = get_finefood_emb_matrix()
#' pcs = prcomp(mat)
#' pairs(pcs$x[,1:4], pch=19, col=full$Score, cex=.3)
#' @export
get_finefood_emb_matrix = function() {
 x = read.csv(path_finefood_emb())
 strings = x[,9]
 g1 = gsub("\\[", "", strings)
 g2 = gsub("\\]", "", g1)
 g3 = strsplit(g2, ", ")
 g3 = lapply(g3, as.numeric)
 do.call(rbind, g3)
}

#' work with large embedding
#' @export
get_finefood_emb_matrix_large = function() {
 x = read.csv(path_finefood_emb_large())
 strings = x[,9]
 g1 = gsub("\\[", "", strings)
 g2 = gsub("\\]", "", g1)
 g3 = strsplit(g2, ", ")
 g3 = lapply(g3, as.numeric)
 do.call(rbind, g3)
}

#' extract matrix from csv emitted by embedding process
#' @param path character(1) path to csv
#' @param col any column index selecting the embedding strings in brackets
#' @note uses gsub to remove brackets and coerces to numeric
#' @export
extract_emb_matrix = function(path,col) {
 x = read.csv(path)
 strings = x[,col]
 g1 = gsub("\\[", "", strings)
 g2 = gsub("\\]", "", g1)
 g3 = strsplit(g2, ", ")
 g3 = lapply(g3, as.numeric)
 as.matrix(do.call(rbind, g3))
}

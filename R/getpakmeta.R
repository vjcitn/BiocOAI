simplify_views = function(x,n2keep=4) {
 tmp = strsplit(x$views, ", |,\\n")[[1L]]
 nv = length(tmp)
 use = seq_len(min(nv,n2keep))
 paste(tmp[use], collapse=":")
}

pack = function(x) {
 paste(readLines(x), collapse=" ")
}

getpackmeta = function(path, maxvnc=30000) {
 dpath = file.path(path, "DESCRIPTION")
 d = read.dcf(dpath)
 vpath = file.path(path, "vignettes")
 allv = dir(vpath, patt="Rmd|Rnw", full=TRUE)
 vcont = sapply(allv, pack)
 vnc = sapply(vcont, nchar)
 ans = data.frame(pkgname=basename(path), views=d[,"biocViews"], 
    vigs=substr(vcont, 1, maxvnc), vnc=vnc)
 rownames(ans) = NULL
 nv = simplify_views(ans)
 ans$views = nv
 ans
}

#' given a vector of names of packages at checked out at folder `base`,
#' produce a data.frame with columns `pkgname`, `views`, `vigs` and `vnc`,
#' which will have one row for each available Rnw or Rmd file in
#' the vignettes folder, and the packagename and biocViews
#' string in first two columns, all vignette content in
#' column `vigs`, and character count for each vignette in `vnc`.
#' @param base a path to location where package sources are checked out
#' @param pks character() vector of package names
#' @note The biocViews are presented as colon-delimited first four
#' views present in DESCRIPTION.  Some packages have extravagant
#' collections of views.  Vignette content is restricted to 30000 characters
#' per vignette so that number of tokens presented is bounded.
#' @export
labeled_vigs = function(base = ".", pks = c("DESeq2", "edgeR", 
   "tximeta", "parody", "flowWorkspace", "Rdisop",
   "glmGamPoi", "rhdf5", "Biostrings", "affy", "snpStats")) {
 xx = lapply(pks, function(x) getpackmeta(file.path(base, x)))
 do.call(rbind, xx)
}

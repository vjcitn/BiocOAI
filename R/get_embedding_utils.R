#' workaround for import problem on mac, get embedding utils from openAI cookbook
#' @import reticulate basilisk
#' @note this is just an illustration of how to use basilisk with local sourced python
#' @return a vector of names of functions available in this module
#' @examples
#' z = check_embeddings_utils()
#' z
#' @export
check_embeddings_utils = function() {
 proc = basilisk::basiliskStart(bsklenv)
 on.exit(basilisk::basiliskStop(proc))
 basilisk::basiliskRun(proc, function() {
  od = getwd()
  on.exit(setwd(od))
  setwd(system.file("python/utils", package="BiocOAI"))
  names(reticulate::import("embeddings_utils"))
  })
}
  

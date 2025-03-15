#' use openai embedding utility
#' @param txt character(), will be put through paste(, collapse=" ") for submission
#' @param model character(1) candidate for openai.Embedding.create model parameter
#' @return a list with elements ans (3072-vector of embedding coordinates) and usage (token counts)
#' @examples
#' # make sure key is available in env
#' if (interactive()) {
#'   txt = readLines(system.file("txt/demo.txt", package="BiocOAI"))
#'   tst = embed_text(txt)
#'   str(tst)
#' }
#' @export
embed_text = function(txt, model="text-embedding-3-large") {
  proc = basilisk::basiliskStart(bsklenv)
  on.exit(basilisk::basiliskStop(proc))
  basilisk::basiliskRun(proc, function(txt, model) {
  openai = reticulate::import("openai")
  txt = paste(txt, collapse = " ")
  cl = openai$Client()
  ans = cl$embeddings$create(input = txt, model = model)
  usage = jsonlite::fromJSON(ans$usage$json())
  list(vec=ans['data'][[1]]['embedding'], usage=usage)
  }, txt=txt, model=model)
}



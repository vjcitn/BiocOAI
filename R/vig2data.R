
#' use the extract_data facility of ellmer to obtain summary information about an html
#' document, tailored to vignettes in bioconductor
#' @import ellmer
#' @param url character(1) URL for an html bioconductor vignettes
#' @return a list with components author, topics, focused, coherence, and persuasion
#' @note Based on code from https://cran.r-project.org/web/packages/ellmer/vignettes/structured-data.html
#' March 15 2025.  Requires that OPENAI_API_KEY is available in environment.
#' @examples
#' if (interactive()) {
#' # be sure OPENAI_API_KEY is available to Sys.getenv
#' tst = vig2data()
#' str(tst)
#' }
#' @export
vig2data = function(url ="https://bioconductor.org/packages/release/bioc/html/Voyager.html") {
 html <- rvest::read_html(url)
 text <- rvest::html_text2(rvest::html_element(html, "body"))

 type_summary <- type_object(
  "Summary of the article.",
  author = type_array("Name of the article author(s)", type_string(),),
  topics = type_array(
    'Array of topics in the biosciences, e.g. ["DNA", "RNA", "chromosomal positions", "genes"]. Should be as specific as possible, and can overlap.',
    type_string(),
  ),
  focused = type_string("Provide a concise summary of the article using distinctive vocabulary that would be helpful for embedding the summarized content.  Avoid subjective judgmental commentary.  Avoid generalities about hypotheses and generic activities of data analysis.  Limit the summary to 450 words."),
  coherence = type_integer("Coherence of the article's key points, 0-100 (inclusive)"),
  persuasion = type_number("Article's persuasion score, 0.0-1.0 (inclusive)")
)

 chat <- chat_openai()
 chat$extract_data(text, type = type_summary)
}


activate <- function(.data, what) {
  UseMethod('activate')
}
#' @export
#' @importFrom rlang enquo quo_text
activate.bot <- function(.data, what) {
  active(.data) <- rlang::quo_text(rlang::enquo(what))
  .data
}


#' @rdname activate
#' @export
active <- function(x) {
  attr(x, 'active')
}
`active<-` <- function(x, value) {
  value <- gsub('"', '', value)
  if (!value %in% names(x)) stop(sprintf("'%s' does not exist"))
  attr(x, 'active') <- value
  x
}

bot <- function(x, ...) {
  UseMethod("bot")
}

bot.default <- function(x, ...) {
  ## strip attributes
  x <- lapply(x, identity)
  out <- structure(x, class = "bot", jramp = names(x))
  activate(out, "object")
}
bot.PATH <- function(x, ...) {
  bot(x[attr(x, "join_ramp")])
}
print.bot <- function(x, ...) {
  cat("bag of tables:\n")
  cat(paste(names(x), collapse = ","), "\n")
  cat(sprintf("active table is '%s'", active(x)), "\n")
  cat(sprintf("join ramp order is '%s'", paste(jramp(x), collapse = ",")))
  print(x[[active(x)]])

}
#' @importFrom dplyr filter
filter.bot <- function(x, ..., tables = NULL) {
 act <- active(x)
 if (is.null(tables)) tables <- jramp(x)
 x[[act]] <- dplyr::filter(x[[act]], ...)
 bot(anglr:::semi_cascade(x, tables = tables))
}
jramp <- function(x, ...) {
  attr(x, "jramp")
}

as_tibble.bot <- function(x, ...) {
  purrr::reduce(x, dplyr::inner_join)
}

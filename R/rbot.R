activate <- function(.data, what) {
  UseMethod('activate')
}
#' @export
#' @importFrom rlang enquo quo_text
activate.bot <- function(.data, what) {
  if (is.character(what)) {
    active(.data) <- what

  } else {
    active(.data) <- rlang::quo_text(rlang::enquo(what))
  }
  .data
}


#' @rdname activate
#' @export
active <- function(x) {
  attr(x, 'active')
}
`active<-` <- function(x, value) {
  value <- gsub('"', '', value)
  if (!value %in% names(x)) stop(sprintf("'%s' does not exist", value))
  attr(x, 'active') <- value
  x
}

bot <- function(x, ...) {
  UseMethod("bot")
}

bot.default <- function(x, ...) {
  nms <- names(x)
  if (length(nms) < 1 | any(nchar(nms) < 1L)) stop("all list items must be named")
  ## strip attributes
  x <- lapply(x, tibble::as_tibble)
  out <- structure(x, class = "bot", jramp = nms)
  activate(out, nms[1])
}
bot.PATH <- function(x, ...) {
  bot(x[attr(x, "join_ramp")])
}
print.bot <- function(x, ...) {
  cat("bag of tables:\n")
  cat(paste(names(x), collapse = ","), "\n\nd")
  cat(sprintf("active table is '%s'", active(x)), "\n")
  cat(sprintf("... and join ramp order is '%s'\n", paste(jramp(x), collapse = ",")))
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

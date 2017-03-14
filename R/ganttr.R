#' Gantt diagram htmlwidget
#'
#' Function presenting Gantt diagram. Pass tasks and links between them as lists of lists.
#' Parameters are serialized and injected into dhtmlxgantt javascript library.
#'
#' @import htmlwidgets
#'
#' @export
ganttr <- function(tasks, links = list(), width = NULL, height = NULL, elementId = NULL) {

  # Forward options as JSON:
  inject_as_json <- list(
    data = tasks,
    links = links
  )

  htmlwidgets::createWidget(
    name = 'ganttr',
    inject_as_json,
    width = width,
    height = height,
    package = 'ganttr',
    elementId = elementId
  )
}

#' Shiny bindings for ganttr
#'
#' Output and render functions for using ganttr within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a ganttr
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name ganttr-shiny
#'
#' @export
ganttrOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'ganttr', width, height, package = 'ganttr')
}

#' @rdname ganttr-shiny
#' @export
renderGanttr <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, ganttrOutput, env, quoted = TRUE)
}

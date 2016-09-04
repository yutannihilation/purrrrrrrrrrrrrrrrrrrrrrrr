#' Display Cats For Status Code
#'
#' @name http_cat
#' @param x status code number or response object
#'
#' @export
http_cat <- function(x) UseMethod("http_cat")

#' @rdname http_cat
#' @export
http_cat.default <- function(x) {
  shiny::runApp(
    shiny::shinyApp(
      shiny::fluidPage(
        shiny::img(src=sprintf("https://http.cat/%d", x)),
        shiny::actionButton("done", "I got it.")
      ),
      function(input, output) {
        shiny::observe({
          input$done
          if (input$done > 0)
            shiny::stopApp(shiny::isolate(input$prefecture))
        })
      }
    ))
}

#' @rdname http_cat
#' @export
http_cat.response <- function(x) {
  code <- httr::status_code(x)
  http_cat.default(x)
}

#' @inheritParams print
#' @export
print.response <- function(x, ...) {
  http_cat(x)
  httr:::print.response(x, ...)
}

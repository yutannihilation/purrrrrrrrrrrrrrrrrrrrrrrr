#' Display Cats For Status Code
#'
#' @export
http_cat <- function(code) UseMethod("http_cat")

#' @export
http_cat.default <- function(code) {
  shiny::runApp(
    shiny::shinyApp(
      shiny::fluidPage(
        shiny::img(src=sprintf("https://http.cat/%d", code)),
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

#' @export
http_cat.response <- function(res) {
  code <- httr::status_code(res)
  http_cat.default(code)
}

#' @export
print.response <- function(res) {
  http_cat(res)
  httr:::print.response(res)
}

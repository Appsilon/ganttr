library(shiny)
library(ganttr)
library(magrittr)
library(DT)

ui <- fluidPage(
  ganttrOutput("sample_gantt"),
  dataTableOutput("gantt_data"),
  dataTableOutput("gantt_links")
)

list_of_lists_to_dt <- function(obj) {
  if (is.null(obj)) { NULL }

  obj %>%
    lapply(function(row) {
      as.data.frame(t(row), stringsAsFactors = F)
    }) %>%
    plyr::rbind.fill() %>%
    datatable()
}

shinyApp(ui = ui, server = shinyServer(function(input, output, session) {
  output$sample_gantt <- renderGanttr(ganttr(list()))
  output$gantt_data <- renderDataTable(list_of_lists_to_dt(input$sample_gantt$data))
  output$gantt_links <- renderDataTable(list_of_lists_to_dt(input$sample_gantt$links))
}))

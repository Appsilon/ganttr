library(shiny)
library(ganttr)
library(magrittr)

ui <- fluidPage(
  actionButton("add_task", "add random task"),
  ganttrOutput("sample_gantt")
)

shinyApp(ui = ui, server = shinyServer(function(input, output, session) {
  dict <- reactiveValues(
    tasks = list(
      list(id = 1, text = "Project #2", start_date = "01-04-2013", duration = 18, order = 10, progress = 0.4, open = TRUE),
      list(id = 2, text = "Project #1", start_date = "31-03-2013", duration = 1, order = 9, progress = 0.8, open = TRUE),
      list(id = 3, text = "Just test", start_date = "03-04-2013", duration = 8, order = 9, progress = 0.8, open = TRUE)
    )
  )
  observeEvent(input$add_task, {
    one_task <- dict$tasks[[sample(1:length(dict$tasks), 1)]]
    one_task$id <- length(dict$tasks) + 1
    dict$tasks[[one_task$id]] <- one_task
  })
  output$sample_gantt <- renderGanttr({
     ganttr(dict$tasks)
  })
}))

library(magrittr)

list(
  list(id=1, text = "Project #2", start_date="01-04-2013", duration=18,order=10, progress=0.4, open= TRUE),
  list(id=2, text = "Project #1", start_date="31-03-2013", duration=1,order=9, progress=0.8, open= TRUE),
  list(id=3, text = "Just test", start_date="03-04-2013", duration=8,order=9, progress=0.8, open= TRUE)
) %>%
  ganttr::ganttr()

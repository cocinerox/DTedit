app <- ShinyDriver$new("../")
app$snapshotInit("test")

app$setInputs(
  `books-editdtdt_rows_selected` = 6, allowInputNoBinding_ = TRUE
)
app$setInputs(
  `books-editdtdt_rows_last_clicked` = 6, allowInputNoBinding_ = TRUE
)
app$setInputs(`books-editdt_copy` = "click")
app$setInputs(
  `books-editdt_add_Authors` = c("Chambers, J.M.", "Hastie, T.J.", "Becker, R.A.", "Wilks, A.R."),
  `books-editdt_add_Date` = "1991-01-17",
  `books-editdt_add_Publisher` = "Wiley",
  `books-editdt_add_Title` = "Statistical Models in S - 2nd edition"
)
app$setInputs(`books-editdt_insert` = "click")

Sys.sleep(2)
app$snapshot(items = list(export = TRUE))

# wait for the process to close gracefully
# this allows covr to write out the coverage results
#  https://github.com/rfaelens/exampleShinyTest/ Ruben Faelens
p <- app$.__enclos_env__$private$shinyProcess
p$interrupt()
p$wait()

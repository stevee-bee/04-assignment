address <- "https://coursera-assessments.s3.amazonaws.com/assessments/1613210850627/65725390-7703-403b-c66f-d2c7bb055df0/measurement_means.txt"
address <- sub("^https", "http", address)
data <- read.table(url(address), header = TRUE)
View(data)
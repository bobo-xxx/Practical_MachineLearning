rm(list=ls())
# prediction with testing data
# Load running data
load("run.RData")
# Load the testing data
wle.testing = read.csv("data/pml-testing.csv", na.strings = c("#DIV/0!","NA",""))
dim(wle.testing)

# Remove the same variables in the testing set
wle.testing = wle.testing[, maintain[maintain %in% colnames(wle.testing)]]
# Apply the pre-processing to the testing set
wle.testingPC = predict(preProc, wle.testing)

# Predict the testing set
predict2 = predict(mod2, wle.testingPC)
predict2

# Save pediction
write.table(cbind(predict2, wle.testing), file = "output/predict_test.txt", quote = FALSE, row.names = FALSE)

print("Written by Josh Rosen")

#========================================Entering Files===================================

#Enter file with Rows to be copied
cRow <- read.delim(readline( prompt = "Please Enter file with Rows to be copied: "), header = TRUE, sep = "\t", quote = "\"",
                   dec = ".", as.is=FALSE, colClasses = "character",row.names = 1, fill = TRUE, comment.char = "#")
#Enter writing file for Rows to be written into
rWrite <- read.delim(readline( prompt = "Please enter file to be written into: "), header = TRUE, sep = "\t", quote = "\"",
                     dec = ".", fill = TRUE, colClasses = "character", row.names = 1, comment.char = "#")
#Enter new name for file that was written to
newDoc<- readline( prompt = "Please enter a new name for the new doc: ")

#========================================Run Code===========================================

#get old length
old.Length<- ncol(rWrite)

#create new data frame
new_data<- data.frame(matrix(nrow = nrow(rWrite) , ncol = ncol(cRow) + ncol(rWrite) ))
rownames(new_data)<- rownames(rWrite)
colnames(new_data)<- c(colnames(rWrite), colnames(cRow))

#Parse over row names in rWrite
for (row in rownames(rWrite)){
  new_data[row,] <- c(rWrite[row,][1:old.Length], cRow[row,])
}



#========================================Writing new File=======================================

write.table(new_data, file = "newDoc.txt", append = FALSE, quote = TRUE, sep = "\t",
            eol = "\n", na = "NA", dec = ".", row.names = TRUE,
            col.names = NA, qmethod = c("escape", "double"),
            fileEncoding = "")


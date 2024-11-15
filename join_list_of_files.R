# Load necessary library
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}
library(tidyverse)

# Function to read and merge files without column names
merge_files_no_headers <- function(file_list_path) {
  # Read list of file names
  file_list <- readLines(file_list_path)
  
  # Read each file into a list of data frames without column names
  data_frames <- lapply(file_list, function(file) {
    read_tsv(file, col_names = FALSE)
  })
  
  # Perform inner join across all data frames by the first column
  merged_data <- reduce(data_frames, inner_join, by = "ID")
  
  # Output result to stdout
  write_tsv(merged_data, "")
}

# Main script
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) {
  stop("Usage: Rscript join_list_of_files.R <file_list_path>")
}

# Call the function with the provided file list path
merge_files_no_headers(args[1])

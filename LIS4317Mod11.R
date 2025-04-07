# --------------------------------------------------------------------
# SECTION 1: COURSE AND ASSIGNMENT DETAILS
# --------------------------------------------------------------------
# Course      : LIS-4317 Introduction to Visual Analytics
# Assignment  : Module 11
# URL         : https://usflearn.instructure.com/courses/1934094/assignments/17694857
# Filename    : LIS4317Mod11.R
# Purpose     : Generate a Tufte-style dot-dash scatterplot in ggplot2 using mtcars data
# Author      : Steven Barden
# Email       : StevenBarden@usf.edu
# Created     : 2025-04-06 (EST)
# Updated     : 2025-04-07 (EST)
# License     : The UltraFree Unlicense
# Description : This script creates a dot-dash scatterplot in ggplot2 following Edward Tufte's visualization principles.

# --------------------------------------------------------------------
# SECTION 2: ENVIRONMENT SETUP
# --------------------------------------------------------------------
tryCatch({
  baseDir <- r"(C:\Users\Steve\OneDrive\College\_____DESKTOP ICONS\Remeye\Classes\4317\Mod11)"
  if (!dir.exists(baseDir)) stop("Directory does not exist.")
  setwd(baseDir)
  cat("Working directory set to:", getwd(), "\n")
}, error = function(e) {
  stop("Error setting the working directory: ", e$message)
})

# Ensure Output Width for Terminal Display
options(width = 80)

# --------------------------------------------------------------------
# SECTION 3: DEPENDENCIES & INSTALLATION
# --------------------------------------------------------------------
required_packages <- c("ggplot2", "ggthemes")

check_and_load_library <- function(package) {
  if (!require(package, character.only = TRUE)) {
    tryCatch({
      cat("Installing package:", package, "\n")
      install.packages(package)
      library(package, character.only = TRUE)
      cat("Successfully loaded:", package, "\n")
    }, error = function(e) {
      stop(paste("Failed to install/load package:", package, "-", e$message))
    })
  } else {
    cat("Package already loaded:", package, "\n")
  }
}

tryCatch({
  lapply(required_packages, check_and_load_library)
}, error = function(e) {
  stop("Package loading failed: ", e$message)
})

# --------------------------------------------------------------------
# SECTION 4: UTILITY FUNCTIONS
# --------------------------------------------------------------------
read_data_file <- function(file_path, file_type = "csv") {
  tryCatch({
    if (file_type == "csv") {
      data <- read.csv(file_path)
    } else {
      stop("Unsupported file type")
    }
    cat("Successfully loaded data from:", file_path, "\n")
    return(data)
  }, error = function(e) {
    stop("Error reading file: ", e$message)
  })
}

check_missing_values <- function(data) {
  missing_count <- sum(is.na(data))
  if (missing_count > 0) {
    cat("Warning:", missing_count, "missing values detected.\n")
  } else {
    cat("No missing values found.\n")
  }
  return(missing_count)
}

clean_data <- function(data) {
  tryCatch({
    data <- unique(data)
    cat("Data cleaning completed successfully.\n")
    return(data)
  }, error = function(e) {
    stop("Error cleaning data: ", e$message)
  })
}

# --------------------------------------------------------------------
# SECTION 5: DATA LOADING
# --------------------------------------------------------------------
load_sample_data <- function() {
  sample_data <- mtcars[, c("wt", "mpg")]
  return(sample_data)
}

# --------------------------------------------------------------------
# SECTION 6: DATA PROCESSING
# --------------------------------------------------------------------
process_data <- function(data) {
  tryCatch({
    cat("Processing data...\n")
    cleaned_data <- clean_data(data)
    check_missing_values(cleaned_data)
    cat("Data processing completed successfully.\n")
    return(cleaned_data)
  }, error = function(e) {
    stop("Error processing data: ", e$message)
  })
}

# --------------------------------------------------------------------
# SECTION 7: ANALYSIS FUNCTIONS
# --------------------------------------------------------------------
analyze_data <- function(data) {
  tryCatch({
    cat("Analyzing data...\n")
    cat("Analysis completed successfully.\n")
    return(data)
  }, error = function(e) {
    stop("Error during analysis: ", e$message)
  })
}

# --------------------------------------------------------------------
# SECTION 8: VISUALIZATION FUNCTIONS
# --------------------------------------------------------------------
visualize_data <- function(data) {
  tryCatch({
    cat("Creating dot-dash scatterplot...\n")
    plot <- ggplot(data, aes(x = wt, y = mpg)) +
      geom_point() +
      geom_rug(sides = "bl") +  # Dot-dash (rug) on bottom and left
      theme_tufte(ticks = FALSE) +
      xlab("Car weight (lb/1000)") +
      ylab("Miles per gallon of fuel") +
      theme(
        axis.title.x = element_text(vjust = -0.5, family = "serif"),
        axis.title.y = element_text(vjust = 1.5, family = "serif"),
        axis.text = element_text(family = "serif")
      )
    print(plot)
    ggsave("dot_dash_ggplot2.pdf", plot, width = 6, height = 4)
    cat("Visualization saved as 'dot_dash_ggplot2.pdf'.\n")
    return(invisible(plot))
  }, error = function(e) {
    stop("Error creating visualization: ", e$message)
  })
}

# --------------------------------------------------------------------
# SECTION 9: MAIN EXECUTION BLOCK
# --------------------------------------------------------------------
main <- function() {
  tryCatch({
    cat("Starting script execution...\n")
    
    # Step 1: Load Data
    cat("Step 1: Loading data...\n")
    data <- load_sample_data()
    
    # Step 2: Process Data
    cat("Step 2: Processing data...\n")
    processed_data <- process_data(data)
    
    # Step 3: Analyze Data
    cat("Step 3: Analyzing data...\n")
    analysis_results <- analyze_data(processed_data)
    
    # Step 4: Visualize Results
    cat("Step 4: Visualizing results...\n")
    visualize_data(analysis_results)
    
    cat("Script execution completed successfully.\n")
    return(invisible(NULL))
  }, error = function(e) {
    stop("Script execution failed: ", e$message)
  })
}

# Execute the main function
main()

# --------------------------------------------------------------------
# SECTION 10: VERSION HISTORY
# --------------------------------------------------------------------
# Version History:
# - Version 1.0 (2025-04-07): Initial script for Module 11 dot-dash plot in ggplot2.

# --------------------------------------------------------------------
# SECTION 11: ADDITIONAL NOTES
# --------------------------------------------------------------------
# Notes:
# - Uses mtcars dataset for simplicity and availability.
# - Follows Tufte's minimalist principles with reduced non-data ink.
# - Output saved as PDF for vector quality.
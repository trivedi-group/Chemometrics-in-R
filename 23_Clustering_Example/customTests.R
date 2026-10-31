# So swirl does not repeat execution of plot commands
AUTO_DETECT_NEWVAR <- FALSE

# Returns TRUE if e$expr matches any of the expressions given
# (as characters) in the argument.
ANY_of_exprs <- function(...){
  e <- get("e", parent.frame())
  any(sapply(c(...), function(expr)omnitest(expr)))
}

equiv_val <- function(correctVal){
  e <- get("e", parent.frame()) 
  #print(paste("User val is ",e$val,"Correct ans is ",correctVal))
  isTRUE(all.equal(correctVal,e$val))
  
}

# Put custom tests in this file.
      
# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.
      
# AUTO_DETECT_NEWVAR <- FALSE
      
# However, this means that you should detect user-created
# variables when appropriate. The answer test, creates_new_var()
# can be used for for the purpose, but it also re-evaluates the
# expression which the user entered, so care must be taken.

# Put custom tests in this file.
      
# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.
      
# AUTO_DETECT_NEWVAR <- FALSE
      
# However, this means that you should detect user-created
# variables when appropriate. The answer test, creates_new_var()
# can be used for for the purpose, but it also re-evaluates the
# expression which the user entered, so care must be taken.

# Get the swirl state
getState <- function(){
  # Whenever swirl is running, its callback is at the top of its call stack.
  # Swirl's state, named e, is stored in the environment of the callback.
  environment(sys.function(1))$e
}

# Retrieve the log from swirl's state
getLog <- function(){
  getState()$log
}

.reflect_state <- function(){
  environment(sys.function(1))$e
}

.reflect_keep <- function(key, value){
  # The answers are kept in a visible variable called reflection_answers.
  # They are also put into swirl's own saved state, so they survive stopping and resuming.
  e <- .reflect_state()
  lesson <- if (is.environment(e) && !is.null(e$path)) gsub("_", " ", basename(e$path)) else NULL
  store <- get0("reflection_answers", envir = globalenv(), inherits = FALSE)
  if (!is.list(store) || !identical(store$lesson, lesson)) store <- list(lesson = lesson)
  store[[key]] <- value
  assign("reflection_answers", store, envir = globalenv())
  if (is.environment(e)){
    snap <- e$snapshot
    if (is.null(snap)) snap <- list()
    snap[["reflection_answers"]] <- store
    e$snapshot <- snap
  }
}

reflect_text <- function(key, min_chars = 1, max_chars = 250){
  e <- .reflect_state()
  txt <- trimws(paste(e$val, collapse = ", "))
  if (nchar(txt) < min_chars){
    cat("\n| Please type an answer and press Enter.\n")
    return(FALSE)
  }
  if (nchar(txt) > max_chars){
    cat("\n| That answer has ", nchar(txt), " characters. Please shorten it to ",
        max_chars, " or fewer and type it again.\n", sep = "")
    return(FALSE)
  }
  .reflect_keep(key, txt)
  TRUE
}

reflect_rating <- function(key){
  e <- .reflect_state()
  txt <- trimws(paste(e$val, collapse = ""))
  if (!grepl("^[1-5]$", txt)){
    cat("\n| Please type a single digit, either 1, 2, 3, 4 or 5, then press Enter.\n")
    return(FALSE)
  }
  .reflect_keep(key, as.integer(txt))
  TRUE
}

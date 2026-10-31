match_call <- function(correct_call = NULL) {
  e <- get("e", parent.frame())
  # Trivial case
  if(is.null(correct_call)) return(TRUE)
  # Get full correct call
  full_correct_call <- expand_call(correct_call)
  # Expand user's expression
  expr <- deparse(e$expr)
  full_user_expr <- try(expand_call(expr), silent = TRUE)
  # Check if expansion went okay
  if(is(full_user_expr, "try-error")) return(FALSE)
  # Compare function calls with full arg names
  identical(full_correct_call, full_user_expr)
}

# Utility function for match_call answer test
# Fills out a function call with full argument names
expand_call <- function(call_string) {
  # Quote expression
  qcall <- parse(text=call_string)[[1]]
  # If expression is not greater than length 1...
  if(length(qcall) <= 1) return(qcall)
  # See if it's an assignment
  is_assign <- is(qcall, "<-")
  # If assignment, process righthandside
  if(is_assign) {
    # Get righthand side
    rhs <- qcall[[3]]
    # If righthand side is not a call, can't use match.fun()
    if(!is.call(rhs)) return(qcall)
    # Get function from function name
    fun <- match.fun(rhs[[1]])
    # match.call() does not support primitive functions
    if(is.primitive(fun)) return(qcall)
    # Get expanded call
    full_rhs <- match.call(fun, rhs)
    # Full call
    qcall[[3]] <- full_rhs
  } else { # If not assignment, process whole thing
    # Get function from function name
    fun <- match.fun(qcall[[1]])
    # match.call() does not support primitive functions
    if(is.primitive(fun)) return(qcall)
    # Full call
    qcall <- match.call(fun, qcall)
  }
  # Return expanded function call
  qcall
}

prints_var <- function(varname) {
  e <- get("e", parent.frame())
  any_of_exprs(varname, paste0('print(', varname, ')'))
}

gets_help <- function(funcname) {
  e <- get("e", parent.frame())
  any_of_exprs(paste0('?', funcname),
               paste0('help(', funcname, ')'))
}

# Check that the output/value produced by a script is correct
script_vals_identical <- function() {
  # Get e
  e <- get('e', parent.frame())
  # Get value produced from user's script
  user_val <- capture.output(
    local(
      try(
        # Must use eval-parse combo, not source, if we don't force user
        # to print result
        eval(e$expr),
        silent = TRUE
      )
    )
  )
  # Get value produced from correct script
  correct_val <- capture.output(
    local(
      try(
        # Must use eval-parse combo, not source, if we don't force user
        # to print result
        eval(parse(file = e$correct_script_temp_path)),
        silent = TRUE
      )
    )
  )
  # Compare values
  identical(user_val, correct_val)
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

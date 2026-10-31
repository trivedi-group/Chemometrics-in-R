# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.
swirl_options(swirl_logging = TRUE)


# Reflection step, sending (added)
# Paste the web app address from the relay script between the quotation marks below.
# Until an address is pasted, the answers are prepared as an email for the student to send.
.reflection_url <- "https://script.google.com/macros/s/AKfycby9d8eYj3T9e_Iz0qtlxvjTALZfU6NzvdjOXT_I_GUJOIDIRHijFf0HtPhWit0eY7IN/exec"
.reflection_to <- "drupad.trivedi@manchester.ac.uk"
.reflection_lesson <- "04 Vector arithmetics"

send_reflection <- function(){
  # swirl runs each typed command a second time, silently, to record its result.
  # Do nothing on that second run, so that only one message is ever sent.
  if (any(vapply(sys.calls(), function(cl) identical(cl[[1]], as.name("safeEval")), TRUE))) return(invisible(NULL))
  r <- get0("reflection_answers", envir = globalenv(), inherits = FALSE)
  if (!is.list(r) || !identical(r$lesson, .reflection_lesson)) r <- list()
  needed <- c("name", "difficulty", "confidence", "learned", "difficult", "feedback")
  absent <- needed[vapply(needed, function(k) is.null(r[[k]]) || length(r[[k]]) == 0, TRUE)]
  if (length(absent) > 0){
    cat("\n| Some of your answers are missing, so nothing has been sent.\n")
    cat("| Please restart this lesson and answer every question.\n")
    return(invisible(NULL))
  }
  on.exit(.chem_save_script(), add = TRUE)
  fields <- c(
    "Name" = r$name,
    "Difficulty (one is very easy, five is very hard)" = as.character(r$difficulty),
    "Confidence (one is not at all confident, five is very confident)" = as.character(r$confidence),
    "Most useful thing learned" = r$learned,
    "Difficult or unclear" = r$difficult,
    "Other feedback" = r$feedback)
  make_text <- function(f){
    paste0("Chemometrics_DL reflection, lesson ", .reflection_lesson, "\n\n",
           paste0(names(f), ": ", f, collapse = "\n"))
  }
  show_text <- make_text(fields)
  cat("\n| This is your reflection.\n\n")
  cat(paste0("    ", strsplit(show_text, "\n")[[1]]), sep = "\n")

  # First choice, send it automatically to the relay.
  url <- getOption("chem.reflection.url", .reflection_url)
  sent <- FALSE
  if (grepl("^https?://", url) && requireNamespace("httr", quietly = TRUE)){
    payload <- list(source = "Chemometrics_DL", lesson = .reflection_lesson, name = r$name,
                    difficulty = as.integer(r$difficulty), confidence = as.integer(r$confidence),
                    learned = r$learned, difficult = r$difficult, feedback = r$feedback)
    resp <- tryCatch(httr::POST(url, body = payload, encode = "json", httr::timeout(20)),
                     error = function(err) NULL)
    if (!is.null(resp) && httr::status_code(resp) == 200){
      txt <- tryCatch(httr::content(resp, as = "text", encoding = "UTF-8"), error = function(err) "")
      sent <- identical(trimws(txt), "ok")
    }
  }
  if (sent){
    cat("\n| Your reflection has been sent to Drupad. Thank you.\n")
    return(invisible(NULL))
  }

  # Second choice, prepare an email for the student to send.
  cat("\n| I could not send your reflection automatically, so I will try to prepare an email.\n")
  mail_url <- function(f){
    paste0("mailto:", .reflection_to,
           "?subject=", utils::URLencode(paste("Chemometrics reflection", .reflection_lesson), reserved = TRUE),
           "&body=", utils::URLencode(gsub("\n", "\r\n", make_text(f), fixed = TRUE), reserved = TRUE))
  }
  shortened <- FALSE
  long_keys <- c("Most useful thing learned", "Difficult or unclear", "Other feedback")
  while (nchar(mail_url(fields)) > 1800 && any(nchar(fields[long_keys]) > 20)){
    k <- long_keys[which.max(nchar(fields[long_keys]))]
    fields[k] <- paste0(substr(fields[k], 1, floor(nchar(fields[k]) * 0.8)), "...")
    shortened <- TRUE
  }
  opened <- tryCatch({ utils::browseURL(mail_url(fields)); TRUE }, error = function(err) FALSE, warning = function(w) FALSE)
  if (opened){
    cat("| Your email programme should now open with this message ready to send.\n")
    cat("| Check it, then press Send. If nothing opens, copy the message above into a new\n")
    cat("| email to ", .reflection_to, ".\n", sep = "")
  } else {
    cat("| I could not open an email programme. Please copy the message above into a new\n")
    cat("| email to ", .reflection_to, " and send it.\n", sep = "")
  }
  if (shortened){
    cat("| Some of your comments were shortened to fit in the email link, so please paste\n")
    cat("| the full text shown above into the email if you want to send all of it.\n")
  }
  invisible(NULL)
}

# If a student types send_reflection without the brackets, give a short prompt instead of showing the code.
class(send_reflection) <- "reflection_command"
print.reflection_command <- function(x, ...){
  cat("\n| Please type send_reflection() with the brackets, then press Enter.\n")
  invisible(x)
}

# Lesson script saving (added)
# When the reflection is sent, the commands from the lesson are saved as an R script in the working folder.
.chem_st <- get0("e", inherits = TRUE)
.chem_save_script <- function(){
  st <- .chem_st
  if (!is.environment(st) || is.null(st$les) || is.null(st$row)) return(invisible(NULL))
  les <- st$les
  n <- min(nrow(les), st$row - 1)
  skip <- "^(\\?|View\\(|myedit\\(|submit\\(|reset\\(|skip\\(|nxt\\(|play\\(|send_reflection)"
  first_sentence <- function(x, cmd){
    x <- trimws(gsub("[[:space:]]+", " ", as.character(x)))
    s <- strsplit(x, "(?<=[.?!])\\s+(?=[A-Z\"'])", perl = TRUE)[[1]]
    if (length(s) == 0) s <- x
    fn <- sub("\\(.*$", "", sub("^[^(]*?(<-|=)[[:space:]]*", "", cmd))
    hit <- if (nzchar(fn)) s[vapply(s, function(z) grepl(fn, z, fixed = TRUE), TRUE)] else character(0)
    pick <- if (length(hit) > 0) hit[1] else s[1]
    if (nchar(pick) > 110) pick <- paste0(substr(pick, 1, 107), "...")
    pick
  }
  out <- c(paste0("# ", .reflection_lesson),
           "# Saved automatically when you finished this lesson.",
           "# The commands below are the model answers from the lesson, in the order you met them.",
           "# Each comment is the first sentence of the instruction you were given.",
           "# Some commands rely on data or helper functions that the lesson prepared for you.",
           "")
  for (i in seq_len(n)){
    cl <- as.character(les[i, "Class"])
    if (identical(cl, "script")){
      sc <- as.character(les[i, "Script"])
      sol <- file.path(st$path, "scripts", paste0(tools::file_path_sans_ext(sc), "-correct.R"))
      if (file.exists(sol)){
        code <- readLines(sol, warn = FALSE)
        first_code <- which(!grepl("^[[:space:]]*(#|$)", code))[1]
        if (!is.na(first_code)) code <- code[first_code:length(code)]
        out <- c(out, paste0("# Script: ", sc), code, "")
      }
      next
    }
    if (!identical(cl, "cmd_question")) next
    cmd <- as.character(les[i, "CorrectAnswer"])
    if (is.na(cmd) || !nzchar(trimws(cmd)) || grepl(skip, cmd)) next
    if (grepl("pathtofile\\(", cmd)) cmd <- paste0("# ", cmd, "   (needs files supplied by the lesson)")
    out <- c(out, paste0("# ", first_sentence(les[i, "Output"], cmd)), cmd, "")
  }
  num <- sub("^([0-9]+).*", "\\1", .reflection_lesson)
  fn <- paste0("Chemometrics lesson ", num, " script.R")
  ok <- tryCatch({
    con <- file(fn, "w", encoding = "UTF-8"); writeLines(enc2utf8(out), con); close(con); TRUE
  }, error = function(err) FALSE, warning = function(w) FALSE)
  if (ok){
    cat("\n| The commands from this lesson have been saved as an R script called\n")
    cat("| ", fn, "\n| in your working folder, which is\n| ", normalizePath(getwd()), "\n", sep = "")
  } else {
    cat("\n| I could not save the script of this lesson in your working folder.\n")
  }
  invisible(NULL)
}

# Resume helper (added)
# When a student stops and resumes, swirl restores their variables but not packages they loaded
# or data sets they loaded with data(). This quietly repeats those earlier steps.
.chem_restore_steps <- function(st){
  if (!is.environment(st) || is.null(st$les) || is.null(st$row)) return(invisible(NULL))
  les <- st$les
  if (!("CorrectAnswer" %in% names(les))) return(invisible(NULL))
  for (i in seq_len(min(nrow(les), st$row - 1))){
    cmd <- as.character(les[i, "CorrectAnswer"])
    if (is.na(cmd)) next
    if (grepl("^(data|library)\\(", cmd)){
      try(suppressWarnings(suppressMessages(eval(parse(text = cmd), envir = globalenv()))), silent = TRUE)
    }
  }
  invisible(NULL)
}
.chem_restore_steps(get0("e", inherits = TRUE))

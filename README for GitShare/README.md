# Chemometrics DL: an interactive R course

This is a course of 25 short, interactive lessons that teach data analysis for chemistry with R. It runs inside R using the **swirl** package. You type short commands, swirl checks them, and the course moves on when you get them right. The lessons run from looking at your data for the first time, through vectors, calibration, PCA, MDS, clustering, PLS-DA and SVM, to plotting, data wrangling and an independent workout.

This is a full manual. It assumes you have never used R. Choose your operating system below and follow its guide from start to finish. Then come back here to learn how the lessons work.

**Data protection reminder.** Never type personal information about yourself or anyone else into any AI tool, prompt or free-text box. Follow the GDPR and the University of Manchester's data protection policies. Always double-check anything an AI tool tells you before relying on it.

## Contents

1. [Choose your system and set up](#part-1-choose-your-system-and-set-up)
2. [Start the course](#part-2-start-the-course)
3. [How a lesson works](#part-3-how-a-lesson-works)
4. [Stopping and resuming](#part-4-stopping-and-resuming)
5. [The reflection at the end of each lesson](#part-5-the-reflection-at-the-end-of-each-lesson)
6. [The R script saved after each lesson](#part-6-the-r-script-saved-after-each-lesson)
7. [Lesson list and packages](#part-7-lesson-list-and-packages)
8. [Lesson 25 and its synthetic data](#part-8-lesson-25-and-its-synthetic-data)
9. [Common problems and fixes](#part-9-common-problems-and-fixes)
10. [Credits, licence and contact](#part-10-credits-licence-and-contact)

## Part 1: Choose your system and set up

Pick the guide for your computer. Each one takes you through every step, with direct download links. To open a guide, click the **docs** folder in the file list on the course page, then click the file for your system: `Windows.md`, `macOS.md` or `Linux.md`.

| Your computer | Guide | Where R comes from |
|-|-|-|
| Windows 10 or 11 | Setting up on Windows: `docs/Windows.md` | <https://cran.r-project.org/bin/windows/base/> |
| Mac (Apple silicon or Intel) | Setting up on macOS: `docs/macOS.md` | <https://cran.r-project.org/bin/macosx/> |
| Linux (Ubuntu, Debian, Fedora, Red Hat) | Setting up on Linux: `docs/Linux.md` | <https://cran.r-project.org/bin/linux/> |

RStudio Desktop, the friendly window for using R, is free and downloads from <https://docs.posit.co/ide/user/download.html>.

Each guide has the same six steps:

1. Install R. This must come first.
2. Install RStudio.
3. Choose a working folder.
4. Install the packages the course needs.
5. Download this course using the link your lecturer shared with you (<https://gitshare.me/repo/67ae54f9-312a-4b4e-9d8b-97cf0dd7efc3>) and install it into swirl.
6. Come back here and start the course.

**Important: install R 4.5.3.** This course was tested from start to finish on R 4.5.3. Each system guide links to that exact version. Please use it, and do not install a newer R for this course, because newer versions have not been tested with these lessons.

Every lesson was run from start to finish on Linux. The Windows and macOS guides follow the standard routes and were not run on those systems by the author. If you find a step that does not match your screen, tell your lecturer so that the guide can be corrected.

## Part 2: Start the course

Do this every time you want to work on the course.

1. Open RStudio.
2. Set your working folder (see Step 3 of the guide for your system).
3. In the Console, type the following. Press Enter after each line.

   ```
   library(swirl)
   swirl()
   ```

4. If swirl says it sees variables saved in your workspace, type `ls()` to look, then `rm(list=ls())` to clear it, and then type `swirl()` again. This keeps old variables from interfering with a lesson.
5. swirl asks **What shall I call you?** Type a name and press Enter. **Use the same name every time**, with the same capital letters, so that swirl can remember your progress. The first time, swirl explains how it works. Press Enter whenever you see `...`.

   ![The start of a first swirl session](docs/images/console-1-start.png)

   *This image shows real console output from the course, shortened, with the sample name Ada typed in.*

6. swirl lists the courses. Type the number next to the entry that contains **Chemometrics DL**, which has a long name with letters and numbers after it, and press Enter.
7. swirl lists the lessons, numbered 01 to 25. Type the number of the lesson you want and press Enter. Start with **01 Visualisation** and work in order.

## Part 3: How a lesson works

swirl talks to you in lines that start with `|`. What you do next depends on what the screen shows.

| What you see | What to do |
|-|-|
| `...` | Press **Enter** when you have finished reading. |
| The `>` prompt after a question | Type the R command that the question asks for and press **Enter**. |
| `ANSWER:` | Type your answer and press **Enter**. |
| A numbered list | Type the number of your choice and press **Enter**. |
| A progress bar | Nothing to do. It shows how far through the lesson you are. |

![A lesson question](docs/images/console-2-question.png)

*Real console output from lesson 03, shortened.*

### If your answer is wrong

swirl tells you and gives you another try, often with a hint. You can try as often as you like. The matching is flexible, so extra spaces and the choice between single and double quotation marks usually do not matter.

### Typing commands in swirl

- Type each command exactly as the lesson asks, and press Enter once.
- R is **case sensitive**. `Data` and `data` are different.
- If you press Enter before a bracket is closed, R shows a `+` instead of `>`. Press **Esc** and retype the command.
- Use the **up arrow** key to bring back your last command and edit it.

### Special swirl commands

You can type these at the `>` prompt at any time during a lesson.

| Command | What it does |
|-|-|
| `skip()` | Skips the current question. Use it only if you are truly stuck. |
| `play()` | Lets you experiment freely. swirl ignores what you type until you use `nxt()`. |
| `nxt()` | Returns to the lesson after `play()`. |
| `main()` | Goes back to the main menu. |
| `bye()` | Saves your progress and leaves swirl. |
| `info()` | Shows this list again. |
| `submit()` | Used in lessons where you edit a script. Press it after saving the script. |
| `reset()` | Used in script questions to restore the original script. |

### Script questions

A few lessons open a short R script in a window. Follow the instructions on screen, make the change, **save** the script, return to the Console, and type `submit()`. If you make a mess of it, type `reset()` and start that question again.

## Part 4: Stopping and resuming

To stop part way through a lesson, type `bye()` at the `>` prompt. swirl saves your progress. You can also press **Esc** and then type `bye()`.

To resume, open RStudio, then type:

```
library(swirl)
swirl()
```

Type **exactly the same name** as before. swirl then offers to **continue with your unfinished lesson**. Choose that option. If you type a different name, swirl treats you as a new student and starts a fresh record.

Always use `bye()` to leave a lesson, because that is the way swirl is designed to save your place.

## Part 5: The reflection at the end of each lesson

Each lesson ends with a short reflection of six questions. They ask for your name, how difficult you found the lesson, how confident you feel, what was most useful, what was unclear and any other feedback. Free-text answers are limited to 250 characters.

When the questions are done, type:

```
send_reflection()
```

swirl then emails your answers to Drupad Trivedi, who teaches the course, through a web relay. You see a copy of what was sent, followed by **Your reflection has been sent to Drupad. Thank you.**

![The end of a lesson](docs/images/console-3-reflection.png)

*Real console output from lesson 01, shortened. The answers shown are test text.*

Please note:

- You need an **internet connection** to send the reflection.
- If sending fails, swirl shows your answers on screen and prepares an email in your own mail program, so that you can send it yourself. If no mail program opens, copy the text from the screen into an email to the address in Part 10.
- Please do **not** put personal or sensitive information in the free-text answers. Keep them about the course content.

## Part 6: The R script saved after each lesson

When you send your reflection, swirl also saves the commands from that lesson as an R script in your working folder. The file is called, for example:

```
Chemometrics lesson 01 script.R
```

Each model-answer command in the script has a comment above it, taken from the lesson, so that you can see what the command does. You can open the script in RStudio, run it again later, or use it as the starting point for your own analyses. Lines that read the course's data files point to the data inside the installed course, so they are written as comments for you to adapt to your own file locations.

If you cannot find the script, type `getwd()` to see your working folder and look there. If the working folder was not what you expected, lesson 24 also explains where files go.

## Part 7: Lesson list and packages

Work through the lessons in order. The packages listed are the ones each lesson loads. They are all covered by the package installation in your system guide, so you do not need to install anything extra.

| No. | Lesson | Packages used |
|-|-|-|
| 01 | Visualisation | none beyond swirl |
| 02 | Factors | none |
| 03 | Vectors | none |
| 04 | Vector arithmetics | none |
| 05 | Calibration Exercise | none |
| 06 | PCA | mixOmics |
| 07 | MDS | ggpubr, dplyr, magrittr |
| 08 | K Means Clustering | fields |
| 09 | Hierarchical Clustering | jpeg, fields |
| 10 | PLSDA | mixOmics |
| 11 | Principles of Analytic Graphs | ggplot2, jpeg |
| 12 | Plotting Systems | ggplot2, lattice, jpeg, datasets |
| 13 | Validation Methods | tidyverse, caret |
| 14 | Base Plotting System | jpeg, datasets, ggplot2, fields |
| 15 | Lattice Plotting System | lattice, ggplot2, fields, jpeg, datasets |
| 16 | SVM | e1071 |
| 17 | GGPlot2 Part1 | ggplot2, fields, jpeg, datasets |
| 18 | GGPlot2 Part2 | ggplot2, fields, jpeg, datasets |
| 19 | Manipulating Data with dplyr | dplyr |
| 20 | Grouping and Chaining with dplyr | dplyr |
| 21 | Tidying Data with tidyr | readr, tidyr, dplyr |
| 22 | Dimension Reduction | none |
| 23 | Clustering Example | fields, jpeg, datasets |
| 24 | Graphics Devices in R | none |
| 25 | Independent Workouts | e1071 |

`lattice` and `datasets` come with R itself.

## Part 8: Lesson 25 and its synthetic data

Lesson 25 is an independent workout. It asks you to apply what you have learned to a data set without much hand-holding. The data are **synthetic**, meaning they were generated by a computer script and are not real measurements. The file `synthetic_example.csv` has 80 samples in four groups (G1 to G4), with ten numeric variables named `var01` to `var10`. The script that made it, `make_synthetic_data.R`, is in the lesson folder, so you can see exactly how the data were built.

The lesson walks you through looking at the data, PCA, an analysis of variance for one variable, a post-hoc comparison and a cross-validated support vector machine. The lesson also invites you to try KNN yourself if you feel confident.

## Part 9: Common problems and fixes

> This section was written from testing the course. It is not a record of student reports. If you meet a problem that is not listed, email the address in Part 10 with a copy of the red error text.

**`Error: could not find function "swirl"` or `there is no package called 'swirl'`.**
Run `library(swirl)` first. If that fails, run `install.packages("swirl")`.

**`Error in library(xxx) : there is no package called 'xxx'`.**
Install the package with `install.packages("xxx")`, replacing `xxx` with the name shown. For `mixOmics`, use `BiocManager::install("mixOmics")`. Then restart the lesson.

**swirl does not remember where I was.**
The name you typed was different, including capitals and spaces. Type exactly the same name every time.

**The course is not in the course list.**
The installation did not finish, or you installed under a different name. Run `install_course_zip(file.choose())` again and read the messages. Look for a long name that contains **Chemometrics DL**.

**The file window does not appear when I run `file.choose()`.**
It may be hidden behind another window. If not, give the path directly. See Step 5 of your system guide. On Windows, use forward slashes (`/`) or double backslashes (`\\`).

**My answer looks right but swirl says it is wrong.**
Compare what you typed with the question character by character. Check capital letters, brackets and quotation marks. If you are using `play()`, type `nxt()` to return. If you really are stuck, `skip()` moves you on.

**I typed something and nothing happens, and the prompt is `+`.**
A bracket or quotation mark was left open. Press **Esc** and retype the command.

**I see red text that says `Warning` or a message about something being deprecated.**
Warnings are not errors. Lesson 04 shows a warning on purpose, to teach you about recycling in vectors. Lessons 12, 17 and 18 can show a note that `qplot()` or the `size` argument for lines is deprecated in current versions of ggplot2. The lessons explain this and the commands still work. Only `Error` messages need action.

**No graph appears, or it is very small.**
Look in the **Plots** pane in RStudio. Click **Zoom** to enlarge it. If the pane is hidden, drag its edge to make it bigger.

**The reflection could not be sent.**
Check your internet connection and type `send_reflection()` again. If it still fails, follow the on-screen instructions to send the email yourself.

**I cannot find the saved script.**
Type `getwd()`. The script is in that folder. See Part 6.

**swirl says I have variables in my workspace.**
Type `rm(list=ls())` and press Enter, then type `swirl()` again.

**Installation of a package fails on Linux.**
A system library is probably missing. Read the red text for the missing library name and install it with your package manager. See the system library notes in the Linux guide.

**R or RStudio crashed during a lesson.**
Reopen RStudio, run `library(swirl)` and `swirl()`, and sign in with the same name. You should be able to continue from the last question.

## Part 10: Credits, licence and contact

### Credits

This course is built on **swirl**, an R package that was created by the swirl team at Johns Hopkins University (<https://swirlstats.com/>). Some of the lessons in this course were written or adapted from lessons by the original swirl authors. The author named in each lesson file is:

| Lessons | Author named in the lesson file |
|-|-|
| 01, 02, 03, 04, 05, 06, 07, 10, 13, 16, 25 | Drupad Trivedi |
| 08, 09, 11, 12, 14, 15, 17, 22, 23 | Swirl Coders, edited by Drupad Trivedi |
| 18, 24 | Swirl Coders |
| 19, 20, 21 | Nick Carchedi (Johns Hopkins University, Biostatistics) |

The menu entry for lesson 03 also notes that it is adapted from the basic building blocks of R lesson.

### Licence

The full licence notice is in `LICENSE.txt` in the course folder. In summary:

Chemometrics DL, copyright © 2026 Drupad Trivedi, The University of Manchester. All rights reserved.

1. **Permitted use.** This material is provided to students enrolled on the relevant course at the University of Manchester, for their own personal study on that course.
2. **Not permitted.** Without prior written permission from the author and the University of Manchester, you may not copy, share, publish, upload, redistribute, sell or reuse this material, in whole or in part, or any adaptation of it, outside the course.
3. **Third-party content.** Some lessons include material by the original authors of swirl and its course materials. Those parts remain subject to the terms set by their authors.
4. **No warranty.** The material is provided as it is, with no warranty of any kind.
5. **Permissions.** To request permission, email drupad.trivedi@manchester.ac.uk.

### Contact

Drupad Trivedi, The University of Manchester: <drupad.trivedi@manchester.ac.uk>

For course discussions, use the Canvas discussion boards. For problems with the course itself, email the address above and include the lesson number and a copy of any red error text, with no personal information in it.

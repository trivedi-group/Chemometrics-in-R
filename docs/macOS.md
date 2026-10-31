# Chemometrics in R: setting up on macOS

[Back to the main guide](../README.md) | [Windows](Windows.md) | [macOS](macOS.md) | [Linux](Linux.md)

This guide takes you from nothing to your first lesson on a Mac. It assumes you have never used R. Follow the steps in order.

**Data protection reminder.** Never type personal information about yourself or anyone else into any online tool, prompt or free-text box. Follow the GDPR and the University of Manchester's data protection policies. Always double-check anything an online tool tells you before relying on it.

## Step 1: Install R 4.5.3

This course was tested from start to finish on **R 4.5.3**. Please install exactly that version, **not** the newest release, even though the CRAN front page offers a newer one. Newer versions have not been tested with these lessons.

1. Find out which kind of Mac you have. Click the Apple menu, then **About This Mac**. If it says **Chip** with M1, M2, M3 or later, you have **Apple silicon**. If it says **Processor** with Intel, you have an **Intel** Mac.
2. Download the file for your Mac. Both are for macOS 11 (Big Sur) or higher, according to the CRAN folder names.
   - **Apple silicon Macs:** <https://cran.r-project.org/bin/macosx/big-sur-arm64/base/R-4.5.3-arm64.pkg>
   - **Intel Macs:** <https://cran.r-project.org/bin/macosx/big-sur-x86_64/base/R-4.5.3-x86_64.pkg>
3. Open the downloaded `.pkg` file and follow the installer, accepting the defaults. Enter your Mac password when asked.
4. The CRAN macOS page warns that if you install from the **Downloads** folder, you must allow the Apple Installer access to that folder. If the installer cannot open the file, move the `.pkg` to your home folder and open it from there.
5. You do **not** need Xcode or XQuartz for this course. If R ever asks for the "command line developer tools", you can accept them, but you do not need them unless a package fails to install.
6. Later, if anything suggests updating R, **do not**. Stay on 4.5.3 for this course.

## Step 2: Install RStudio

R must be installed **before** RStudio. RStudio does not include R.

1. Go to the RStudio Desktop download page: <https://docs.posit.co/ide/user/download.html>
2. Download the macOS installer. At the time of writing the direct link is <https://download1.rstudio.org/electron/macos/RStudio-2026.10.1-239.dmg>. One file covers both Apple silicon and Intel. The page lists macOS 15 or later as supported.
3. If your Mac is older than macOS 15, the page of earlier versions may help: <https://docs.posit.co/previous-versions/rstudio/>. Otherwise you can use R without RStudio, using the **R** app that came with the R installer, and type the same commands there.
4. RStudio Desktop is free and open source. You do **not** need a paid licence.
5. Open the `.dmg` and drag the RStudio icon into the **Applications** folder.
6. Open **RStudio** from Applications. If macOS asks whether you are sure you want to open it, choose **Open**. If RStudio says it cannot find R, close it and check that Step 1 finished.

## Step 3: Choose a working folder

At the end of each lesson, swirl saves an R script of that lesson into your **working folder**. Choose a folder you can find easily.

1. Create a new folder called `Chemometrics` in your home folder. Avoid Documents and Desktop, because these are often synced to iCloud Drive.
2. In RStudio, click **Session**, then **Set Working Directory**, then **Choose Directory...**, select your new folder and click **Open**.
3. To check, type `getwd()` in the Console and press Enter. It prints the folder path.

You will need to repeat this each time you open RStudio, unless you set a default under **Tools**, then **Global Options**, then **General**.

### Find your way around RStudio

When RStudio opens you will see several panes. You only need one for this course, the **Console**, usually at the bottom left. It shows a `>` symbol, called the **prompt**. Click in the Console, type a command after the `>`, and press **Enter**.

Test it. Type the following and press Enter:

```
1 + 1
```

You should see `[1] 2`. R is working.

- The **Plots** pane (usually bottom right) shows the graphs that the lessons draw. Click **Zoom** to enlarge one.
- Press the **Esc** key to interrupt R if something seems stuck.

## Step 4: Install the packages the course needs

Packages are add-ons for R. You install each one **once** per computer, using the Console.

### Option A: use the install script (easiest)

1. Download the course from this repository as described in Step 5 below. If your browser unzipped it for you, double-click the zip if you still have it, or use the unzipped folder directly. Keep a zip copy too, because swirl needs the zip itself in Step 5.
2. In RStudio, click **File**, then **Open File...**, find `install_packages.R` in the unzipped folder (it may be inside a second folder of the same name) and click **Open**.
3. Click inside the script, then click the **Source** button at the top right of the script window. This runs every line.
4. Watch the Console. Installation takes **several minutes**, and `tidyverse` is the slowest. Wait until the `>` prompt comes back after each package.
5. **Important:** when installing `mixOmics`, R may ask:

   ```
   Update all/some/none? [a/s/n]:
   ```

   Type `n` and press Enter.
6. If R asks `Do you want to install from sources the packages which need compilation?` type `no` and press Enter (Windows and macOS). This keeps the installation fast.
7. If R asks you to pick a CRAN mirror, choose any location close to you, for example one in the United Kingdom.

### Option B: type the commands yourself

Copy each line into the Console, press Enter, and wait for the `>` prompt to return before pasting the next. Do them in order.

```
install.packages("swirl")
install.packages("BiocManager")
BiocManager::install("mixOmics")
install.packages("ggpubr")
install.packages("dplyr")
install.packages("magrittr")
install.packages("ggplot2")
install.packages("e1071")
install.packages("caret")
install.packages("tidyverse")
install.packages("randomForest")
install.packages("rpart")
```

Remember to answer `n` if asked `Update all/some/none?`.

### Check that it worked

Type this in the Console and press Enter:

```
library(swirl)
```

If you see no red error message, swirl is installed. A message saying `there is no package called 'swirl'` means the first command did not finish, so run `install.packages("swirl")` again and read the red text for hints.

To check all the packages at once:

```
sapply(c("swirl","mixOmics","ggpubr","dplyr","magrittr","ggplot2","e1071","caret","tidyverse","randomForest","rpart"), requireNamespace, quietly = TRUE)
```

Every item should show `TRUE`. Any `FALSE` shows a package to install again.

## Step 5: Download the course from this repository and install it into swirl

1. Open the course page: <https://github.com/trivedi-group/Chemometrics-in-R>. You do not need a GitHub account to download the course. If the page says it cannot be found, tell your lecturer.
2. Leave the branch as the default, **main**.
3. Click the green **Code** button, then **Download ZIP**. You can also download it directly here: <https://github.com/trivedi-group/Chemometrics-in-R/archive/refs/heads/main.zip>
4. **Safari warning.** Safari often unzips downloads automatically and throws the zip away, leaving only a folder. swirl needs the zip. Either download with Chrome or Firefox, or in Safari open **Safari**, then **Settings**, then **General**, and untick **Open safe files after downloading**, then download again. Alternatively, right-click the unzipped folder in Finder and choose **Compress**.
   If iCloud Drive backs up your Downloads, Desktop or Documents folders, copy the zip to a folder in your home folder, such as `~/Chemometrics`, and install from there.
5. In the RStudio Console, type these two lines, pressing Enter after each:

   ```
   library(swirl)
   install_course_zip(file.choose())
   ```

6. A file window opens. Find the downloaded zip file, usually called `Chemometrics-in-R-main.zip`, select it and click **Open**.
7. Wait for swirl to finish. The course will appear in swirl with a name that starts with **Chemometrics-in-R** and ends with the branch name, for example **Chemometrics-in-R-main**. Choose that one when swirl lists the courses.

If the file window does not appear, give R the path instead. Use forward slashes and put the path in quotation marks:

```
install_course_zip("/Users/yourname/Downloads/Chemometrics-in-R-main.zip")
```

Replace `yourname` with your Mac user name. A quick way to get the path is to hold the **Option** key, right-click the file in Finder, and choose **Copy as Pathname**.

If you install the course twice you will see two courses in the menu. This is harmless. You can remove one with `uninstall_course("name")`, replacing `name` with the course name exactly as swirl shows it.

To update the course later, download the newer zip from the repository and install it in the same way.

## Step 6: Start the course

Go to **[Start the course](../README.md#part-2-start-the-course)** in the main guide and follow it from there. It also explains how a lesson works, how to stop and resume, and how to send your reflection.

## macOS problems

**The installer says it cannot be opened.**
Move the `.pkg` file out of **Downloads** into your home folder and open it again. See Step 1.

**I only have a folder, no zip file.**
This is Safari unzipping the download. See Step 5.

**R or RStudio asks to install developer tools.**
You can accept, but you only need them if a package later fails to compile.

**Installing, saving or running lessons gives timeouts, "cannot open file" or "permission denied" errors, and my folders sync to the cloud (OneDrive, iCloud Drive, Dropbox, Google Drive).**
Cloud sync can lock or delay a file while R is reading or writing it. Keep everything the course touches on your own disk.

1. Move the downloaded zip to a local folder before installing. Create a folder in your home folder, such as `~/Chemometrics`, copy the zip there, and run `install_course_zip()` on that copy. If the zip shows a cloud icon, click the cloud icon in Finder, or right-click it and choose **Download Now**, and wait until the icon changes.
2. Use that same local folder as your working folder (see Step 3 of your system guide). If your working folder is cloud-synced, the lesson saves the script in a local folder instead and tells you where.
3. Check where R keeps its packages by typing `.libPaths()`. swirl and the course are installed inside that library. If a path contains OneDrive, iCloud, Dropbox or Google Drive, make a local library and put it first:

```
dir.create("~/Rlibs", showWarnings = FALSE)
.libPaths(c("~/Rlibs", .libPaths()))
```

   Then install `swirl` and the course packages again. To make this permanent, type `file.edit("~/.Renviron")`, add the line `R_LIBS_USER=~/Rlibs` on its own line, save, and restart R.
4. If errors continue, pause cloud sync for an hour while you install the course, then resume it.

For lesson problems, see **Common problems and fixes** in the [main guide](../README.md#part-9-common-problems-and-fixes).

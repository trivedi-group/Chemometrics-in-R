# Chemometrics DL: setting up on Windows

[Back to the main guide](../README.md) | [Windows](Windows.md) | [macOS](macOS.md) | [Linux](Linux.md)

This guide takes you from nothing to your first lesson on a Windows computer. It assumes you have never used R. Follow the steps in order.

**Data protection reminder.** Never type personal information about yourself or anyone else into any AI tool, prompt or free-text box. Follow the GDPR and the University of Manchester's data protection policies. Always double-check anything an AI tool tells you before relying on it.

> **Honest note on testing.** Every lesson was run from start to finish on Linux with R 4.5.3. These Windows steps follow the standard installation routes and were checked against the CRAN and Posit pages, but the author did not run them on a Windows computer. If a screen looks slightly different, follow the same idea and tell your lecturer what differed.

## Step 1: Install R 4.5.3

This course was tested from start to finish on **R 4.5.3**. Please install exactly that version, **not** the newest release, even though the CRAN front page offers a newer one. Newer versions have not been tested with these lessons.

1. Go to the page for this exact version: <https://cran.r-project.org/bin/windows/base/old/4.5.3/>
2. Click **R-4.5.3-win.exe** (about 86 MB). The direct link is <https://cran.r-project.org/bin/windows/base/old/4.5.3/R-4.5.3-win.exe>
3. Double-click the downloaded `.exe`. If Windows asks whether to allow changes, choose **Yes**.
4. Choose your language and click **Next** through the screens. The default options are fine. Click **Finish**.
5. Windows 10 or later is the safe choice. The CRAN page for the newest R states that its Windows build needs UCRT, which is part of Windows 10 and later. The page for 4.5.3 does not repeat this, so if you have an older Windows, read the README link in the same CRAN folder.
6. You do **not** need to install Rtools for this course. Rtools is only for building packages from source, and every package here installs as a ready-made binary.
7. Later, if RStudio or Windows suggests updating R, **do not**. Stay on 4.5.3 for this course.

## Step 2: Install RStudio

R must be installed **before** RStudio. RStudio does not include R.

1. Go to the RStudio Desktop download page: <https://docs.posit.co/ide/user/download.html>
2. Download the Windows installer. At the time of writing the direct link is <https://download1.rstudio.org/electron/windows/RStudio-2026.10.1-239.exe>. Windows 11 is the listed supported version. A zip version that needs no installation is also on the page.
3. RStudio Desktop is free and open source. You do **not** need a paid licence.
4. Double-click the installer and accept the defaults.
5. Open **RStudio** from the Start menu. If it says it cannot find R, close it and check that Step 1 finished.

## Step 3: Choose a working folder

At the end of each lesson, swirl saves an R script of that lesson into your **working folder**. Choose a folder you can find easily.

1. Create a new folder, for example `Chemometrics`, inside your Documents folder.
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

1. Download the course from this repository as described in Step 5 below, then **right-click the downloaded zip, choose Extract All...**, and click **Extract**. This gives you a normal folder. Keep the original zip file too, because swirl needs the zip itself in Step 5.
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
install.packages("jpeg")
install.packages("fields")
install.packages("caret")
install.packages("tidyverse")
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
sapply(c("swirl","mixOmics","ggpubr","dplyr","magrittr","ggplot2","e1071","jpeg","fields","caret","tidyverse"), requireNamespace, quietly = TRUE)
```

Every item should show `TRUE`. Any `FALSE` shows a package to install again.

## Step 5: Download the course from this repository and install it into swirl

1. Open the course page: <https://github.com/drupadt/Chemometrics_DL>. If GitHub says the page cannot be found, sign in to GitHub first, and make sure your lecturer has given you access using the link they shared with you.
2. Make sure the branch shown at the top left of the file list is **2026**. If it says `main`, click it and choose `2026`.
3. Click the green **Code** button, then **Download ZIP**. You can also download it directly here: <https://github.com/drupadt/Chemometrics_DL/archive/refs/heads/2026.zip>
4. Do **not** unzip the file you will give to swirl. Windows saves it in your **Downloads** folder by default.
5. In the RStudio Console, type these two lines, pressing Enter after each:

   ```
   library(swirl)
   install_course_zip(file.choose())
   ```

6. A file window opens. Find the downloaded zip file, usually called `Chemometrics_DL-2026.zip`, select it and click **Open**.
7. Wait for swirl to finish. The course will appear in swirl with a name that starts with **Chemometrics DL** and ends with the branch name, for example **Chemometrics DL-2026**. Choose that one when swirl lists the courses.

If the file window does not appear, give R the path instead. Use forward slashes and put the path in quotation marks:

```
install_course_zip("C:/Users/yourname/Downloads/Chemometrics_DL-2026.zip")
```

Replace `yourname` with your Windows user name. Do not use backslashes in the path. If you must, double them, like `C:\\Users\\yourname\\Downloads`.

If you install the course twice you will see two courses in the menu. This is harmless. You can remove one with `uninstall_course("name")`, replacing `name` with the course name exactly as swirl shows it.

To update the course later, download the newer zip from the repository and install it in the same way.

## Step 6: Start the course

Go to **[Start the course](../README.md#part-2-start-the-course)** in the main guide and follow it from there. It also explains how a lesson works, how to stop and resume, and how to send your reflection.

## Windows problems

**The `install.packages` command says a package is not available for this version of R.**
This usually means a typing error in the name. Copy the command from this guide instead of typing it.

**Windows warns that the file could be harmful.**
Only download the course from the repository address in this guide, and keep the file only if you downloaded it yourself from there.

**Rtools is mentioned in a message.**
You can ignore it for this course unless a package fails with a message about compiling. Reply `no` when R offers to install from source.

For lesson problems, see **Common problems and fixes** in the [main guide](../README.md#part-9-common-problems-and-fixes).

# Chemometrics DL: setting up on Linux

[Back to the main guide](../README.md) | [Windows](Windows.md) | [macOS](macOS.md) | [Linux](Linux.md)

This guide takes you from nothing to your first lesson on Linux. It assumes you have never used R, but it also assumes you can open a terminal and use `sudo`. Follow the steps in order.

**Data protection reminder.** Never type personal information about yourself or anyone else into any online tool, prompt or free-text box. Follow the GDPR and the University of Manchester's data protection policies. Always double-check anything an online tool tells you before relying on it.

> **Honest note on testing.** Every lesson was run from start to finish on Linux with R 4.5.3 on an ARM processor, from a command-line R session. The RStudio and rig steps below come from their own pages and were not run by the author on each distribution. If something differs on your system, follow the CRAN instructions for your distribution.

## Step 1: Install R 4.5.3

This course was tested from start to finish on **R 4.5.3**. Please install exactly that version, **not** the newest release, even though the CRAN front page offers a newer one. Newer versions have not been tested with these lessons.

On Linux, the easiest way to get an exact version is **rig**, the R Installation Manager, which is a free tool from the R community.

1. Install rig by following its instructions: <https://github.com/r-lib/rig> (full documentation: <https://r-lib.github.io/rig/>).
2. Then install and select R 4.5.3:

   ```
   rig add 4.5.3
   rig default 4.5.3
   ```

3. Check it worked. In a terminal, type `R` and press Enter. The start-up message should say **R version 4.5.3**. Type `q()` and press Enter, then `n` if asked about saving, to leave R.

**If rig cannot install 4.5.3 on your distribution.** The author could not test every distribution. In that case, use the closest R 4.5 release you can get and tell your lecturer which version you used. Only as a last resort, install R from your distribution's normal repository (for example `sudo apt install r-base r-base-dev` on Ubuntu or Debian, or `sudo dnf install R` on Fedora). That route gives you the newest R your distribution offers, which has **not** been tested with this course. The CRAN pages for each distribution are:

- Ubuntu: <https://cran.r-project.org/bin/linux/ubuntu/>
- Debian: <https://cran.r-project.org/bin/linux/debian/>
- Fedora: <https://cran.r-project.org/bin/linux/fedora/>
- Red Hat, CentOS and similar: <https://cran.r-project.org/bin/linux/redhat/>

The development tools are needed to build some packages. On Ubuntu and Debian, install them with `sudo apt install build-essential`.

## Step 2: Install RStudio (recommended)

1. Go to the RStudio Desktop download page: <https://docs.posit.co/ide/user/download.html>
2. RStudio Desktop is free and open source. You do **not** need a paid licence.
3. Download the file for your distribution. At the time of writing the page lists the following for 64-bit Intel/AMD computers:
   - Ubuntu 22, 24 and 26, and Debian 13: the `.deb` file, for example <https://download1.rstudio.org/electron/jammy/amd64/rstudio-2026.10.1-239-amd64.deb>
   - Red Hat 9 and 10, and Fedora: the `.rpm` file, for example <https://download1.rstudio.org/electron/rhel9/x86_64/rstudio-2026.10.1-239-x86_64.rpm>
4. Install it from the folder where you saved it. Replace the file name with the one you downloaded.

   ```
   sudo apt install ./rstudio-2026.10.1-239-amd64.deb
   ```

   or, on Fedora and Red Hat:

   ```
   sudo dnf install ./rstudio-2026.10.1-239-x86_64.rpm
   ```
5. Open **RStudio** from your application launcher.

**No RStudio for your computer?** The page lists RStudio for 64-bit Intel/AMD Linux. On other processors, or if you prefer, you can use R in a terminal. Everything in this course works there. Start it by typing `R`, then type the same commands in the same way. Ignore the RStudio-only instructions below about panes and menus.

## Step 3: Choose a working folder

At the end of each lesson, swirl saves an R script of that lesson into your **working folder**. Choose a folder you can find easily.

1. Create a new folder, for example `Chemometrics`, inside your Documents folder.
2. In RStudio, click **Session**, then **Set Working Directory**, then **Choose Directory...**, select your new folder and click **Open**. If you use R in a terminal instead, open the terminal in your folder first with `cd ~/Documents/Chemometrics` and then start `R`.
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

## Before you install packages: system libraries

On Linux, R packages are often built from source, and this fails if system libraries are missing. If an installation stops with a message such as `fatal error: ... .h: No such file or directory` or `Configuration failed because ... was not found`, install the library it names. On Ubuntu and Debian this set covers most of the course packages:

```
sudo apt install build-essential libcurl4-openssl-dev libssl-dev libxml2-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff-dev libjpeg-dev libcairo2-dev
```

Package names vary between releases, so treat this as a starting point. On Fedora and Red Hat the equivalents end in `-devel`, for example `libcurl-devel`. Then run the failed `install.packages(...)` command again.

## Step 4: Install the packages the course needs

Packages are add-ons for R. You install each one **once** per computer, using the Console.

### Option A: use the install script (easiest)

1. Download the course from this repository as described in Step 5 below, then unzip a **copy** of it, for example with `unzip Chemometrics_DL-main.zip` in a terminal or by right-clicking it in your file manager. Keep the original zip too, because swirl needs the zip itself in Step 5.
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

1. Open the course page: <https://github.com/drupadt/Chemometrics_DL>. You do not need a GitHub account to download the course. If the page says it cannot be found, tell your lecturer.
2. Leave the branch as the default, **main**.
3. Click the green **Code** button, then **Download ZIP**. You can also download it directly here: <https://github.com/drupadt/Chemometrics_DL/archive/refs/heads/main.zip>
4. Do **not** unzip the file you will give to swirl. A browser usually saves it in your **Downloads** folder.
5. In the RStudio Console, type these two lines, pressing Enter after each:

   ```
   library(swirl)
   install_course_zip(file.choose())
   ```

6. A file window opens. Find the downloaded zip file, usually called `Chemometrics_DL-main.zip`, select it and click **Open**.
7. Wait for swirl to finish. The course will appear in swirl with a name that starts with **Chemometrics DL** and ends with the branch name, for example **Chemometrics DL-main**. Choose that one when swirl lists the courses.

If the file window does not appear, give R the path instead. Use forward slashes and put the path in quotation marks:

```
install_course_zip("/home/yourname/Downloads/Chemometrics_DL-main.zip")
```

Replace `yourname` with your user name. In a terminal R session `file.choose()` asks you to type the path instead of showing a window, so give the path directly as above.

If you install the course twice you will see two courses in the menu. This is harmless. You can remove one with `uninstall_course("name")`, replacing `name` with the course name exactly as swirl shows it.

To update the course later, download the newer zip from the repository and install it in the same way.

## Step 6: Start the course

Go to **[Start the course](../README.md#part-2-start-the-course)** in the main guide and follow it from there. It also explains how a lesson works, how to stop and resume, and how to send your reflection.

## Linux problems

**A package fails with a compile error.**
Install the missing system library. See the section above.

**RStudio will not start, or I have no graphical desktop.**
Use R in a terminal. Plots may not open without a graphical desktop. Lessons that draw graphs need a screen.

For lesson problems, see **Common problems and fixes** in the [main guide](../README.md#part-9-common-problems-and-fixes).

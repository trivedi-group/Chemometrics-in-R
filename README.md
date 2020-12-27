# Chemometrics_DL
This is a course repository for interactive exercises designed to go along with tutorials and taught videos designed as part of distance learning course at the University of Manchester. 


## installing swirl

Open RStudio (or just plain R if you don't have RStudio) and type the following into the console:

> install.packages("swirl")

## installing chemometrics course

The first time you start swirl, you'll be prompted to install a course. You can install one of the recommended courses following these steps. All the courses for this unit are found at: https://github.com/drupadt/Chemometrics_DL

* Go to Github link https://github.com/drupadt/Chemometrics_DL 
* Locate the green button that says “Code” and click on it.
* When you click on the “Code” button, you will see a dropdown menu.
* Click on Download Zip (the last option) from the dropbox menu.
* The zip file will download in Documents/Downloads folder of your Windows/Mac/Linux machine depending on your browser settings.
* Locate the zip and move it to Desktop
* Now you are ready to install this course in R.
* In your R console, write the following command and hit enter:

> install_course_zip(file.choose())

* You will see a file chooser window pop-up. Select Chemometrics_DL-main.zip that you moved to Desktop.
* Now assuming you have already installed swirl, type the following in console and

>library(swirl) 
> swirl()

* When it prompts you with " Welcome to swirl! Please sign in. If you've been here before, use the same name as you did then. If you are new, call yourself something unique." Type back your name and hit enter.

* On being prompted with the following question, follow the prompts to launch course “Chemometrics_DL-main”:
| Please choose a course, or type 0 to exit swirl.

* Once you have successfully launched the course, you will be prompted to select a lesson you want to work through. Choose recommend lesson topic and work through the lesson at your own pace.


## troubleshooting

Use Blackboard discussion boards to post issues. If you know an answer to posted issue, please feel free to help others get started.

## for troubles

If you are stuck and there is no help at all, anywhere - drop an email to drupad dot trivedi at manchester dot ac dot uk.

Last edit from RStudio 27122020_131900_v1

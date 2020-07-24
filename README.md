# Five Minute Flask Application

The goal of this document and the accompanying video for PyOhio 2020 is to allow you to create, and run a super basic flask application in 5-minutes or less and have a general understanding of what each component in the application is doing.

This is written and tested on a Mac running Mojave and BASH shell. So, it may work on a PC or Linux machine with the occaisional tweak the Bash script. You may also need to tweak it if you are working on Catalina as it uses `Zsh` flavor of shell which is not 100% compatible with Bash.
## The Website
We will builds a very simple site with  

- one python script called lighting-app.py containing  
	- 1 function which will load the S & P stock data & select 10 at random returning a pandas table (and lists as well for you to play with on your own later)  
  - one url decorator (pointing to the home page)  
  - a function which calls the `index.html` and renders the page  
- -one `index.html` template
- one `main.css` style sheet

## Setting Up Your Working Environment
 Use Git to download the two necessary files to your desired working folder using the commandline:
 
  `git clone https://github.com/bpoulin81/lightning-flask.git`

Once you have downloaded the repository, cd into the folder and then type `ls` you should see two files:  

#### 1. A tab delimited file of all the equities in the S & P 500  called `s-n-p.txt` holding 3 fields   
 - **Ticker Symbol**   
 - **Company Name**  
 - **Equity Category**

#### 2. A bash script called `setup.command` which when executed  will:

 1. Create a virtual environment to house this flask application
 2. Activate the environment
 3. Install flask, numpy & pandas in that environment
 4.  Deactivate the environment
 5. Create an `app` directory  
 6.  `lighting-app.py` in app directory & poppulate it with python code
 7. Create `static` directory adjacent to `lightning-app.py` 
8. Create `data` directory  witin `static` directory
9. Move s-n-p.txt which came from github to  `static/data` directory 
10. Create	`css` directory within `static` director  
11. Create `main.css` with style for the site    
12. Create  `templates` directory parallel to `static` & lightning-app.py`
13. generate `index.html` with appropriate *html* and Jinja templating markup

### Executing `Bash` script

Once you can see the two files, `s-n-p.txt` and `setup.command` using ls, you are ready to roll. 

**Type `bash setup.command` into your terminal and bash will go to work building the items above.


### Running Your Flask Application

1. `cd` into your working folder and type `source flaskenv/bin/activate` to fire up your virtual environment with flask, pandas and numpy already installed
2. type `cd app` to move into your actual application
3. type `export FLASK_APP=lightning-app.py` to point `flask` to your main application
4. type `flask run` into your terminal

At this point, if I have done my job, and you have done yours...and the Python gods are smiling on us both you should see something like:

`**Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)** `

If you copy the url into your browser `http://127.0.0.1:5000` (yours might be different) you should see our simple website pop up.

There is enough data, python, html, css and Jinja here that you can play with and see if you can add pages, function and content on your own. And if you really get brave try to push it out live to python anywhere!

**House Keeping Note** You can exit the flask server by pressing `CTRL + C` on your keyboard . Also, remember to type `deactivate` into the terminal after you quit the application to terminate your virtual environment.

  
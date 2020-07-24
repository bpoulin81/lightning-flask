#~ /bin/bash

python3 -m venv flaskenv
source flaskenv/bin/activate
pip install flask
pip install numpy
pip install pandas
deactivate
mkdir app
cd app
echo 'from flask import Flask, request, render_template
import numpy as np
import pandas as pd
from numpy import random
import os

def random_snp_suggester():
    site_root = os.path.realpath(os.path.dirname(__file__))
    filename = os.path.join(site_root, "static/data", "s-n-p.txt")
    snp = pd.read_table(filename)
    rows = random.choice(range(0,len(snp["Symbol"])), size=10)
    stocks = snp.loc[rows,]
    symbol = stocks["Symbol"]
    company = stocks["Company"]
    sector = stocks["Sector"].unique()
    return (stocks, symbol.tolist(), company.tolist(), sector.tolist())

app = Flask(__name__)



@app.route("/")
def index():
    snp, symbols, companies, sectors = random_snp_suggester()
    return render_template("index.html",  tables=[snp.to_html(classes="table", index=False)])



if __name__ == "__main__":
  app.run()' > lightning-app.py
  

mkdir static
cd  static
mkdir data
mv ../../s-n-p.txt data/s-n-p.txt
mkdir css
echo 'header {
  background-color: #DFB887;
  height: 35px;
  width: 100%;
  opacity: .9;
  margin-bottom: 10px;
}

body {
  margin: 0;
  padding: 0;
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  color: #444;
}

h3 {
  font-size: 2em;
  font-weight: 100;
  margin-top: 30px;
  text-align: center;
  letter-spacing: -1px;
  color: #999;
}

.table {
    margin-left:auto; 
    margin-right:auto;
  }

th{
  background-color: #8B008B;
  color: white;
}


tr:nth-child(even) {
background-color: #ffedff;
}

th, td {
  padding: 15px;
  text-align: left;
}' > css/main.css

cd ../
mkdir templates
echo "<html lang=\"en\">
  <head>
    <meta charset=\"utf-8\">
    <title>title</title>
        <link rel=stylesheet href=\"{{ url_for('static', filename='css/main.css') }}\">
  </head>
  <body>
    <h3> Table of 10 Random S & P 500 Equities</h3>  
      {% for table in tables %}
            {{ table|safe }}
      {% endfor %}
  </body>
</html>" > templates/index.html




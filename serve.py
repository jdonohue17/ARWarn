

from flask import Flask
from flask import render_template

app = Flask(__name__)

@app.route("/")
def display():
	return render_template('Index.html')

if __name__ == "__main__":
	app.run(debug=True)



from datetime import datetime, timezone
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    date = datetime.now()
    str = "Hello, Bogomolove!"
    return date.strftime(f"{str} <br> date:%d/%m/%y  <br> time:   %H:%M:%S")



if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5001)


# from flask import Flask

# app = Flask(__name__)

# @app.route("/")
# def hello():
#     return "OLEKSANDR SOSI HUI )))))"

# if __name__ == "__main__":
#     app.run(host="0.0.0.0", port=8080)


from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return """
    <html>
    <head>
        <style>
            body {
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f0f0f0;
                font-family: sans-serif;
            }
            h1 {
                font-size: 14vw;
                text-align: center;
                color: #000000;
                text-transform: uppercase;
            }
        </style>
    </head>
    <body>
        # <h1>АLEKSANDR SOSI HUI )))))</h1>
        <h1>DevSecProject is running!!!!</h1
    </body>
    </html>
    """

if __name__ == "__main__":

    app.run(host="0.0.0.0", port=8080)


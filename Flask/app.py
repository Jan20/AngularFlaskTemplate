from flask import Flask
from waitress import serve

app = Flask(__name__)


@app.after_request
def add_access_control_headers(response):
    """ Adds access control headers
    """
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Methods"] = "GET, HEAD, OPTIONS, POST, PUT"
    return response


@app.route('/')
def hello_world():
    """Sends a default 'Hello World' message
    """
    return {"message": "Hello World from Flask"}


if __name__ == '__main__':
    serve(app, host="0.0.0.0", port=8080)

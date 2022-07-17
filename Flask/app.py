from flask import Flask
from waitress import serve

app = Flask(__name__)


@app.route('/')
def hello_world():
    """Sends a default message stating 'Hello Angular + Flask'."""
    return {"message": "Hello Angular + Flask"}


if __name__ == '__main__':
    serve(app, host="0.0.0.0", port=8080)

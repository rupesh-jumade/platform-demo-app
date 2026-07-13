from flask import Flask
from pathlib import Path

app = Flask(__name__)


@app.route("/")
def home():
    return {
        "message": "Platform Demo App v2"
    }


@app.route("/health")
def health():
    return {
        "status": "healthy"
    }


@app.route("/version")
def version():
    version_file = Path("version.txt")

    return {
        "version": version_file.read_text().strip()
    }


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

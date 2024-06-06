# FastAPI Goose3 HTML Content Extractor

This project is a REST API service built with FastAPI that extracts and returns cleaned text from HTML content using the Goose3 library.

## Features

- Accepts HTML content via a POST request.
- Extracts and returns the main text content from the HTML.
- Simple and fast implementation using FastAPI and Goose3.

## Requirements

- Python 3.8+
- FastAPI
- Goose3
- Uvicorn

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/rbehzadan/extract-text-api.git
    cd extract-text-api
    ```

2. Create a virtual environment and activate it:

    ```bash
    python -m venv venv
    source venv/bin/activate
    ```

3. Install the dependencies:

    ```bash
    pip install -r requirements.txt
    ```

## Running the Application

Start the FastAPI application using Uvicorn:

```bash
uvicorn main:app --host 0.0.0.0 --port 8000 --workers 4
```

## Usage

Send a POST request to `/extract-text` with the HTML content in the request body:

```json
POST /extract-text
Content-Type: application/json

{
  "content": "<html><body><h1>Sample Article</h1><p>This is a sample paragraph.</p></body></html>"
}
```

The API will return a JSON response with the cleaned text:

```json
{
  "text": "Sample Article\nThis is a sample paragraph."
}
```

## Docker

To run the application using Docker:

1. Build the Docker image:

    ```bash
    docker build -t extract-text-api .
    ```

2. Run the Docker container:

    ```bash
    docker run -d -p 8000:8080 extract-text-api
    ```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes.
